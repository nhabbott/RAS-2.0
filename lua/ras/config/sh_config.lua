-----------------------------------------------------------------------------
-- MySQL Config can be found in the 'sv_mysql_config.lua' file
-----------------------------------------------------------------------------

local config = RAS.Config

config.LanguageToUse = "English" -- Supports 'English'

if (SERVER) then
	-- The RAS system is enabled by default
	config.AntiSpamming = true

	-- Chat RAS Settings
	config.Chat.Enabled = true
	config.Chat.Delay = 5

	-- Prop RAS Settings
	config.Prop.Enabled = true
	config.Prop.Delay = 5

	-- Scripted Ents RAS Settings
	config.Sent.Enabled = true
	config.Sent.Delay = 5

	-- Effects RAS Settings
	config.Effect.Enabled = true
	config.Effect.Delay = 5

	-- Ragdoll RAS Settings
	config.Ragdoll.Enabled = true
	config.Ragdoll.Delay = 5

	-- Vehicle RAS Settings
	config.Vehicle.Enabled = true
	config.Vehicle.Delay = 5

	-- NPC RAS Settings
	config.Npc.Enabled = true
	config.Npc.Delay = 5

	-----------------------------------------------------------------------------
	--	Usergroup Configuration
	--	Syntax: ['usergroupname'] = true OR False
	-----------------------------------------------------------------------------

	config.UserGroups = {['owner']	= true, ['superadmin'] = true, ['admin'] = true, ['moderator'] = true} -- The ranks that can open the RAS config menu
end

if (CLIENT) then
	config.MainTextColor = Color(255,255,255,255) -- Main color for text
	config.LblTextColor = Color(0,0,0,255) -- Label color for text
	config.PrimaryColor = Color(0,134,179,255) -- Primary color
	config.LightColor = Color(86,182,229,255) -- Light color
	config.DarkColor = Color(0,89,131,255) -- Dark color
end
