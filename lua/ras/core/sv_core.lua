function RAS.UpdateConfig()
	file.Write( "ras_data/ras_config.txt", util.TableToJSON( RAS.Config ) )
end

local plymeta = FindMetaTable("Player")

RAS.EscapeString = function(string)
	if isstring(string) and RAS.Config.SavingMethod == "tmysql4" then
		return RAS.MySQL:Escape(string)
	elseif isstring(string) and RAS.Config.SavingMethod == "mysqloo" then
		return RAS.MySQL:escape(string)
	elseif istable(string) and RAS.Config.SavingMethod == "mysqloo" then
		local newtable = {}
		for k, v in pairs(string) do
			if istable(v) then
				table.insert(newtable,#newtable + 1,RAS.EscapeString(v))
			else
				table.insert(newtable,#newtable + 1,RAS.MySQL:escape(v))
			end
		end
		return newtable
	elseif istable(string) and RAS.Config.SavingMethod == "tmysql4" then
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
	if RAS.Config.SavingMethod == "tmysql4" then
		RAS.MySQL:Query(thequery, function(result)
			if result[1].status then
				callback(true, result, nil)
			else
				callback(false, result[1].error, result[1].lastid or nil)
			end
		end)
	elseif RAS.Config.SavingMethod == "mysqloo" then
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
	ply.ChatCooldown = os.time()
	ply.PropCooldown = os.time()
	ply.SentCooldown = os.time()
	ply.EffectCooldown = os.time()
	ply.RagdollCooldown = os.time()
	ply.VehicleCooldown = os.time()
	ply.NpcCooldown = os.time()

	RAS.QueryDatabase("SELECT * FROM exemptplayers WHERE sid = " .. ply:SteamID64(), function(worked, result, lid)
		if result or result[1].affected == 1 then
			if RAS.Config.SavingMethod == "tmysql4" then
				local thedata = result[1].data[1]
			elseif RAS.Config.SavingMethod == "mysqloo" then
				local thedata = result[1]
			end
			if thedata == nil then 
				return 
			else
				table.insert(RAS.ExemptPlayers, {sid = ply:SteamID64(), name = ply:Nick(), asid = thedata.asid, kind = thedata.type, reason = thedata.reason})
			end
		end
	end)
	RAS.QueryDatabase("SELECT * FROM bannedplayers WHERE sid = " .. ply:SteamID64(), function(worked, result, lid)
		if result or result[1].affected == 1 then
			if RAS.Config.SavingMethod == "tmysql4" then
				local thedata = result[1].data[1]
			elseif RAS.Config.SavingMethod == "mysqloo" then
				local thedata = result[1]
			end
			if thedata == nil then 
				return
			else
				table.insert(RAS.BannedPlayers, {sid = ply:SteamID64(), name = ply:Nick(), asid = thedata.asid, kind = thedata.type, reason = thedata.reason})
			end
		end
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
	timer.Simple(5, function()
		RASPlayerInitialSpawnFunction(ply)
	end)
end)

net.Receive("RASUnBanUser", function(len, ply)
	local playertounban = net.ReadEntity()
	local type = RAS.EscapeString(net.ReadString())

	if RAS.HasPerms(ply) then
		for k, v in pairs(RAS.BannedPlayers) do
			if v.bsid == playertounban:SteamID64() then
				table.remove(RAS.BannedPlayers, k)
				RAS.QueryDatabase("DELETE FROM `bannedplayers` WHERE `bsid` = ".."`"..playertounban:SteamID64().."`", function() end)

				local msg = string.gsub(config.Language[config.LanguageToUse]["PlayerUnBanned"], "{RAS_Player}", playertounban:Nick())
				msg = string.gsub(msg, "{RAS_Type}", type)
				RAS.NotifySystem(ply, "ban", msg)
			end
		end
	end
end)

net.Receive("RASBanUser", function(len, ply)
	local playertoban = net.ReadEntity()
	local banreason = RAS.EscapeString(net.ReadString())
	local type = RAS.EscapeString(net.ReadString())
	local expiretime = RAS.EscapeString(net.ReadInt())

	if !IsValid(playertoban) then return end
	if playertoban:RASIsBanned() then return end

	if RAS.HasPerms(ply) then
		table.insert(RAS.BannedPlayers, {bsid = playertoban:SteamID64(), asid = ply:SteamID64(), reason = banreason, type = type, expiretime = expiretime})
		RAS.QueryDatabase("INSERT INTO bannedplayers (bsid, asid, reason, type, expire_time) VALUES (`"..playertoban:SteamID64().."`, `"..ply:SteamID64().."`, `"..banreason.."`, `"..type.."`, `"..expiretime.."`)", function() end)

		local msg = string.gsub(config.Language[config.LanguageToUse]["PlayerBanned"], "{RAS_Player}", playertoban:Nick())
		msg = string.gsub(msg, "{RAS_Type}", type)
		RAS.NotifySystem(ply, "ban", msg)
	end
end)