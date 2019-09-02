-----------------------------------------------------------------------------
-- MySQL Config can be found in the 'sv_mysql_config.lua' file
-----------------------------------------------------------------------------

RAS.Config.FirstRun = true -- Do not touch

RAS.Config.LanguageToUse = "English" -- Supports 'English'

if (SERVER) then
	-- The RAS system is enabled by default
	RAS.Config.AntiSpamming = true

	-- ALL DELAYS ARE IN SECONDS! --

	-- Chat RAS Settings
	RAS.Config.Chat.Enabled = true
	RAS.Config.Chat.Delay = 15

	-- Prop RAS Settings
	RAS.Config.Prop.Enabled = true
	RAS.Config.Prop.Delay = 5

	-- Scripted Ents RAS Settings
	RAS.Config.Sent.Enabled = true
	RAS.Config.Sent.Delay = 5

	-- Effects RAS Settings
	RAS.Config.Effect.Enabled = true
	RAS.Config.Effect.Delay = 5

	-- Ragdoll RAS Settings
	RAS.Config.Ragdoll.Enabled = true
	RAS.Config.Ragdoll.Delay = 5

	-- Vehicle RAS Settings
	RAS.Config.Vehicle.Enabled = true
	RAS.Config.Vehicle.Delay = 5

	-- NPC RAS Settings
	RAS.Config.Npc.Enabled = true
	RAS.Config.Npc.Delay = 5

	-----------------------------------------------------------------------------
	--	Usergroup Configuration
	--	Syntax for commands: ['usergroupname'] = true OR False
	--  Syntax for admin menu: ['usergroupname'] = {'main', 'bans', 'settings'}
	-----------------------------------------------------------------------------

	RAS.Config.UserGroups = {['owner']	= true, ['superadmin'] = true, ['admin'] = true, ['moderator'] = true} -- The ranks that can use chat commands

	-- The ranks that can open the admin menu. If you only want the rank to be able to acces the logs, remove the settings option so it looks like
	-- ['usergroupname'] = {'main', 'bans'}
	RAS.Config.UserGroupMenu = {['owner'] = {'main', 'bans', 'settings'}, ['superadmin'] = {'main', 'bans', 'settings'}, ['admin'] = {'main', 'bans', 'settings'}, ['moderator'] = {'main', 'bans', 'settings'}}
end

if (CLIENT) then
	RAS.Config.MainTextColor = Color(255,255,255,255) -- Main color for text
	RAS.Config.LblTextColor = Color(0,0,0,255) -- Label color for text
	RAS.Config.PrimaryColor = Color(0,134,179,255) -- Primary color
	RAS.Config.LightColor = Color(86,182,229,255) -- Light color
	RAS.Config.DarkColor = Color(0,89,131,255) -- Dark color
	RAS.Config.CircleRippleColor = Color(220, 220, 220, 50) -- Color of the ripple after clicking a circle button
end
