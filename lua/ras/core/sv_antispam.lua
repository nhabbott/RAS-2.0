local meta = FindMetaTable( "Player" )
local config = RAS.Config

hook.Add("PlayerSay", "RASPlayerSay", function(ply, text) 
	local p = ply
	if config.AntiSpamming then
		if !ply:CanChat() then
			RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["ChatSpamResp"])
			return false
		end
		ply:EnableChatting(false)
		timer.Simple(config.Chat.Delay, function()
			Msg("oooooooooffffffffff")
			return p:EnableChatting(true)
		end)
	end
end)

hook.Add("PlayerSpawnProp", "RASSpawnProp", function(ply, model, ent)
	if config.AntiSpamming then
		if !ply:CanPropSpawn() then
			RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["PropSpamResp"])
			return false
		end
		ply:EnablePropSpawning(false)
		timer.Simple(config.Prop.Delay, function()
			ply:EnablePropSpawning(true)
		end)
	end
end)

hook.Add("PlayerSpawnSENT", "RASSpawnSENT", function(ply, model, ent)
	if config.AntiSpamming then
		if !ply:CanSentSpawn() then
			RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["SentSpamResp"])
			return false
		end
		ply:EnableSentSpawning(false)
		timer.Simple(config.Sent.Delay, function()
			ply:EnableSentSpawning(true)
		end)
	end
end)

hook.Add("PlayerSpawnEffect", "RASSpawnEffect", function(ply, model, ent)
	if config.AntiSpamming then
		if !ply:CanEffectSpawn() then
			RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["EffectSpamResp"])
			return false
		end
		ply:EnableEffectSpawning(false)
		timer.Simple(config.Effect.Delay, function()
			ply:EnableEffectSpawning(true)
		end)
	end
end)

hook.Add("PlayerSpawnRagdoll", "RASSpawnRagdoll", function(ply, model, ent)
	if config.AntiSpamming then
		if !ply:CanRagdollSpawn() then
			RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["RagdollSpamResp"])
  		return false
		end
		ply:EnableRagdollSpawning(false)
		timer.Simple(config.Ragdoll.Delay, function()
			ply:EnableRagdollSpawning(true)
		end)
	end
end)

hook.Add("PlayerSpawnVehicle", "RASSpawnVehicle", function(ply, model, ent)
	if config.AntiSpamming then
		if !ply:CanVehicleSpawn() then
			RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["VehicleSpamResp"])
  		return false
		end
		ply:EnableVehicleSpawning(false)
		timer.Simple(config.Vehicle.Delay, function()
			ply:EnableVehicleSpawning(true)
		end)
	end
end)

hook.Add("PlayerSpawnNPC", "RASSpawnNPC", function(ply, model, ent)
	if config.AntiSpamming then
		if !ply:CanNpcSpawn() then
			RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NpcSpamResp"])
  		return false
		end
		ply:EnableNpcSpawning(false)
		timer.Simple(config.Npc.Delay, function()
			ply:EnableNpcSpawning(true)
		end)
	end
end)

-- Meta Tables --

function meta:CanChat()
  if !config.AntiSpamming then
    return true
	elseif !config.Chat.Enabled then
		return true
	elseif table.HasValue(RAS.Config.Chat.Players, self:SteamID()) then
		return false
  elseif self:RASIsExempt("chat") then
    return true
	elseif self:RASIsBanned("chat") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["ChatBannedResp"])
    return false
  else
    return true
  end
end

function meta:CanPropSpawn()
  if !config.AntiSpamming then
    return true
	elseif !config.Prop.Enabled then
		return true
  elseif table.HasValue(RAS.Config.Prop.Players, self:SteamID()) then
    return false
  elseif self:RASIsExempt("prop") then
    return true
	elseif self:RASIsBanned("prop") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["PropBannedResp"])
    return false
  else
    return true
  end
end

function meta:CanSentSpawn()
  if !config.AntiSpamming then
    return true
	elseif !config.Sent.Enabled then
		return true
  elseif table.HasValue(RAS.Config.Sent.Players, self:SteamID()) then
    return false
  elseif self:RASIsExempt("sent") then
    return true
	elseif self:RASIsBanned("sent") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["SentBannedResp"])
    return false
  else
    return true
  end
end

function meta:CanRagdollSpawn()
  if !config.AntiSpamming then
    return true
	elseif !config.Ragdoll.Enabled then
		return true
  elseif table.HasValue(RAS.Config.Ragdoll.Players, self:SteamID()) then
    return false
  elseif self:RASIsExempt("ragdoll") then
    return true
	elseif self:RASIsBanned("ragdoll") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["RagdollBannedResp"])
    return false
  else
    return true
  end
end

function meta:CanVehicleSpawn()
  if !config.AntiSpamming then
    return true
	elseif !config.Vehicle.Enabled then
		return true
  elseif table.HasValue(RAS.Config.Vehicle.Players, self:SteamID()) then
    return false
  elseif self:RASIsExempt("vehicle") then
    return true
	elseif self:RASIsBanned("vehicle") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["VehicleBannedResp"])
    return false
  else
    return true
  end
end

function meta:CanNpcSpawn()
  if !config.AntiSpamming then
    return true
	elseif !config.Npc.Enabled then
		return true
  elseif table.HasValue(RAS.Config.Npc.Players, self:SteamID()) then
    return false
  elseif self:RASIsExempt("npc") then
    return true
	elseif self:RASIsBanned("npc") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NpcBannedResp"])
    return false
  else
    return true
  end
end

function meta:CanEffectSpawn()
  if !config.AntiSpamming then
    return true
	elseif !config.Effect.Enabled then
		return true
  elseif table.HasValue(RAS.Config.Effect.Players, self:SteamID()) then
    return false
  elseif self:RASIsExempt("effect") then
    return true
	elseif self:RASIsBanned("effect") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["EffectBannedResp"])
    return false
  else
    return true
  end
end

function meta:EnableChatting(bool)
	if bool then
		table.remove(RAS.Config.Chat.Players, RAS.tableValueToKey(RAS.Config.Chat.Players, self:SteamID()))
	else
		table.insert(RAS.Config.Chat.Players, self:SteamID())
	end
end

function meta:EnablePropSpawning(bool)
	if bool then
		table.remove(RAS.Config.Prop.Players, RAS.tableValueToKey(RAS.Config.Prop.Players,self:SteamID()))
	else
		table.insert(RAS.Config.Prop.Players, self:SteamID())
	end
end

function meta:EnableSentSpawning(bool)
	if bool then
		table.remove(RAS.Config.Sent.Players, RAS.tableValueToKey(RAS.Config.Sent.Players,self:SteamID()))
	else
		table.insert(RAS.Config.Sent.Players, self:SteamID())
	end
end

function meta:EnableRagdollSpawning(bool)
	if bool then
		table.remove(RAS.Config.Ragdoll.Players, RAS.tableValueToKey(RAS.Config.Ragdoll.Players,self:SteamID()))
	else
		table.insert(RAS.Config.Ragdoll.Players, self:SteamID())
	end
end

function meta:EnableVehicleSpawning(bool)
	if bool then
		table.remove(RAS.Config.Vehicle.Players, RAS.tableValueToKey(RAS.Config.Vehicle.Players,self:SteamID()))
	else
		table.insert(RAS.Config.Vehicle.Players, self:SteamID())
	end
end

function meta:EnableNpcSpawning(bool)
	if bool then
		table.remove(RAS.Config.Npc.Players, RAS.tableValueToKey(RAS.Config.Npc.Players,self:SteamID()))
	else
		table.insert(RAS.Config.Npc.Players, self:SteamID())
	end
end

function meta:EnableEffectSpawning(bool)
	if bool then
		table.remove(RAS.Config.Effect.Players, RAS.tableValueToKey(RAS.Config.Effect.Players,self:SteamID()))
	else
		table.insert(RAS.Config.Effect.Players, self:SteamID())
	end
end
