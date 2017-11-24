RAS.Chat = {}
RAS.Prop = {}
RAS.Sent = {}
RAS.Effect = {}
RAS.Ragdoll = {}
RAS.Vehicle = {}
RAS.Npc = {}
RAS.Config = {}

RAS.FirstLoad = true

// The RAS system is enabled by default
RAS.Config.AntiSpamming = true

//DO NOT TOUCH
RAS.Chat.Players = {}
RAS.Prop.Players = {}
RAS.Effect.Players = {}
RAS.Ragdoll.Players = {}
RAS.Vehicle.Players = {}
RAS.Npc.Players = {}
RAS.Sent.Players = {}

// Chat RAS Settings
RAS.Config.Chat = {}
RAS.Config.Chat.Enabled = true
RAS.Config.Chat.Delay = 5

// Prop RAS Settings
RAS.Config.Prop = {}
RAS.Config.Prop.Enabled = true
RAS.Config.Prop.Delay = 5

// Scripted Ents RAS Settings
RAS.Config.Sent = {}
RAS.Config.Sent.Enabled = true
RAS.Config.Sent.Delay = 5

// Effects RAS Settings
RAS.Config.Effect = {}
RAS.Config.Effect.Enabled = true
RAS.Config.Effect.Delay = 5

// Ragdoll RAS Settings
RAS.Config.Ragdoll = {}
RAS.Config.Ragdoll.Enabled = true
RAS.Config.Ragdoll.Delay = 5

// Vehicle RAS Settings
RAS.Config.Vehicle = {}
RAS.Config.Vehicle.Enabled = true
RAS.Config.Vehicle.Delay = 5

// NPC RAS Settings
RAS.Config.Npc = {}
RAS.Config.Npc.Enabled = true
RAS.Config.Npc.Delay = 5

/*=======================================*\
|==========================================\
	Usergroup Configuration
	Syntax: ['usergroupname'] = true OR False
|==========================================|
\*=======================================*/

RAS.Config.UserGroups = {
	['owner'] 		= true,
	['superadmin'] 	= true,
	['admin'] 		= true,
	['moderator'] 	= true
}

//Config for MySQL
RAS.MySQL = {}
RAS.MySQL.Host = "db4free.net"
RAS.MySQL.User = "raindeeras"
RAS.MySQL.Pass = "1qaz2wsx"
RAS.MySQL.Database = "raindeeras"
RAS.MySQL.Port = "3306" //Normally this is 3306
