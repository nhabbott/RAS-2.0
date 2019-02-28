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

functionsTable["chatdelay"] = function( ply, args )
	if ( tonumber( args[1] ) ~= nil ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Chat.Delay = CheckNumberFunc( args[1] )
			RAS.ChatPrint( "Chat anti-spam delay has been set to "..args[1].." second(s)" )
			RAS.Log( "Chat Protection delay set to "..args[1].." second(s) by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif ( tonumber( args[1] ) == nil ) then
		RAS.ChatPrint( "Please supply a number of seconds to set the delay!", ply )
	end
end

functionsTable["propdelay"] = function( ply, args )
	if ( tonumber( args[1] ) ~= nil ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Prop.Delay = CheckNumberFunc( args[1] )
			RAS.ChatPrint( "Prop anti-spam delay has been set to "..args[1].." second(s)" )
			RAS.Log( "Prop Protection delay set to "..args[1].." second(s) by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permissions to do this!", ply )
		end
	elseif ( tonumber( args[1] ) == nil ) then
		RAS.ChatPrint( "Please supply a number of seconds to set the delay!", ply )
	end
end

functionsTable["sentdelay"] = function( ply, args )
	if ( tonumber( args[1] ) ~= nil ) then
		if RAS.HasPerms( ply ) then
			PrintTable( RAS.Config )
			RAS.Config.Sent.Delay = CheckNumberFunc( args[1] )
			RAS.ChatPrint( "Scripted Entity anti-spam delay has been set to "..args[1].." second(s)" )
			RAS.Log( "Scripted Entity Protection delay set to "..args[1].." second(s) by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permissions to do this!", ply )
		end
	elseif ( tonumber( args[1] ) == nil ) then
		RAS.ChatPrint( "Please supply a number of seconds to set the delay!", ply )
	end
end

functionsTable["effectdelay"] = function( ply, args )
	if ( tonumber( args[1] ) ~= nil ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Effect.Delay = CheckNumberFunc( args[1] )
			RAS.ChatPrint( "Effect anti-spam delay has been set to "..args[1].." second(s)" )
			RAS.Log( "Effect Protection delay set to "..args[1].." second(s) by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif ( tonumber( args[1] ) == nil ) then
		RAS.ChatPrint( "Please supply a number of seconds to set the delay!", ply )
	end
end

functionsTable["ragdolldelay"] = function( ply, args )
	if ( tonumber( args[1] ) ~= nil ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Ragdoll.Delay = CheckNumberFunc( args[1] )
			RAS.ChatPrint( "Radoll anti-spam delay has been set to "..args[1].." second(s)" )
			RAS.Log( "Ragdoll Protection delay set to "..args[1].." second(s) by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif ( tonumber( args[1] ) == nil ) then
		RAS.ChatPrint( "Please supply a number of seconds to set the delay!", ply )
	end
end

functionsTable["vehicledelay"] = function( ply, args )
	if ( tonumber( args[1] ) ~= nil ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Vehicle.Delay = CheckNumberFunc( args[1] )
			RAS.ChatPrint( "Vehicle anti-spam delay has been set to "..args[1].." second(s)" )
			RAS.Log( "Vehicle Protection delay set to "..args[1].." second(s) by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif ( tonumber( args[1] ) == nil ) then
		RAS.ChatPrint( "Please supply a number of seconds to set the delay!", ply )
	end
end

functionsTable["npcdelay"] = function( ply, args )
	if ( tonumber( args[1] ) ~= nil ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Npc.Delay = CheckNumberFunc( args[1] )
			RAS.ChatPrint( "NPC anti-spam delay has been set to "..args[1].." second(s)" )
			RAS.Log( "NPC Protection delay set to "..args[1].." second(s) by ".."["..ply:SteamID().."]"..ply:Nick() )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif ( tonumber( args[1] ) == nil ) then
		RAS.ChatPrint( "Please supply a number of seconds to set the delay!", ply )
	end
end

functionsTable["exemptchat"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Chat[args[1]] = true
			RAS.ChatPrint( args[1].." has been exempted from chat restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from chat restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Chat[RAS.GetSteamID( args[1] )] = true
			RAS.ChatPrint( args[1].." has been exempted from chat restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from chat restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unexemptchat"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Chat[args[1]] = false
			RAS.ChatPrint( args[1].." has been un-exempted from chat restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from chat restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Chat[RAS.GetSteamID( args[1] )] = false
			RAS.ChatPrint( args[1].." has been un-exempted from chat restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from chat restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["exemptprop"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Prop[args[1]] = true
			RAS.ChatPrint( args[1].." has been exempted from prop spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from prop spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Prop[RAS.GetSteamID( args[1] )] = true
			RAS.ChatPrint( args[1].." has been exempted from prop spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from prop spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unexemptprop"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Prop[args[1]] = false
			RAS.ChatPrint( args[1].." has been un-exempted from prop spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from prop spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Prop[RAS.GetSteamID( args[1] )] = false
			RAS.ChatPrint( args[1].." has been un-exempted from prop spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from prop spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["exemptsent"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Sent[args[1]] = true
			RAS.ChatPrint( args[1].." has been exempted from scripted entity spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from scripted entity spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Sent[RAS.GetSteamID( args[1] )] = true
			RAS.ChatPrint( args[1].." has been exempted from scripted entity spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from scripted entity spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unexemptsent"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Sent[args[1]] = false
			RAS.ChatPrint( args[1].." has been un-exempted from scripted entity spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from scripted entity spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Sent[RAS.GetSteamID( args[1] )] = false
			RAS.ChatPrint( args[1].." has been un-exempted from scripted entity spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from scripted entity spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["exempteffect"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Effect[args[1]] = true
			RAS.ChatPrint( args[1].." has been exempted from effect spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from effect spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Effect[RAS.GetSteamID( args[1] )] = true
			RAS.ChatPrint( args[1].." has been exempted from effect spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from effect spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unexempteffect"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Effect[args[1]] = false
			RAS.ChatPrint( args[1].." has been un-exempted from effect spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from effect spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Effect[RAS.GetSteamID( args[1] )] = false
			RAS.ChatPrint( args[1].." has been un-exempted from effect spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from effect spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["exemptragdoll"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Ragdoll[args[1]] = true
			RAS.ChatPrint( args[1].." has been exempted from ragdoll spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from ragdoll spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Ragdoll[RAS.GetSteamID( args[1] )] = true
			RAS.ChatPrint( args[1].." has been exempted from ragdoll spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from ragdoll spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unexemptragdoll"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Ragdoll[args[1]] = false
			RAS.ChatPrint( args[1].." has been un-exempted from ragdoll spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from ragdoll spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Ragdoll[RAS.GetSteamID( args[1] )] = false
			RAS.ChatPrint( args[1].." has been un-exempted from ragdoll spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from ragdoll spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["exemptvehicle"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Vehicle[args[1]] = true
			RAS.ChatPrint( args[1].." has been exempted from vehicle spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from vehicle spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Vehicle[RAS.GetSteamID( args[1] )] = true
			RAS.ChatPrint( args[1].." has been exempted from vehicle spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from vehicle spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unexemptvehicle"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Vehicle[args[1]] = false
			RAS.ChatPrint( args[1].." has been un-exempted from vehicle spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from vehicle spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Vehicle[RAS.GetSteamID( args[1] )] = false
			RAS.ChatPrint( args[1].." has been un-exempted from vehicle spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from vehicle spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["exemptnpc"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Npc[args[1]] = true
			RAS.ChatPrint( args[1].." has been exempted from NPC spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from NPC spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Npc[RAS.GetSteamID( args[1] )] = true
			RAS.ChatPrint( args[1].." has been exempted from NPC spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." exempted "..args[1].." from NPC spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unexemptnpc"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Npc[args[1]] = false
			RAS.ChatPrint( args[1].." has been un-exempted from NPC spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from NPC spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Exempt.Npc[RAS.GetSteamID( args[1] )] = false
			RAS.ChatPrint( args[1].." has been un-exempted from NPC spawning restrictions" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-exempted "..args[1].." from NPC spawning restrictions" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["banchat"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				local expire_time = os.time() + tonumber( 999999 )
				Database:Query( "INSERT INTO banned (steam_id, type, expire_time) VALUES ('"..args[1].."', 'chat', '"..expire_time.."')" )
				RAS.ChatPrint( args[1].." has been banned from chatting permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from chatting permanently!" )
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local expire_time = os.time() + tonumber( args[2] ) * tonumber( 60 )
				Database:Query( "INSERT INTO banned (steam_id, type, expire_time) VALUES ('"..args[1].."', 'chat', '"..expire_time.."')" )
				RAS.ChatPrint( args[1].." has been banned from chatting for "..tonumber( args[2] ) * tonumber( 60 ).." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from chatting for "..tonumber( args[2] ) * tonumber( 60 ).." minutes!" )
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				local expire_time = os.time() + tonumber( 999999 )
				Database:Query( "INSERT INTO banned (steam_id, type, expire_time) VALUES ('"..RAS.GetSteamID( args[1] ).."', 'chat', '"..expire_time.."' )" )
				RAS.ChatPrint( args[1].." has been banned from chatting permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from chatting permanently!" )
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local expire_time = os.time() + tonumber( args[2] ) * tonumber( 60 )
				Database:Query( "INSERT INTO banned (steam_id, type, expire_time) VALUES ('"..RAS.GetSteamID( args[1] ).."', 'chat', '"..expire_time.."')" )
				RAS.Config.Banned.Chat[args[1]] = true
				RAS.ChatPrint( args[1].." has been banned from chatting for "..tonumber( args[2] ) * tonumber( 60 ).." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from chatting for "..tonumber( args[2] ) * tonumber( 60 ).." minutes!" )
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unbanchat"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			local expire_time = os.time()
			Database:Query( "INSERT INTO banned (steam_id, type, expire_time) VALUES ('"..args[1].."', 'chat', '"..expire_time.."')" )
			RAS.ChatPrint( args[1].." has been un-banned from chatting" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from chatting!" )
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			local expire_time = os.time()
			Database:Query( "INSERT INTO banned (steam_id, type, expire_time) VALUES ('"..RAS.GetSteamID( args[1] ).."', 'chat', '"..expire_time.."')" )
			RAS.ChatPrint( args[1].." has been un-banned from chatting" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from chatting!" )
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["banprop"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				RAS.Config.Banned.Prop[args[1]] = true
				RAS.ChatPrint( args[1].." has been banned from prop spawning permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from prop spawning permanently!" )
				RAS.UpdateConfig()
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local time = tonumber( args[2] ) / 60
				RAS.Config.Banned.Prop[args[1]] = true
				RAS.ChatPrint( args[1].." has been banned from prop spawning for "..time.." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from prop spawning for "..time.." minutes!" )
				RAS.UpdateConfig()
				timer.Simple( time, function()
					RAS.ResetPropBan( args[1] )
				end)
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				RAS.Config.Banned.Prop[RAS.GetSteamID( args[1] )] = true
				RAS.ChatPrint( args[1].." has been banned from prop spawning permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from prop spawning permanently!" )
				RAS.UpdateConfig()
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local time = tonumber( args[2] ) / 60
				RAS.Config.Banned.Prop[RAS.GetSteamID( args[1] )] = true
				RAS.ChatPrint( args[1].." has been banned from prop spawning for "..time.." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from prop spawning for "..time.." minutes!" )
				RAS.UpdateConfig()
				timer.Simple( time, function()
					RAS.ResetPropBan( args[1] )
				end)
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unbanprop"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Banned.Prop[args[1]] = false
			RAS.ChatPrint( args[1].." has been un-banned from prop spawning" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from prop spawning!" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Banned.Prop[RAS.GetSteamID( args[1] )] = false
			RAS.ChatPrint( args[1].." has been un-banned from prop spawning" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from prop spawning!" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["bansent"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				RAS.Config.Banned.Sent[args[1]] = true
				RAS.ChatPrint( args[1].." has been banned from scripted entity spawning permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from scripted entity spawning permanently!" )
				RAS.UpdateConfig()
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local time = tonumber( args[2] ) / 60
				RAS.Config.Banned.Sent[args[1]] = true
				RAS.ChatPrint( args[1].." has been banned from scripted entity spawning for "..time.." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from scripted entity spawning for "..time.." minutes!" )
				RAS.UpdateConfig()
				timer.Simple( time, function()
					RAS.ResetSentBan( args[1] )
				end)
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				RAS.Config.Banned.Sent[RAS.GetSteamID( args[1] )] = true
				RAS.ChatPrint( args[1].." has been banned from scripted entity spawning permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from scripted entity spawning permanently!" )
				RAS.UpdateConfig()
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local time = tonumber( args[2] ) / 60
				RAS.Config.Banned.Sent[RAS.GetSteamID( args[1] )] = true
				RAS.ChatPrint( args[1].." has been banned from scripted entity spawning for "..time.." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from scripted entity spawning for "..time.." minutes!" )
				RAS.UpdateConfig()
				timer.Simple( time, function()
					RAS.ResetSentBan( args[1] )
				end)
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unbansent"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Banned.Sent[args[1]] = false
			RAS.ChatPrint( args[1].." has been un-banned from scripted entity spawning" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from scripted entity spawning!" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Banned.Sent[RAS.GetSteamID( args[1] )] = false
			RAS.ChatPrint( args[1].." has been un-banned from scripted entity spawning" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from scripted entity spawning!" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["baneffect"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				RAS.Config.Banned.Effect[args[1]] = true
				RAS.ChatPrint( args[1].." has been banned from effect spawning permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from effect spawning permanently!" )
				RAS.UpdateConfig()
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local time = tonumber( args[2] ) / 60
				RAS.Config.Banned.Effect[args[1]] = true
				RAS.ChatPrint( args[1].." has been banned from effect spawning for "..time.." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from effect spawning for "..time.." minutes!" )
				RAS.UpdateConfig()
				timer.Simple( time, function()
					RAS.ResetEffectBan( args[1] )
				end)
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				RAS.Config.Banned.Effect[RAS.GetSteamID( args[1] )] = true
				RAS.ChatPrint( args[1].." has been banned from effect spawning permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from effect spawning permanently!" )
				RAS.UpdateConfig()
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local time = tonumber( args[2] ) / 60
				RAS.Config.Banned.Effect[RAS.GetSteamID( args[1] )] = true
				RAS.ChatPrint( args[1].." has been banned from effect spawning for "..time.." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from effect spawning for "..time.." minutes!" )
				RAS.UpdateConfig()
				timer.Simple( time, function()
					RAS.ResetEffectBan( args[1] )
				end)
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unbaneffect"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Banned.Effect[args[1]] = false
			RAS.ChatPrint( args[1].." has been un-banned from effect spawning" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from effect spawning!" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Banned.Effect[RAS.GetSteamID( args[1] )] = false
			RAS.ChatPrint( args[1].." has been un-banned from effect spawning" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from effect spawning!" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["banragdoll"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				RAS.Config.Banned.Ragdoll[args[1]] = true
				RAS.ChatPrint( args[1].." has been banned from ragdoll spawning permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from ragdoll spawning permanently!" )
				RAS.UpdateConfig()
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local time = tonumber( args[2] ) / 60
				RAS.Config.Banned.Ragdoll[args[1]] = true
				RAS.ChatPrint( args[1].." has been banned from ragdoll spawning for "..time.." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from ragdoll spawning for "..time.." minutes!" )
				RAS.UpdateConfig()
				timer.Simple( time, function()
					RAS.ResetRagdollBan( args[1] )
				end)
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				RAS.Config.Banned.Ragdoll[RAS.GetSteamID( args[1] )] = true
				RAS.ChatPrint( args[1].." has been banned from ragdoll spawning permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from ragdoll spawning permanently!" )
				RAS.UpdateConfig()
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local time = tonumber( args[2] ) / 60
				RAS.Config.Banned.Ragdoll[RAS.GetSteamID( args[1] )] = true
				RAS.ChatPrint( args[1].." has been banned from ragdoll spawning for "..time.." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from ragdoll spawning for "..time.." minutes!" )
				RAS.UpdateConfig()
				timer.Simple( time, function()
					RAS.ResetRagdollBan( args[1] )
				end)
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unbanragdoll"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Banned.Ragdoll[args[1]] = false
			RAS.ChatPrint( args[1].." has been un-banned from ragdoll spawning" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from ragdoll spawning!" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Banned.Ragdoll[RAS.GetSteamID( args[1] )] = false
			RAS.ChatPrint( args[1].." has been un-banned from ragdoll spawning" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from ragdoll spawning!" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["banvehicle"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				RAS.Config.Banned.Vehicle[args[1]] = true
				RAS.ChatPrint( args[1].." has been banned from vehicle spawning permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from vehicle spawning permanently!" )
				RAS.UpdateConfig()
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local time = tonumber( args[2] ) / 60
				RAS.Config.Banned.Vehicle[args[1]] = true
				RAS.ChatPrint( args[1].." has been banned from vehicle spawning for "..time.." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from vehicle spawning for "..time.." minutes!" )
				RAS.UpdateConfig()
				timer.Simple( time, function()
					RAS.ResetVehicleBan( args[1] )
				end)
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				RAS.Config.Banned.Vehicle[RAS.GetSteamID( args[1] )] = true
				RAS.ChatPrint( args[1].." has been banned from vehicle spawning permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from vehicle spawning permanently!" )
				RAS.UpdateConfig()
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local time = tonumber( args[2] ) / 60
				RAS.Config.Banned.Vehicle[RAS.GetSteamID( args[1] )] = true
				RAS.ChatPrint( args[1].." has been banned from vehicle spawning for "..time.." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from vehicle spawning for "..time.." minutes!" )
				RAS.UpdateConfig()
				timer.Simple( time, function()
					RAS.ResetVehicleBan( args[1] )
				end)
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unbanvehicle"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Banned.Vehicle[args[1]] = false
			RAS.ChatPrint( args[1].." has been un-banned from vehicle spawning" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from vehicle spawning!" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Banned.Ragdoll[RAS.GetSteamID( args[1] )] = false
			RAS.ChatPrint( args[1].." has been un-banned from vehicle spawning" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from vehicle spawning!" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["bannpc"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				RAS.Config.Banned.Npc[args[1]] = true
				RAS.ChatPrint( args[1].." has been banned from NPC spawning permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from NPC spawning permanently!" )
				RAS.UpdateConfig()
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local time = tonumber( args[2] ) / 60
				RAS.Config.Banned.Npc[args[1]] = true
				RAS.ChatPrint( args[1].." has been banned from NPC spawning for "..time.." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from NPC spawning for "..time.." minutes!" )
				RAS.UpdateConfig()
				timer.Simple( time, function()
					RAS.ResetNpcBan( args[1] )
				end)
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			if args[2] == "perm" || args[2] == nil then
				RAS.Config.Banned.Npc[RAS.GetSteamID( args[1] )] = true
				RAS.ChatPrint( args[1].." has been banned from NPC spawning permanently" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from NPC spawning permanently!" )
				RAS.UpdateConfig()
			elseif type( tonumber( args[1] ) ) == "number" && CheckNumberFunc( args[1] ) then
				local time = tonumber( args[2] ) / 60
				RAS.Config.Banned.Npc[RAS.GetSteamID( args[1] )] = true
				RAS.ChatPrint( args[1].." has been banned from NPC spawning for "..time.." minutes" )
				RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." banned "..args[1].." from NPC spawning for "..time.." minutes!" )
				RAS.UpdateConfig()
				timer.Simple( time, function()
					RAS.ResetNpcBan( args[1] )
				end)
			end
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["unbannpc"] = function( ply, args )
	if RAS.ValidSteamID( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Banned.Npc[args[1]] = false
			RAS.ChatPrint( args[1].." has been un-banned from NPC spawning" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from NPC spawning!" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	elseif RAS.ValidPly( args[1] ) then
		if RAS.HasPerms( ply ) then
			RAS.Config.Banned.Npc[RAS.GetSteamID( args[1] )] = false
			RAS.ChatPrint( args[1].." has been un-banned from NPC spawning" )
			RAS.Log( "["..ply:SteamID().."]"..ply:Nick().." un-banned "..args[1].." from NPC spawning!" )
			RAS.UpdateConfig()
		else
			RAS.ChatPrint( "You do not have permission to do this!", ply )
		end
	else
		RAS.ChatPrint( "Invalid Target!", ply )
	end
end

functionsTable["menu"] = function( ply, args )
	if RAS.HasPerms( ply ) then
		net.Start( "RASOpenConfigEditor" )
			net.WriteTable( RAS.Config )
		net.Send( ply )
	else
		RAS.ChatPrint( "You do not have permission to do this!", ply )
	end
end

local function CommandFilter( ply, text )
	local args = string.Split( text, " " )
	if args[1] == "!ras" || args[1] == "/ras" then
		local func = functionsTable[args[2]]
		if func then
			table.remove( args, 1 ) -- There's no need to pass on the "ras" part of it, as we only need it here to call the function
			table.remove( args, 1 ) -- There's also no need to pass on the second part of it, as we only need it here to know which function to call exactly
			func( ply, args ) -- We pass any additional argument for the function to handle
		end
		return ''
	end
end
hook.Add( "PlayerSay", "CheckForChatRASCommand", CommandFilter )
