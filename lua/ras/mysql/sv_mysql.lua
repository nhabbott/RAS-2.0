RAS.MySQL = nil

// Initializes DB connection and registers network strings
RAS.ConnectToDatabase = function()
  local allthenetworkstrings = {
    "SendNotification",
    "NotifyButtonCallback",
    "BanUser",
    "UnBanUser",
    "ExemptUser",
    "UnExemptUser",
    "OpenMainMenu",
    "OpenBansMenu",
    "OpenSettingsMenu",
    "SaveConfig",
    "SettingMenu",
    "BanMenu",
    "MainMenu"
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
        hook.Run("RASConnectedToDatabaseError", RAS.MySQLError)
      else
        hook.Run("RASConnectedToDatabase")
      end
    end
  end
end

// Attempts to reconnect to DB after a failed connection
hook.Add("RASConnectedToDatabaseError", "RASConnectedToDatabaseErrorRedo", function(err)
  MsgC(Color(255,0,0), "RAS MySQL Connection Error: " .. err .. "\n")
  RAS.ConnectToDatabase()
end)

// Inititalizes DB if RAS is on first run
hook.Add("RASConnectedToDatabase", "RASConnectedToDatabaseCreateTable", function() 
  if RAS.Config.FirstRun then  
    RAS.MySQLToCreate = [[CREATE TABLE IF NOT EXISTS `exemptplayers` ( 
        `id` int NOT NULL AUTO_INCREMENT,
        `bsid` varchar(17) NOT NULL, 
        `asid` varchar(17) NOT NULL,
        `reason` varchar(255) NOT NULL,
        `type` text(7) NOT NULL, 
        `expire_time` timestamp,
        PRIMARY KEY (`id`) 
      ) ENGINE=MyISAM CHARSET=utf8 COLLATE utf8_general_ci; 
      
      CREATE TABLE IF NOT EXISTS `bannedplayers` (
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
    file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
  end
  MsgC(Color(0,255,0), "RAS Connected to MySQL!\n")
end)