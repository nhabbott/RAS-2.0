local config = RAS.Config

local functionsTable = {} -- Create a table containing all functions
functionsTable["enable"] = function(ply)
	if RAS.HasPerms(ply) then
		config.AntiSpamming = true
		RAS.SaveConfig()
		local msg = string.gsub(config.Language[config.LanguageToUse]["Enabled"], "{RAS_System}", "RAS")
		RAS.NotifySystem(ply, "info", msg)
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["disable"] = function(ply)
	if RAS.HasPerms(ply) then
		config.AntiSpamming = false
		RAS.SaveConfig()
		local msg = string.gsub(config.Language[config.LanguageToUse]["Disabled"], "{RAS_System}", "RAS")
		RAS.NotifySystem(ply, "info", msg)
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["chat"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			config.Chat.Enabled = true
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Enabled"], "{RAS_System}", "Chat")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			config.Chat.Enabled = false
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Disabled"], "{RAS_System}", "Chat")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["props"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			config.Prop.Enabled = true
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Enabled"], "{RAS_System}", "Props")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			config.Prop.Enabled = false
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Disabled"], "{RAS_System}", "Props")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["sents"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			config.Sent.Enabled = true
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Enabled"], "{RAS_System}", "SENTs")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			config.Sent.Enabled = false
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Disabled"], "{RAS_System}", "SENTs")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["effects"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			config.Effect.Enabled = true
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Enabled"], "{RAS_System}", "Effects")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			config.Effect.Enabled = false
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Disabled"], "{RAS_System}", "Effects")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["ragdolls"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			config.Ragdoll.Enabled = true
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Enabled"], "{RAS_System}", "Ragdolls")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			config.Ragdoll.Enabled = false
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Disabled"], "{RAS_System}", "Ragdolls")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["vehicles"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			config.Vehicle.Enabled = true
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Enabled"], "{RAS_System}", "Vehicles")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			config.Vehicle.Enabled = false
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Disabled"], "{RAS_System}", "Vehicles")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["npc"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			config.Npc.Enabled = CheckBooleanFunc( text[3] )
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Enabled"], "{RAS_System}", "NPCs")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			config.Npc.Enabled = CheckBooleanFunc( text[3] )
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Disabled"], "{RAS_System}", "NPCs")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["menu"] = function(ply, args)
	if RAS.HasPerms(ply) then
		net.Start("RASOpenMenu")
			net.WriteTable(config)
		net.Send(ply)
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

local function CommandFilter(ply, text)
	local args = string.Split(text, " ")
	if args[1] == "!ras" || args[1] == "/ras" then
		local func = functionsTable[args[2]]
		if func then
			table.remove(args, 1) -- There's no need to pass on the "ras" part of it, as we only need it here to call the function
			table.remove(args, 1) -- There's also no need to pass on the second part of it, as we only need it here to know which function to call exactly
			func(ply, args) -- We pass any additional argument for the function to handle
		end
		return ''
	end
end
hook.Add("PlayerSay", "RASCheckForChatCommand", CommandFilter)
