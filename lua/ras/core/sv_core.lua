local plymeta = FindMetaTable("Player")
local config = RAS.Config

RAS.EscapeString = function(string)
	if isstring(string) and RAS.MySQLInfo.SavingMethod == "tmysql4" then
		return RAS.MySQL:Escape(string)
	elseif isstring(string) and RAS.MySQLInfo.SavingMethod == "mysqloo" then
		return RAS.MySQL:escape(string)
	elseif istable(string) and RAS.MySQLInfo.SavingMethod == "mysqloo" then
		local newtable = {}
		for k, v in pairs(string) do
			if istable(v) then
				table.insert(newtable,#newtable + 1,RAS.EscapeString(v))
			else
				table.insert(newtable,#newtable + 1,RAS.MySQL:escape(v))
			end
		end
		return newtable
	elseif istable(string) and RAS.MySQLInfo.SavingMethod == "tmysql4" then
		local newtable = {}
		for k, v in pairs(string) do
			if istable(v) then
				table.insert(newtable,#newtable + 1,RAS.EscapeString(v))
			else
				table.insert(newtable,#newtable + 1,RAS.MySQL:Escape(v))
			end
		end
		return newtable
	end
end

RAS.QueryDatabase = function(thequery, callback)
	if thequery == nil then return end
	if callback == nil then return end
	if RAS.MySQL == nil then
		RAS.ConnectToDatabase()
	end
	if RAS.MySQLInfo.SavingMethod == "tmysql4" then
		RAS.MySQL:Query(thequery, function(result)
			if result[1].status then
				callback(true, result, nil)
			else
				callback(false, result[1].error, result[1].lastid or nil)
			end
		end)
	elseif RAS.MySQLInfo.SavingMethod == "mysqloo" then
		local query2 = RAS.MySQL:query(thequery)
		query2.onSuccess = function(q) callback(true, q:getData(), q:lastInsert() or nil) end
		query2.onError = function(q,e) callback(false, e, nil) end
		query2:start()
	end
end

RAS.NotifySystem = function(tosend, type, message, callback)
	if tosend == "*" then
		net.Start("RASSendNotification")
			net.WriteString(type)
			net.WriteString(message)
		net.Broadcast()
	elseif IsValid(tosend) then
		net.Start("RASSendNotification")
			net.WriteString(type)
			net.WriteString(message)
		net.Send(tosend)
	else
		MsgC(Color(255,0,0), "[", Color(255,255,255,255), "RAS Notification", Color(255,0,0), "] ", Color(255,255,255,255), message)
	end

	if type == "bool" then
		net.Receive("RASNotifyButtonCallback",function()
			local clicked = net.ReadBool()
			callback(clicked)
		end)
	end
end

RAS.SaveConfig = function()
	file.Write("ras/config.txt", util.TableToJSON(config))
	config = util.JSONToTable(file.Read("ras/config.txt", "DATA"))
end

RAS.GetBannedPlayers = function()
    return RAS.BannedEmployees
end

function plymeta:RASIsBanned(kind)
	for k, v in pairs(RAS.BannedPlayers) do
		if v.bsid == self:SteamID64() && v.kind == kind then
			return true
		end
	end
	return false
end

function plymeta:RASIsExempt(kind)
	for k, v in pairs(RAS.ExemptPlayers) do
		if v.bsid == self:SteamID64() && v.kind == kind then
			return true
		end
	end
	return false
end

function plymeta:RASGetBanReason()
	for k, v in pairs(RAS.BannedPlayers) do
		if v.bsid == self:SteamID64() then
			return v.reason
		end
	end
	return "N/A"
end

function RASPlayerInitialSpawnFunction(ply)
	local thedata = nil

	ply.ChatCooldown = os.time()
	ply.PropCooldown = os.time()
	ply.SentCooldown = os.time()
	ply.EffectCooldown = os.time()
	ply.RagdollCooldown = os.time()
	ply.VehicleCooldown = os.time()
	ply.NpcCooldown = os.time()

	for k, v in pairs(RAS.BannedPlayers) do
		if v.bsid == ply:SteamID64() then table.remove(RAS.BannedPlayers, k) end
	end

	RAS.QueryDatabase("SELECT * FROM `exemptplayers` WHERE `bsid` = '"..ply:SteamID64().."'", function(worked, result, lid)
		if result or result[1].affected == 1 then
			if RAS.MySQLInfo.SavingMethod == "tmysql4" then
				thedata = result[1].data[1]
			elseif RAS.MySQLInfo.SavingMethod == "mysqloo" then
				thedata = result[1]
			end
			if thedata == nil then 
				return
			else
				table.insert(RAS.ExemptPlayers, {bsid = ply:SteamID64(), name = ply:Nick(), asid = thedata.asid, kind = thedata.type, reason = thedata.reason})
			end
		end
		thedata = nil
	end)
	RAS.QueryDatabase("SELECT * FROM `bannedplayers` WHERE `bsid` = '"..ply:SteamID64().."'", function(worked, result, lid)
		if result or result[1].affected == 1 then
			if RAS.MySQLInfo.SavingMethod == "tmysql4" then
				thedata = result[1].data[1]
			elseif RAS.MySQLInfo.SavingMethod == "mysqloo" then
				thedata = result[1]
			end
			if thedata == nil then 
				return 
			else
				table.insert(RAS.BannedPlayers, {bsid = ply:SteamID64(), name = ply:Nick(), asid = thedata.asid, kind = thedata.type, reason = thedata.reason})
			end
		end
		thedata = nil
	end)
end

hook.Add("PlayerInitialSpawn", "RASPlayerInitialSpawn", function(ply)
	if RAS.MySQL == nil then
		timer.Simple(5, function()
			RASPlayerInitialSpawnFunction(ply)
		end)
	else
		RASPlayerInitialSpawnFunction(ply)
	end
end)

net.Receive("RASUnBanUser", function(len, ply)
	local playertounban = net.ReadEntity()
	local type = RAS.EscapeString(net.ReadString())

	if RAS.HasPerms(ply) then
		for k, v in pairs(RAS.BannedPlayers) do
			if v.bsid == playertounban:SteamID64() then
				table.remove(RAS.BannedPlayers, k)
				RAS.QueryDatabase("DELETE FROM `bannedplayers` WHERE `bsid` = ".."'"..playertounban:SteamID64().."'", function() end)

				local msg = string.gsub(config.Language[config.LanguageToUse]["PlayerUnBanned"], "{RAS_Player}", playertounban:Nick())
				msg = string.gsub(msg, "{RAS_Type}", type)
				RAS.NotifySystem(ply, "ban", msg)
			end
		end
	end
end)

RAS.BanUser = function(ply, playertoban, banreason, type, expiretime)
	if !IsValid(playertoban) then return end
	if playertoban:RASIsBanned() then return end

	if RAS.HasPerms(ply) then
		table.insert(RAS.BannedPlayers, {bsid = playertoban:SteamID64(), asid = ply:SteamID64(), reason = banreason, kind = type, expiretime = expiretime})
		RAS.QueryDatabase("INSERT INTO `bannedplayers` (bsid, asid, reason, type) VALUES ('"..playertoban:SteamID64().."', '"..ply:SteamID64().."', '"..banreason.."', '"..type.."')", function() end)

		local msg = string.gsub(config.Language[config.LanguageToUse]["PlayerBanned"], "{RAS_Player}", playertoban:Nick())
		msg = string.gsub(msg, "{RAS_Type}", type)
		RAS.NotifySystem(ply, "ban", msg)
	end
end
net.Receive("RASBanUser", function(len, ply)
	local playertoban = net.ReadEntity()
	local banreason = RAS.EscapeString(net.ReadString())
	local type = RAS.EscapeString(net.ReadString())
	local expiretime = RAS.EscapeString(net.ReadInt())
	RAS.BanUser(ply, playertoban, banreason, type, expiretime)
end)

net.Receive("RASUnExemptUser", function(len, ply) 
	local playertounexempt = net.ReadEntity()
	local type = RAS.EscapeString(net.ReadString())
	
	if !IsValid(playertoban) then return end
	if playertoexempt:RASIsExempt() then return end

	if RAS.HasPerms(ply) then
		for k, v in pairs(RAS.ExemptPlayers) do
			if v.bsid == playertounexempt:SteamID64() then
				table.remove(RAS.ExemptPlayers, k)
				RAS.QueryDatabase("DELETE FROM `exemptplayers` WHERE `bsid` = ".."'"..playertounexempt:SteamID64().."'", function() end)

				local msg = string.gsub(config.Language[config.LanguageToUse]["PlayerUnExempted"], "{RAS_Player}", playertounexempt:Nick())
				msg = string.gsub(msg, "{RAS_Type}", type)
				RAS.NotifySystem(ply, "exempt", msg)
			end
		end
	end
end)

net.Receive("RASExemptUser", function(len, ply)
	local playertoexempt = net.ReadEntity()
	local reason = RAS.EscapeString(net.ReadString())
	local type = RAS.EscapeString(net.ReadString())
	local expiretime = RAS.EscapeString(net.ReadInt())

	if !IsValid(playertoexempt) then return end
	if playertoexempt:RASIsExempt() then return end

	if RAS.HasPerms(ply) then
		table.insert(RAS.ExemptPlayers, {bsid = playertoexempt:SteamID64(), asid = ply:SteamID64(), reason = reason, kind = type, expiretime = expiretime})
		RAS.QueryDatabase("INSERT INTO exemptplayers (bsid, asid, reason, type, expire_time) VALUES ('"..playertoexempt:SteamID64().."', '"..ply:SteamID64().."', '"..reason.."', '"..type.."', '"..expiretime.."')", function() end)

		local msg = string.gsub(config.Language[config.LanguageToUse]["PlayerExempted"], "{RAS_Player}", playertoexempt:Nick())
		msg = string.gsub(msg, "{RAS_Type}", type)
		RAS.NotifySystem(ply, "ban", msg)
	end
end)