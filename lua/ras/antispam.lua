local function vCheck ()
    hook.Remove( "PlayerInitialSpawn", "RAS_vCheck" )
    http.Post( "http://104.131.80.188:9000/ping", {user = "{{ user_id }}", license = "{{ user_id | 25 }}", prod = "RAS", x_version = "1.0"},
    function ( responseText, contentLength, responseHeaders, statusCode )
        if responseText == "403icstdl304" then
            timer.Create( "rasErrorN", 180, 0, function () RAS.ChatPrint( "Error: Please Make a Ticket on ScriptFodder!" ) end )
        elseif responseText == "200nicstdl002" then
            print( "[RAS]Version Ok" )
        end
    end)
    function vCheckError( error )
        print( "Error Checking version: " .. error )
    end
end
hook.Add( "PlayerInitialSpawn", "RAS_vCheck", vCheck )

local meta = FindMetaTable( "Player" )

function RAS.ChatResetTimer( ply )
	ply:EnableChatting( true )
end

function RAS.Chat.Chatting( ply, text )
	if RAS.Config.AntiSpamming then
		if !ply:CanChat() then
      if RAS.IsBannedChat( ply:SteamID() ) then
        RAS.ChatPrint( "Message \""..text.."\" was not sent because you are banned from chatting.\n", ply )
        RAS.Log( ply:Nick().."["..ply:SteamID().."]".." tried to chat but is banned from chatting!" )
        return false
      else
  			RAS.ChatPrint( "Message \""..text.."\" was not sent.\n", ply )
  			RAS.ChatPrint( "STOP SPAMMING THE SERVER!", ply )
  			RAS.Log( ply:Nick().."["..ply:SteamID().."]".." was chat spamming the server!" )
  			return false
      end
		end
		ply:EnableChatting( false )
		timer.Simple( RAS.Config.Chat.Delay, function()
			RAS.ChatResetTimer( ply )
		end)
	end
end
hook.Add( "PlayerSay", "RAS.Chat.Chatting", RAS.Chat.Chatting )

function RAS.PropResetTimer( ply )
	ply:EnablePropSpawning( true )
end

function RAS.Prop.Spawning( ply, model, ent )
	if RAS.Config.AntiSpamming then
		if !ply:CanPropSpawn() then
      if RAS.IsBannedProp( ply:SteamID() ) then
        RAS.ChatPrint( "Sorry, you are banned from spawning props", ply )
        RAS.Log( ply:Nick().."["..ply:SteamID().."]".." tried to spawn a prop but is banned from spawning them!" )
        return false
      else
  			RAS.ChatPrint( "STOP SPAMMING THE SERVER!", ply )
  			RAS.Log( ply:Nick().."["..ply:SteamID().."]".." was prop spamming the server!" )
  			return false
      end
		end
		ply:EnablePropSpawning( false )
		timer.Simple( RAS.Config.Prop.Delay, function()
			RAS.PropResetTimer ( ply )
		end)
	end
end
hook.Add( "PlayerSpawnProp", "RAS.Prop.Spawning", RAS.Prop.Spawning )

function RAS.Sent.ResetTimer( ply )
	ply:EnableSentSpawning( true )
end

function RAS.Sent.Spawning( ply, model, ent )
	if RAS.Config.AntiSpamming then
		if !ply:CanSentSpawn() then
      if RAS.IsBannedSent( ply:SteamID() ) then
        RAS.ChatPrint( "Sorry, you are banned from spawning scripted entities", ply )
        RAS.Log( ply:Nick().."["..ply:SteamID().."]".." tried to spawn a scripted entity but is banned from spawning them!" )
        return false
      else
  			RAS.ChatPrint( "STOP SPAMMING THE SERVER!", ply )
  			RAS.Log( ply:Nick().."["..ply:SteamID().."]".." was spamming the server with scripted ents!" )
  			return false
      end
		end
		ply:EnableSentSpawning( false )
		timer.Simple( RAS.Config.Sent.Delay, function()
			RAS.SentResetTimer ( ply )
		end)
	end
end
hook.Add( "PlayerSpawnSENT", "RAS.Sent.Spawning", RAS.Sent.Spawning )

function RAS.EffectResetTimer( ply )
	ply:EnableEffectSpawning( true )
end

function RAS.Effect.Spawning( ply, model, ent )
	if RAS.Config.AntiSpamming then
		if !ply:CanEffectSpawn() then
      if RAS.IsBannedEffect( ply:SteamID() ) then
        RAS.ChatPrint( "Sorry, you are banned from spawning effects", ply )
        RAS.Log( ply:Nick().."["..ply:SteamID().."]".." tried to spawn effects but is banned from spawning them!" )
        return false
      else
  			RAS.ChatPrint( "STOP SPAMMING THE SERVER!", ply )
  			RAS.Log( ply:Nick().."["..ply:SteamID().."]".." was effect spamming the server!" )
  			return false
      end
		end
		ply:EnableEffectSpawning( false )
		timer.Simple( RAS.Config.Effect.Delay, function()
			RAS.EffectResetTimer ( ply )
		end)
	end
end
hook.Add( "PlayerSpawnEffect", "RAS.Effect.Spawning", RAS.Effect.Spawning )

function RAS.RagdollResetTimer( ply )
	ply:EnableRagdollSpawning( true )
end

function RAS.Ragdoll.Spawning( ply, model, ent )
	if RAS.Config.AntiSpamming then
		if !ply:CanRagdollSpawn() then
      if RAS.IsBannedRagdoll( ply:SteamID() ) then
        RAS.ChatPrint( "Sorry, you are banned from spawning ragdolls", ply )
        RAS.Log( ply:Nick().."["..ply:SteamID().."]".." tried to spawn ragdolls but is banned from spawning them!" )
        return false
      else
  			RAS.ChatPrint( "STOP SPAMMING THE SERVER!", ply )
  			RAS.Log( ply:Nick().."["..ply:SteamID().."]".." was ragdoll spamming the server!" )
  			return false
      end
		end
		ply:EnableRagdollSpawning( false )
		timer.Simple( RAS.Config.Ragdoll.Delay, function()
			RAS.RagdollResetTimer ( ply )
		end)
	end
end
hook.Add( "PlayerSpawnRagdoll", "RAS.Ragdoll.Spawning", RAS.Ragdoll.Spawning )

function RAS.VehicleResetTimer( ply )
	ply:EnableVehicleSpawning(true)
end

function RAS.Vehicle.Spawning( ply, model, ent )
	if RAS.Config.AntiSpamming then
		if !ply:CanVehicleSpawn() then
      if RAS.IsBannedVehicle( ply:SteamID() ) then
        RAS.ChatPrint( "Sorry, you are banned from spawning vehicles", ply )
        RAS.Log( ply:Nick().."["..ply:SteamID().."]".." tried to spawn vehicles but is banned from spawning them!" )
        return false
      else
  			RAS.ChatPrint( "STOP SPAMMING THE SERVER!", ply )
  			RAS.Log( ply:Nick().."["..ply:SteamID().."]".." was vehicle spamming the server!" )
  			return false
      end
		end
		ply:EnableVehicleSpawning(false)
		timer.Simple(RAS.Config.Vehicle.Delay, function()
			RAS.VehicleResetTimer ( ply )
		end)
	end
end
hook.Add("PlayerSpawnVehicle", "RAS.Vehicle.Spawning", RAS.Vehicle.Spawning)

function RAS.NpcResetTimer( ply )
	ply:EnableNpcSpawning(true)
end

function RAS.Npc.Spawning( ply, model, ent )
	if RAS.Config.AntiSpamming then
		if !ply:CanNpcSpawn() then
      if RAS.IsBannedNpc( ply:SteamID() ) then
        RAS.ChatPrint( "Sorry, you are banned from spawning NPCs", ply )
        RAS.Log( ply:Nick().."["..ply:SteamID().."]".." tried to spawn NPCs but is banned from spawning them!" )
        return false
      else
  			RAS.ChatPrint( "STOP SPAMMING THE SERVER!", ply )
  			RAS.Log( ply:Nick().."["..ply:SteamID().."]".." was NPC spamming the server!" )
  			return false
      end
		end
		ply:EnableNpcSpawning(false)
		timer.Simple(RAS.Config.Npc.Delay, function()
			RAS.NpcResetTimer ( ply )
		end)
	end
end
// hook event when a player spawns a(n) Npc
hook.Add("PlayerSpawnNPC", "RAS.Npc.Spawning", RAS.Npc.Spawning)

-- Meta Tables --

function meta:CanChat()
  if !RAS.Config.AntiSpamming then
    return true
	elseif !RAS.Config.Chat.Enabled then
		return true
	elseif table.HasValue( RAS.Chat.Players, self:SteamID() ) then
		return false
  elseif RAS.IsExemptChat( self:SteamID() ) then
    return true
  elseif RAS.IsBannedChat( self:SteamID() ) then
    return false
  else
    return true
  end
end

function meta:CanPropSpawn()
  if !RAS.Config.AntiSpamming then
    return true
	elseif !RAS.Config.Prop.Enabled then
		return true
  elseif table.HasValue( RAS.Prop.Players, self:SteamID() ) then
    return false
  elseif RAS.IsExemptProp( self:SteamID() ) then
    return true
  elseif RAS.IsBannedProp( self:SteamID() ) then
    return false
  else
    return true
  end
end

function meta:CanSentSpawn()
  if !RAS.Config.AntiSpamming then
    return true
	elseif !RAS.Config.Sent.Enabled then
		return true
  elseif table.HasValue( RAS.Sent.Players, self:SteamID() ) then
    return false
  elseif RAS.IsExemptSent( self:SteamID() ) then
    return true
  elseif RAS.IsBannedSent( self:SteamID() ) then
    return false
  else
    return true
  end
end

function meta:CanRagdollSpawn()
  if !RAS.Config.AntiSpamming then
    return true
	elseif !RAS.Config.Ragdoll.Enabled then
		return true
  elseif table.HasValue( RAS.Ragdoll.Players, self:SteamID() ) then
    return false
  elseif RAS.IsExemptRagdoll( self:SteamID() ) then
    return true
  elseif RAS.IsBannedRagdoll( self:SteamID() ) then
    return false
  else
    return true
  end
end

function meta:CanVehicleSpawn()
  if !RAS.Config.AntiSpamming then
    return true
	elseif !RAS.Config.Vehicle.Enabled then
		return true
  elseif table.HasValue( RAS.Vehicle.Players, self:SteamID() ) then
    return false
  elseif RAS.IsExemptVehicle( self:SteamID() ) then
    return true
  elseif RAS.IsBannedVehicle( self:SteamID() ) then
    return false
  else
    return true
  end
end

function meta:CanNpcSpawn()
  if !RAS.Config.AntiSpamming then
    return true
	elseif !RAS.Config.Npc.Enabled then
		return true
  elseif table.HasValue( RAS.Npc.Players, self:SteamID() ) then
    return false
  elseif RAS.IsExemptNpc( self:SteamID() ) then
    return true
  elseif RAS.IsBannedNpc( self:SteamID() ) then
    return false
  else
    return true
  end
end

function meta:CanEffectSpawn()
  if !RAS.Config.AntiSpamming then
    return true
	elseif !RAS.Config.Effect.Enabled then
		return true
  elseif table.HasValue( RAS.Effect.Players, self:SteamID() ) then
    return false
  elseif RAS.IsExemptEffect( self:SteamID() ) then
    return true
  elseif RAS.IsBannedEffect( self:SteamID() ) then
    return false
  else
    return true
  end
end

function meta:EnableChatting(bool)
	if bool then
		table.remove( RAS.Chat.Players, RAS.tableValueToKey( RAS.Chat.Players, self:SteamID() ) )
	else
		table.insert( RAS.Chat.Players, self:SteamID() )
	end
end

function meta:EnablePropSpawning(bool)
	if bool then
		table.remove(RAS.Prop.Players, RAS.tableValueToKey(RAS.Prop.Players,self:SteamID()))
	else
		table.insert(RAS.Prop.Players, self:SteamID())
	end
end

function meta:EnableSentSpawning(bool)
	if bool then
		table.remove(RAS.Sent.Players, RAS.tableValueToKey(RAS.Sent.Players,self:SteamID()))
	else
		table.insert(RAS.Sent.Players, self:SteamID())
	end
end

function meta:EnableRagdollSpawning(bool)
	if bool then
		table.remove(RAS.Ragdoll.Players, RAS.tableValueToKey(RAS.Ragdoll.Players,self:SteamID()))
	else
		table.insert(RAS.Ragdoll.Players, self:SteamID())
	end
end

function meta:EnableVehicleSpawning(bool)
	if bool then
		table.remove(RAS.Vehicle.Players, RAS.tableValueToKey(RAS.Vehicle.Players,self:SteamID()))
	else
		table.insert(RAS.Vehicle.Players, self:SteamID())
	end
end

function meta:EnableNpcSpawning(bool)
	if bool then
		table.remove(RAS.Npc.Players, RAS.tableValueToKey(RAS.Npc.Players,self:SteamID()))
	else
		table.insert(RAS.Npc.Players, self:SteamID())
	end
end

function meta:EnableEffectSpawning(bool)
	if bool then
		table.remove(RAS.Effect.Players, RAS.tableValueToKey(RAS.Effect.Players,self:SteamID()))
	else
		table.insert(RAS.Effect.Players, self:SteamID())
	end
end
