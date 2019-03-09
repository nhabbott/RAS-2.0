--[[Checks if SteamID is valid]]--
RAS.ValidSteamID = function(data)
  if string.match(data, "^STEAM_%d:%d:%d+$") then
    return true
 else
   return false
 end
end

--[[Get a player by Nickname]]--
RAS.GetByNick = function(ply)
  local name = string.lower(ply)
	for _, v in ipairs(player.GetHumans()) do
    if string.find(string.lower(v:Nick()), name, 1, true) != nil or string.find(string.lower(v:GetNWString("rpname")), name, 1, true) != nil then 
      return v
		end
	end
end

--[[Access Func.]]--
RAS.HasPerms = function(ply)
 if !IsValid(ply) then return false end
 return RAS.Config.UserGroups[string.lower(ply:GetUserGroup())]
end