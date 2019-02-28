RAS.MySQL = nil

RAS.ConnectToDatabase = function()
  local allthenetworkstrings = {
    "SendNotification",
    "NotifyButtonCallback",
    "BanUser",
    "UnBanUser"
  }
  for k, v in pairs(allthenetworkstrings) do
    util.AddNetworkString("RAS" .. v)
  end

  if RAS.Config.SavingMethod == "mysqloo" then
    if tobool(pcall(require, "mysqloo")) then
      RAS.MySQL = mysqloo.connect(RAS.Config.MySQL.Host, RAS.Config.MySQL.User, RAS.Config.MySQL.Pass, RAS.Config.MySQL.Database, RAS.Config.MySQL.Port)
      function RAS.MySQL:onConnected()
        hook.Call("RASConnectedToDatabase")
      end
      function RAS.MySQL:onConnectionFailed(err)
        hook.Call("RASConnectedToDatabaseError", nil, err)
      end
      RAS.MySQL:connect()
    end
  elseif RAS.Config.SavingMethod == "tmysql4" then
    if pcall(require, "tmysql4") then
      require("tmysql4")
      RAS.MySQL, RAS.MySQLError = tmysql.initialize(RAS.Config.MySQL.Host, RAS.Config.MySQL.Username, RAS.Config.MySQL.Password, RAS.Config.MySQL.Database, RAS.Config.MySQL.Port, nil, CLIENT_MULTI_STATEMENTS)
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
  RAS.MySQLToCreate = [[CREATE TABLE `exemptplayers` ( 
    `id` int(11) NOT NULL,
    `bsid` varchar(17) NOT NULL, 
    `asid` varchar(17) NOT NULL,
    `reason` varchar(255) NOT NULL,
    `type` text(255) NOT NULL, 
    `expire_time` bigint NOT NULL 
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8; 
  
  CREATE TABLE `bannedplayers` (
    `id` int(11) NOT NULL,
    `bsid` varchar(17) NOT NULL, 
    `asid` varchar(17) NOT NULL,
    `reason` varchar(255) NOT NULL,
    `type` text(255) NOT NULL, 
    `expire_time` bigint NOT NULL
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

  ALTER TABLE `exemptplayers`
    ADD PRIMARY KEY (`id`);

  ALTER TABLE `bannedplayers`
    ADD PRIMARY KEY (`id`);

  ALTER TABLE `exemptplayers`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

  ALTER TABLE `bannedplayers`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;
  ]]
  RAS.QueryDatabase(RAS.MySQLToCreate, function(worked, result, lid) end)
  MsgC(Color(0,255,0), "RAS Connected to MySQL!\n")
end)