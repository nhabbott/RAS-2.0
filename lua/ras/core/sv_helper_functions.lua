local config = RAS.Config

RAS.GetByNick = function(ply)
  local name = string.lower(ply)
	for _, v in ipairs(player.GetHumans()) do
    if string.find(string.lower(v:Nick()), name, 1, true) != nil or string.find(string.lower(v:GetNWString("rpname")), name, 1, true) != nil then 
      return v
		end
	end
end

RAS.HasPerms = function(ply)
 if !IsValid(ply) then return false end
 return RAS.Config.UserGroups[string.lower(ply:GetUserGroup())]
end

RAS.IsValidKind = function(kind)
  local tbl = config.Language[config.LanguageToUse]["Kinds"]
  for k, v in pairs(tbl) do 
		if v == kind then
			return true
		elseif #tbl == k then
			RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoType"])
			return false
		end
	end
end

RAS.FirstToUpper = function(str)
	return (str:gsub("^%l", string.upper))
end