local meta = FindMetaTable( "Player" )

hook.Add("PlayerSay", "RASPlayerSay", function(ply, text) 
	if ply:CanChat() == "exempt" then return text end
	if ply:CanChat() == "banned" then return "" end
	if !ply:CanChat() then
		local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["ChatSpamResp"], "{RAS_Cooldown}", ply.ChatCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return ""
	end
	ply:EnableChatting(false)
end)

hook.Add("PlayerSpawnProp", "RASSpawnProp", function(ply, model, ent)
	if ply:CanPropSpawn() == "exempt" then return true end
	if ply:CanPropSpawn() == "banned" then return false end
	if !ply:CanPropSpawn() then
		local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["PropSpamResp"], "{RAS_Cooldown}", ply.PropCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return false
	end
	ply:EnablePropSpawning(false)
end)

hook.Add("PlayerSpawnSENT", "RASSpawnSENT", function(ply, model, ent)
	if ply:CanSentSpawn() == "exempt" then return true end
	if ply:CanSentSpawn() == "banned" then return false end
	if !ply:CanSentSpawn() then
		local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["SentSpamResp"], "{RAS_Cooldown}", ply.SentCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return false
	end
	ply:EnableSentSpawning(false)
end)

hook.Add("PlayerSpawnEffect", "RASSpawnEffect", function(ply, model, ent)
	if ply:CanEffectSpawn() == "exempt" then return true end
	if ply:CanEffectSpawn() == "banned" then return false end
	if !ply:CanEffectSpawn() then
		local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["EffectSpamResp"], "{RAS_Cooldown}", ply.EffectCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return false
	end
	ply:EnableEffectSpawning(false)
end)

hook.Add("PlayerSpawnRagdoll", "RASSpawnRagdoll", function(ply, model, ent)
	if ply:CanRagdollSpawn() == "exempt" then return true end
	if ply:CanRagdollSpawn() == "banned" then return false end
	if !ply:CanRagdollSpawn() then
		local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["RagdollSpamResp"], "{RAS_Cooldown}", ply.RagdollCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return false
	end
	ply:EnableRagdollSpawning(false)
end)

hook.Add("PlayerSpawnVehicle", "RASSpawnVehicle", function(ply, model, ent)
	if ply:CanVehicleSpawn() == "exempt" then return true end
	if ply:CanVehicleSpawn() == "banned" then return false end
	if !ply:CanVehicleSpawn() then
		local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["VehicleSpamResp"], "{RAS_Cooldown}", ply.VehicleCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return false
	end
	ply:EnableVehicleSpawning(false)
end)

hook.Add("PlayerSpawnNPC", "RASSpawnNPC", function(ply, model, ent)
	if ply:CanNpcSpawn() == "exempt" then return true end
	if ply:CanNpcSpawn() == "banned" then return false end
	if !ply:CanNpcSpawn() then
		local msg = string.gsub(RAS.Config.Language[RAS.Config.LanguageToUse]["NpcSpamResp"], "{RAS_Cooldown}", ply.NpcCooldown - os.time())
		RAS.NotifySystem(ply, "info", msg)
		return false
	end
	ply:EnableNpcSpawning(false)
end)

-- Meta Tables --

function meta:CanChat()
  if !RAS.Config.AntiSpamming then
    return "exempt"
	elseif !RAS.Config.Chat.Enabled then
		return "exempt"
	elseif self:RASIsExempt("chat") or self:RASIsExempt("all")  then
    return "exempt"
	elseif self:RASIsBanned("chat") or self:RASIsBanned("all") then
		RAS.NotifySystem(self, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["ChatBannedResp"])
    return "banned"
	elseif self.ChatCooldown >= os.time() then
		return false
	elseif self.ChatCooldown < os.time() then
		return true
	else
		return true
  end
end

function meta:CanPropSpawn()
  if !RAS.Config.AntiSpamming then
    return "exempt"
	elseif !RAS.Config.Prop.Enabled then
		return "exempt"
	elseif self:RASIsExempt("prop") or self:RASIsExempt("all") then
    return "exempt"
	elseif self:RASIsBanned("prop") or self:RASIsBanned("all") then
		RAS.NotifySystem(self, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["PropBannedResp"])
    return "banned"
  elseif self.PropCooldown >= os.time() then
		return false
	elseif self.PropCooldown < os.time() then
		return true
  else
    return true
  end
end

function meta:CanSentSpawn()
  if !RAS.Config.AntiSpamming then
    return "exempt"
	elseif !RAS.Config.Sent.Enabled then
		return "exempt"
	elseif self:RASIsExempt("sent") or self:RASIsExempt("all") then
    return "exempt"
	elseif self:RASIsBanned("sent") or self:RASIsBanned("all") then
		RAS.NotifySystem(self, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["SentBannedResp"])
    return "banned"
  elseif self.SentCooldown >= os.time() then
		return false
	elseif self.SentCooldown < os.time() then
		return true
  else
    return true
  end
end

function meta:CanRagdollSpawn()
  if !RAS.Config.AntiSpamming then
    return "exempt"
	elseif !RAS.Config.Ragdoll.Enabled then
		return "exempt"
	elseif self:RASIsExempt("ragdoll") or self:RASIsExempt("all") then
    return "exempt"
	elseif self:RASIsBanned("ragdoll") or self:RASIsBanned("all") then
		RAS.NotifySystem(self, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["RagdollBannedResp"])
    return "banned"
  elseif self.RagdollCooldown >= os.time() then
		return false
	elseif self.RagdollCooldown < os.time() then
		return true
  else
    return true
  end
end

function meta:CanVehicleSpawn()
  if !RAS.Config.AntiSpamming then
    return "exempt"
	elseif !RAS.Config.Vehicle.Enabled then
		return "exempt"
	elseif self:RASIsExempt("vehicle") or self:RASIsExempt("all") then
    return "exempt"
	elseif self:RASIsBanned("vehicle") or self:RASIsBanned("all") then
		RAS.NotifySystem(self, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["VehicleBannedResp"])
    return "banned"
  elseif self.VehicleCooldown >= os.time() then
		return false
	elseif self.VehicleCooldown < os.time() then
		return true
  else
    return true
  end
end

function meta:CanNpcSpawn()
  if !RAS.Config.AntiSpamming then
    return "exempt"
	elseif !RAS.Config.Npc.Enabled then
		return "exempt"
	elseif self:RASIsExempt("npc") or self:RASIsExempt("all") then
    return "exempt"
	elseif self:RASIsBanned("npc") or self:RASIsBanned("all") then
		RAS.NotifySystem(self, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["NpcBannedResp"])
    return "banned"
  elseif self.NpcCooldown >= os.time() then
		return false
	elseif self.NpcCooldown < os.time() then
		return true
  else
    return true
  end
end

function meta:CanEffectSpawn()
  if !RAS.Config.AntiSpamming then
    return "exempt"
	elseif !RAS.Config.Effect.Enabled then
		return "exempt"
	elseif self:RASIsExempt("effect") or self:RASIsExempt("all") then
    return "exempt"
	elseif self:RASIsBanned("effect") or self:RASIsBanned("all") then
		RAS.NotifySystem(self, "info", RAS.Config.Language[RAS.Config.LanguageToUse]["EffectBannedResp"])
    return "banned"
  elseif self.EffectCooldown >= os.time() then
		return false
	elseif self.EffectCooldown < os.time() then
		return true
  else
    return true
  end
end

function meta:EnableChatting(bool)
	if bool then
		self.ChatCooldown = os.time() - 1
	else
		self.ChatCooldown = os.time() + RAS.Config.Chat.Delay
	end
end

function meta:EnablePropSpawning(bool)
	if bool then
		self.PropCooldown = os.time() - 1
	else
		self.PropCooldown = os.time() + RAS.Config.Prop.Delay
	end
end

function meta:EnableSentSpawning(bool)
	if bool then
		self.SentCooldown = os.time() - 1
	else
		self.SentCooldown = os.time() + RAS.Config.Sent.Delay
	end
end

function meta:EnableRagdollSpawning(bool)
	if bool then
		self.RagdollCooldown = os.time() - 1
	else
		self.RagdollCooldown = os.time() + RAS.Config.Ragdoll.Delay
	end
end

function meta:EnableVehicleSpawning(bool)
	if bool then
		self.VehicleCooldown = os.time() - 1
	else
		self.VehicleCooldown = os.time() + RAS.Config.Vehicle.Delay
	end
end

function meta:EnableNpcSpawning(bool)
	if bool then
		self.NpcCooldown = os.time() - 1
	else
		self.NpcCooldown = os.time() + RAS.Config.Npc.Delay
	end
end

function meta:EnableEffectSpawning(bool)
	if bool then
		self.EffectCooldown = os.time() - 1
	else
		self.EffectCooldown = os.time() + RAS.Config.Effect.Delay
	end
end
