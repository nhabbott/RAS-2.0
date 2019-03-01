local function CheckNumberFunc( input )
	if ( type(tonumber(input)) == "number" ) then
		if ( tonumber(input) >= 0 ) then
			return tonumber(input)
		elseif ( tonumber(input) < 0 ) then
			return ( tonumber( '1' ) )
		end
	end
end

local functionsTable = {} -- Create a table containing all functions
functionsTable["enable"] = function( ply )
	if RAS.HasPerms( ply ) then
		RAS.Config.AntiSpamming = true
		RAS.ChatPrint( "Raindeer Anti-Spam has been enabled by "..ply:Nick() )
		RAS.Log( "Enabled by ".."["..ply:SteamID().."]"..ply:Nick() )
		RAS.UpdateConfig()
	else
		RAS.ChatPrint( "You do not have permission to do this!", ply )
	end
end

functionsTable["disable"] = function( ply )
	if RAS.HasPerms( ply ) then
		RAS.Config.AntiSpamming = false
		RAS.ChatPrint( "Raindeer Anti-Spam has been disabled by "..ply:Nick() )
		RAS.Log( "Disabled by ".."["..ply:SteamID().."]"..ply:Nick() )
		RAS.UpdateConfig()
	else
		RAS.ChatPrint( "You do not have permission to do this!", ply )
	end
end

functionsTable["chat"] = function( ply, args )
	if args[1] == "on" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Chat.Enabled = true //Change das value.
			RAS.ChatPrint( "Chat anti-spam has been enabled by "..ply:Nick() )
			RAS.Log( "Chat Protection Enabled by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif args[1] == "off" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Chat.Enabled = false //Change das value.
			RAS.ChatPrint( "Chat anti-spam has been disabled by "..ply:Nick() )
			RAS.Log( "Chat Protection Disabled by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	end
end

functionsTable["props"] = function( ply, args )
	if args[1] == "on" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Prop.Enabled = true
			RAS.ChatPrint( "Prop anti-spam has been enabled by "..ply:Nick() )
			RAS.Log( "Prop Protection Enabled by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif args[1] == "off" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Prop.Enabled = false
			RAS.ChatPrint( "Prop anti-spam has been disabled by "..ply:Nick() )
			RAS.Log( "Prop Protection Disabled by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	end
end

functionsTable["sents"] = function( ply, args )
	if args[1] == "on" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Sent.Enabled = true
			RAS.ChatPrint( "Scripted Entity anti-spam has been enabled by "..ply:Nick() )
			RAS.Log( "Scripted Entity Protection Enabled by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif args[1] == "off" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Sent.Enabled = false
			RAS.ChatPrint( "Scripted Entity anti-spam has been disabled by "..ply:Nick() )
			RAS.Log( "Scripted Entity Protection Disabled by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	end
end

functionsTable["effects"] = function( ply, args )
	if args[1] == "on" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Effect.Enabled = true
			RAS.ChatPrint( "Effect anti-spam has been enabled by "..ply:Nick() )
			RAS.Log( "Effect Protection Enabled by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do  not have permission to do this!", ply )
		end
	elseif args[1] == "off" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Effect.Enabled = false
			RAS.ChatPrint( "Effect anti-spam has been disabled by "..ply:Nick() )
			RAS.Log( "Effect Protection Enabled by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do  not have permission to do this!", ply )
		end
	end
end

functionsTable["ragdolls"] = function( ply, args )
	if args[1] == "on" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Ragdoll.Enabled = true
			RAS.ChatPrint( "Ragdoll anti-spam has been enabled by "..ply:Nick() )
			RAS.Log( "Ragdoll Protection Enabled by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif args[1] == "off" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Ragdoll.Enabled = false
			RAS.ChatPrint( "Ragdoll anti-spam has been disabled by "..ply:Nick() )
			RAS.Log( "Ragdoll Protection Disabled by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	end
end

functionsTable["vehicles"] = function( ply, args )
	if args[1] == "on" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Vehicle.Enabled = true
			RAS.ChatPrint( "Vehicle anti-spam has been enabled by "..ply:Nick() )
			RAS.Log( "Vehicle Protection Enabled by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif args[1] == "off" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Vehicle.Enabled = false
			RAS.ChatPrint( "Vehicle anti-spam has been disabled by "..ply:Nick() )
			RAS.Log( "Vehicle Protection Disabled by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	end
end

functionsTable["npc"] = function( ply, args )
	if args[1] == "on" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Npc.Enabled = CheckBooleanFunc( text[3] )
			RAS.ChatPrint( "NPC anti-spam has been enabled by "..ply:Nick() )
			RAS.Log( "NPC Protection Enabled by".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif args[1] == "off" then
		if RAS.HasPerms( ply ) then
			RAS.Config.Npc.Enabled = CheckBooleanFunc( text[3] )
			RAS.ChatPrint( "NPC anti-spam has been enabled by "..ply:Nick() )
			RAS.Log( "NPC Protection Enabled by".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	end
end

functionsTable["menu"] = function( ply, args )
	if RAS.HasPerms(ply) then
		net.Start("RASOpenMenu")
			net.WriteTable(RAS.Config)
		net.Send(ply)
	else
		RAS.ChatPrint( "You do not have permission to do this!", ply )
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
