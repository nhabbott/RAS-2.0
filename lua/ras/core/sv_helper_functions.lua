--[[Checks if SteamID is valid]]--
RAS.ValidSteamID = function(data)
  if string.match(data, "^STEAM_%d:%d:%d+$") then
    return true
 else
   return false
 end
end

--[[Gather Current Players' Nicks]]--
RAS.GetNickNames = function()
 local tbl = {}
   for k,v in pairs(player.GetHumans()) do
     tbl[v:Nick()] = true
   end
 return tbl
end

--[[Get a players SteamID]]--
RAS.GetSteamID = function(ply)
 for k, v in pairs(player.GetHumans()) do
   if string.match(ply, v:Nick()) then
     return v:SteamID()
   end
 end
end

--[[Valid Player Func]]--
RAS.ValidPly = function(ply)
 local tbl = GetNickNames()
 if tbl[string.match(ply, "^.*$")] then
   return true
 else
   return false
 end
end

--[[Access Func.]]--
RAS.HasPerms = function(ply)
 if !IsValid(ply) then return false end
 return RAS.Config.UserGroups[string.lower(ply:GetUserGroup())]
end