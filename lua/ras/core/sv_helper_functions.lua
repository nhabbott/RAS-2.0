// Finds a player by username/rpname
RAS.GetByNick = function(ply)
  local name = string.lower(ply)
	for _, v in ipairs(player.GetHumans()) do
    if string.find(string.lower(v:Nick()), name, 1, true) != nil or string.find(string.lower(v:GetNWString("rpname")), name, 1, true) != nil then 
      return v
		end
	end
end

// Finds player from SteamID64
RAS.GetBySteam64 = function(sid)
	return player.GetBySteamID(util.SteamIDFrom64(sid))
end

// Validates whether or not a player has admin perms within RAS
RAS.HasPerms = function(ply)
 if !IsValid(ply) then return false end
 return RAS.Config.UserGroups[string.lower(ply:GetUserGroup())]
end

// Validates whether or not a player has access to a certain part of the menu
RAS.HasMenuPerms = function(ply, rmenu)
	if !IsValid(ply) then return false end
	local tbl = RAS.Config.UserGroupMenu[string.lower(ply:GetUserGroup())]
	for k, v in pairs(tbl) do
		if v == rmenu then
			return true
		end
	end
	RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	return false
end

// Validates the type of ban/exempt that was specified
RAS.IsValidKind = function(kind)
  local tbl = RAS.Config.Language[RAS.Config.LanguageToUse]["Kinds"]
  for k, v in pairs(tbl) do 
		if v == kind then
			return true
		elseif #tbl == k then
			RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoType"])
			return false
		end
	end
end

// Changes first character to uppercase
RAS.FirstToUpper = function(str)
	return (str:gsub("^%l", string.upper))
end

// Makes table of current players and extracts needed information
RAS.GetCurPlayers = function()
	local tbl = {}
	for k, v in pairs(player.GetHumans()) do
		table.insert(tbl, {name = v:Nick(), sid = v:SteamID64()})
	end
	return tbl
end