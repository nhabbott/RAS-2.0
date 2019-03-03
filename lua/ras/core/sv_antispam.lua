local meta = FindMetaTable( "Player" )
local config = RAS.Config

hook.Add("PlayerSay", "RASPlayerSay", function(ply, text) 
	if ply:CanChat() == "exempt" then return text end
	if ply:CanChat() == "banned" then return "" end
	if !ply:CanChat() then
		local msg = string.gsub(config.Language[config.LanguageToUse]["ChatSpamResp"], "{RAS_Cooldown}", ply.ChatCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return ""
	end
	ply:EnableChatting(false)
	return text
end)

hook.Add("PlayerSpawnProp", "RASSpawnProp", function(ply, model, ent)
	if ply:CanPropSpawn() == "exempt" then return true end
	if ply:CanPropSpawn() == "banned" then return false end
	if !ply:CanPropSpawn() then
		local msg = string.gsub(config.Language[config.LanguageToUse]["PropSpamResp"], "{RAS_Cooldown}", ply.PropCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return false
	end
	ply:EnablePropSpawning(false)
	return true
end)

hook.Add("PlayerSpawnSENT", "RASSpawnSENT", function(ply, model, ent)
	if ply:CanSentSpawn() == "exempt" then return true end
	if ply:CanSentSpawn() == "banned" then return false end
	if !ply:CanSentSpawn() then
		local msg = string.gsub(config.Language[config.LanguageToUse]["SentSpamResp"], "{RAS_Cooldown}", ply.SentCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return false
	end
	ply:EnableSentSpawning(false)
	return true
end)

hook.Add("PlayerSpawnEffect", "RASSpawnEffect", function(ply, model, ent)
	if ply:CanEffectSpawn() == "exempt" then return true end
	if ply:CanEffectSpawn() == "banned" then return false end
	if !ply:CanEffectSpawn() then
		local msg = string.gsub(config.Language[config.LanguageToUse]["EffectSpamResp"], "{RAS_Cooldown}", ply.EffectCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return false
	end
	ply:EnableEffectSpawning(false)
	return true
end)

hook.Add("PlayerSpawnRagdoll", "RASSpawnRagdoll", function(ply, model, ent)
	if ply:CanRagdollSpawn() == "exempt" then return true end
	if ply:CanRagdollSpawn() == "banned" then return false end
	if !ply:CanRagdollSpawn() then
		local msg = string.gsub(config.Language[config.LanguageToUse]["RagdollSpamResp"], "{RAS_Cooldown}", ply.RagdollCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return false
	end
	ply:EnableRagdollSpawning(false)
	return true
end)

hook.Add("PlayerSpawnVehicle", "RASSpawnVehicle", function(ply, model, ent)
	if ply:CanVehicleSpawn() == "exempt" then return true end
	if ply:CanVehicleSpawn() == "banned" then return false end
	if !ply:CanVehicleSpawn() then
		local msg = string.gsub(config.Language[config.LanguageToUse]["VehicleSpamResp"], "{RAS_Cooldown}", ply.VehicleCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return false
	end
	ply:EnableVehicleSpawning(false)
	return true
end)

hook.Add("PlayerSpawnNPC", "RASSpawnNPC", function(ply, model, ent)
	if ply:CanNpcSpawn() == "exempt" then return true end
	if ply:CanNpcSpawn() == "banned" then return false end
	if !ply:CanNpcSpawn() then
		local msg = string.gsub(config.Language[config.LanguageToUse]["NpcSpamResp"], "{RAS_Cooldown}", ply.NpcCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return false
	end
	ply:EnableNpcSpawning(false)
	return true
end)

-- Meta Tables --

function meta:CanChat()
  if !config.AntiSpamming then
    return "exempt"
	elseif !config.Chat.Enabled then
		return "exempt"
	elseif self.ChatCooldown >= os.time() then
		return false
	elseif self.ChatCooldown < os.time() then
		return true 
  elseif self:RASIsExempt("chat") then
    return "exempt"
	elseif self:RASIsBanned("chat") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["ChatBannedResp"])
    return "banned"
  else
    return true
  end
end

function meta:CanPropSpawn()
  if !config.AntiSpamming then
    return "exempt"
	elseif !config.Prop.Enabled then
		return "exempt"
  elseif self.PropCooldown >= os.time() then
		return false
	elseif self.PropCooldown < os.time() then
		return true
  elseif self:RASIsExempt("prop") then
    return "exempt"
	elseif self:RASIsBanned("prop") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["PropBannedResp"])
    return "banned"
  else
    return true
  end
end

function meta:CanSentSpawn()
  if !config.AntiSpamming then
    return "exempt"
	elseif !config.Sent.Enabled then
		return "exempt"
  elseif self.SentCooldown >= os.time() then
		return false
	elseif self.SentCooldown < os.time() then
		return true
  elseif self:RASIsExempt("sent") then
    return "exempt"
	elseif self:RASIsBanned("sent") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["SentBannedResp"])
    return "banned"
  else
    return true
  end
end

function meta:CanRagdollSpawn()
  if !config.AntiSpamming then
    return "exempt"
	elseif !config.Ragdoll.Enabled then
		return "exempt"
  elseif self.RagdollCooldown >= os.time() then
		return false
	elseif self.RagdollCooldown < os.time() then
		return true
  elseif self:RASIsExempt("ragdoll") then
    return "exempt"
	elseif self:RASIsBanned("ragdoll") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["RagdollBannedResp"])
    return "banned"
  else
    return true
  end
end

function meta:CanVehicleSpawn()
  if !config.AntiSpamming then
    return "exempt"
	elseif !config.Vehicle.Enabled then
		return "exempt"
  elseif self.VehicleCooldown >= os.time() then
		return false
	elseif self.VehicleCooldown < os.time() then
		return true
  elseif self:RASIsExempt("vehicle") then
    return "exempt"
	elseif self:RASIsBanned("vehicle") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["VehicleBannedResp"])
    return "banned"
  else
    return true
  end
end

function meta:CanNpcSpawn()
  if !config.AntiSpamming then
    return "exempt"
	elseif !config.Npc.Enabled then
		return "exempt"
  elseif self.NpcCooldown >= os.time() then
		return false
	elseif self.NpcCooldown < os.time() then
		return true
  elseif self:RASIsExempt("npc") then
    return "exempt"
	elseif self:RASIsBanned("npc") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["NpcBannedResp"])
    return "banned"
  else
    return true
  end
end

function meta:CanEffectSpawn()
  if !config.AntiSpamming then
    return "exempt"
	elseif !config.Effect.Enabled then
		return "exempt"
  elseif self.EffectCooldown >= os.time() then
		return false
	elseif self.EffectCooldown < os.time() then
		return true
  elseif self:RASIsExempt("effect") then
    return "exempt"
	elseif self:RASIsBanned("effect") then
		RAS.NotifySystem(ply, "info", config.Language[config.LanguageToUse]["EffectBannedResp"])
    return "banned"
  else
    return true
  end
end

function meta:EnableChatting(bool)
	if bool then
		self.ChatCooldown = os.time() - 1
	else
		self.ChatCooldown = os.time() + config.Chat.Delay
	end
end

function meta:EnablePropSpawning(bool)
	if bool then
		self.PropCooldown = os.time() - 1
	else
		self.PropCooldown = os.time() + config.Prop.Delay
	end
end

function meta:EnableSentSpawning(bool)
	if bool then
		self.SentCooldown = os.time() - 1
	else
		self.SentCooldown = os.time() + config.Sent.Delay
	end
end

function meta:EnableRagdollSpawning(bool)
	if bool then
		self.RagdollCooldown = os.time() - 1
	else
		self.RagdollCooldown = os.time() + config.Ragdoll.Delay
	end
end

function meta:EnableVehicleSpawning(bool)
	if bool then
		self.VehicleCooldown = os.time() - 1
	else
		self.VehicleCooldown = os.time() + config.Vehicle.Delay
	end
end

function meta:EnableNpcSpawning(bool)
	if bool then
		self.NpcCooldown = os.time() - 1
	else
		self.NpcCooldown = os.time() + config.Npc.Delay
	end
end

function meta:EnableEffectSpawning(bool)
	if bool then
		self.EffectCooldown = os.time() - 1
	else
		self.EffectCooldown = os.time() + config.Effect.Delay
	end
end
