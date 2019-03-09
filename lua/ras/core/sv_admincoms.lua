local config = RAS.Config

local functionsTable = {}
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
			config.Npc.Enabled = true
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Enabled"], "{RAS_System}", "NPCs")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			config.Npc.Enabled = false
			RAS.SaveConfig()
			local msg = string.gsub(config.Language[config.LanguageToUse]["Disabled"], "{RAS_System}", "NPCs")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["ban"] = function(ply, args)
	local ptb = RAS.GetByNick(args[1])
	if RAS.HasPerms(ply) then
		if IsValid(ptb) then
			if args[2] != nil then
				if args[3] != nil then
					RAS.BanUser(ply, ptb, args[3], args[2], nil)
				else
					RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoReason"])
				end
			else
				RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoType"])
			end
		else
			RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NotValidPly"])
		end
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["unban"] = function(ply, args)
	local ptub = RAS.GetByNick(args[1])
	if RAS.HasPerms(ply) then
		if IsValid(ptub) then
			if args[2] != nil then
				RAS.UnBanUser(ply, ptub, args[2])
			else
				RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoType"])
			end
		else
			RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NotValidPly"])
		end
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["exempt"] = function(ply, args)
	local pte = RAS.GetByNick(args[1])
	if RAS.HasPerms(ply) then
		if IsValid(pte) then
			if args[2] != nil then
				if args[3] != nil then
					RAS.ExemptUser(ply, pte, args[3], args[2], nil)
				else
					RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoReason"])
				end
			else
				RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoType"])
			end
		else
			RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NotValidPly"])
		end
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["unexempt"] = function(ply, args)
	local ptue = RAS.GetByNick(args[1])
	if RAS.HasPerms(ply) then
		if IsValid(ptue) then
			if args[2] != nil then
				RAS.UnExemptUser(ply, ptue, args[2])
			else
				RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoType"])
			end
		else
			RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NotValidPly"])
		end
	else
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NoPerms"])
	end
end

functionsTable["menu"] = function(ply, args)
	if RAS.HasPerms(ply) then
		net.Start("RASOpenMainMenu")
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
			table.remove(args, 1)
			table.remove(args, 1)
			func(ply, args)
		end
		return ''
	end
end
hook.Add("PlayerSay", "RASCheckForChatCommand", CommandFilter)
