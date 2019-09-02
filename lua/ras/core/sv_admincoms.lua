local FunctionsTable = {}
FunctionsTable["enable"] = function(ply)
	if RAS.HasPerms(ply) then
		RAS.Config.AntiSpamming = true
		file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
		local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Enabled"], "{RAS_System}", "RAS")
		RAS.NotifySystem(ply, "info", msg)
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

FunctionsTable["disable"] = function(ply)
	if RAS.HasPerms(ply) then
		RAS.Config.AntiSpamming = false
		file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
		local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Disabled"], "{RAS_System}", "RAS")
		RAS.NotifySystem(ply, "info", msg)
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

FunctionsTable["chat"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			RAS.Config.Chat.Enabled = true
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Enabled"], "{RAS_System}", "Chat")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			RAS.Config.Chat.Enabled = false
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Disabled"], "{RAS_System}", "Chat")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

FunctionsTable["props"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			RAS.Config.Prop.Enabled = true
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Enabled"], "{RAS_System}", "Props")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			RAS.Config.Prop.Enabled = false
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Disabled"], "{RAS_System}", "Props")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

FunctionsTable["sents"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			RAS.Config.Sent.Enabled = true
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Enabled"], "{RAS_System}", "SENTs")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			RAS.Config.Sent.Enabled = false
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Disabled"], "{RAS_System}", "SENTs")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

FunctionsTable["effects"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			RAS.Config.Effect.Enabled = true
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Enabled"], "{RAS_System}", "Effects")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			RAS.Config.Effect.Enabled = false
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Disabled"], "{RAS_System}", "Effects")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

FunctionsTable["ragdolls"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			RAS.Config.Ragdoll.Enabled = true
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Enabled"], "{RAS_System}", "Ragdolls")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			RAS.Config.Ragdoll.Enabled = false
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Disabled"], "{RAS_System}", "Ragdolls")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

FunctionsTable["vehicles"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			RAS.Config.Vehicle.Enabled = true
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Enabled"], "{RAS_System}", "Vehicles")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			RAS.Config.Vehicle.Enabled = false
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Disabled"], "{RAS_System}", "Vehicles")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

FunctionsTable["npc"] = function(ply, args)
	if RAS.HasPerms(ply) then
		if args[1] == "on" then
			RAS.Config.Npc.Enabled = true
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Enabled"], "{RAS_System}", "NPCs")
			RAS.NotifySystem(ply, "info", msg)
		elseif args[1] == "off" then
			RAS.Config.Npc.Enabled = false
			file.Write("ras/config.txt", util.TableToJSON(RAS.Config))
			local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["Disabled"], "{RAS_System}", "NPCs")
			RAS.NotifySystem(ply, "info", msg)
		end
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

FunctionsTable["ban"] = function(ply, args)
	local ptb = RAS.GetByNick(args[1])
	if RAS.HasPerms(ply) then
		if IsValid(ptb) then
			if args[2] != nil then
				if args[3] != nil then
					RAS.BanUser(ply, ptb, args[3], args[2], nil)
				else
					RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoReason"])
				end
			else
				RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoType"])
			end
		else
			RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NotValidPly"])
		end
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

FunctionsTable["unban"] = function(ply, args)
	local ptub = RAS.GetByNick(args[1])
	if RAS.HasPerms(ply) then
		if IsValid(ptub) then
			if args[2] != nil then
				RAS.UnBanUser(ply, ptub, args[2])
			else
				RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoType"])
			end
		else
			RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NotValidPly"])
		end
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

FunctionsTable["exempt"] = function(ply, args)
	local pte = RAS.GetByNick(args[1])
	if RAS.HasPerms(ply) then
		if IsValid(pte) then
			if args[2] != nil then
				if args[3] != nil then
					RAS.ExemptUser(ply, pte, args[3], args[2], nil)
				else
					RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoReason"])
				end
			else
				RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoType"])
			end
		else
			RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NotValidPly"])
		end
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

FunctionsTable["unexempt"] = function(ply, args)
	local ptue = RAS.GetByNick(args[1])
	if RAS.HasPerms(ply) then
		if IsValid(ptue) then
			if args[2] != nil then
				RAS.UnExemptUser(ply, ptue, args[2])
			else
				RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoType"])
			end
		else
			RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NotValidPly"])
		end
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

FunctionsTable["menu"] = function(ply, args)
	if RAS.HasPerms(ply) then
		local logs = util.JSONToTable(file.Read("ras/logs.txt", "DATA"))
		net.Start("RASMainMenu")
			net.WriteTable(logs)
		net.Send(ply)
	else
		RAS.NotifySystem(ply, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NoPerms"])
	end
end

local function CommandFilter(ply, text)
	local args = string.Split(text, " ")
	if args[1] == "!ras" || args[1] == "/ras" then
		local func = FunctionsTable[args[2]]
		if func then
			table.remove(args, 1)
			table.remove(args, 1)
			func(ply, args)
		end
		return ''
	end
end
hook.Add("PlayerSay", "RASCheckForChatCommand", CommandFilter)
