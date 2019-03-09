RAS.MySQL = nil

RAS.ConnectToDatabase = function()
  local allthenetworkstrings = {
    "SendNotification",
    "NotifyButtonCallback",
    "BanUser",
    "UnBanUser",
    "ExemptUser",
    "UnExemptUser",
    "OpenMainMenu"
  }
  for k, v in pairs(allthenetworkstrings) do
    util.AddNetworkString("RAS" .. v)
  end

  if RAS.MySQLInfo.SavingMethod == "mysqloo" then
    if tobool(pcall(require, "mysqloo")) then
      RAS.MySQL = mysqloo.connect(RAS.MySQLInfo.Host, RAS.MySQLInfo.User, RAS.MySQLInfo.Pass, RAS.MySQLInfo.Database, RAS.MySQLInfo.Port)
      function RAS.MySQL:onConnected()
        hook.Call("RASConnectedToDatabase")
      end
      function RAS.MySQL:onConnectionFailed(err)
        hook.Call("RASConnectedToDatabaseError", nil, err)
      end
      RAS.MySQL:setMultiStatements(true)
      RAS.MySQL:connect()
    end
  elseif RAS.MySQLInfo.SavingMethod == "tmysql4" then
    if pcall(require, "tmysql4") then
      require("tmysql4")
      RAS.MySQL, RAS.MySQLError = tmysql.initialize(RAS.MySQLInfo.Host, RAS.MySQLInfo.Username, RAS.MySQLInfo.Password, RAS.MySQLInfo.Database, RAS.MySQLInfo.Port, nil, CLIENT_MULTI_STATEMENTS)
      if tostring(type(RAS.MySQL)) == "boolean" then
        hook.Call("RASConnectedToDatabaseError", nil, RAS.MySQLError)
      else
        hook.Call("RASConnectedToDatabase")
      end
    end
  end
end

hook.Add("RASConnectedToDatabaseError", "RASConnectedToDatabaseErrorRedo", function(err)
  MsgC(Color(255,0,0), "RAS MySQL Connection Error: " .. err .. "\n")
  RAS.ConnectToDatabase()
end)

hook.Add("RASConnectedToDatabase", "RASConnectedToDatabaseCreateTable", function() 
  if RAS.Config.FirstRun then  
    RAS.MySQLToCreate = [[CREATE TABLE `exemptplayers` ( 
        `id` int NOT NULL AUTO_INCREMENT,
        `bsid` varchar(17) NOT NULL, 
        `asid` varchar(17) NOT NULL,
        `reason` varchar(255) NOT NULL,
        `type` text(7) NOT NULL, 
        `expire_time` timestamp,
        PRIMARY KEY (`id`) 
      ) ENGINE=MyISAM CHARSET=utf8 COLLATE utf8_general_ci; 
      
      CREATE TABLE `bannedplayers` (
        `id` int NOT NULL AUTO_INCREMENT,
        `bsid` varchar(17) NOT NULL, 
        `asid` varchar(17) NOT NULL,
        `reason` varchar(255) NOT NULL,
        `type` text(7) NOT NULL, 
        `expire_time` timestamp,
        PRIMARY KEY (`id`) 
      ) ENGINE=MyISAM CHARSET=utf8 COLLATE utf8_general_ci;
      ]]
    RAS.QueryDatabase(RAS.MySQLToCreate, function(worked, result, lid) end)
    RAS.Config.FirstRun = false
    RAS.SaveConfig()
  end
  MsgC(Color(0,255,0), "RAS Connected to MySQL!\n")
end)