/*=======================================*\
|==========================================\
	Raindeer Anti-Spam
	Author: MexicanRaindeer
	Copyright © 2015-2016 MexicanRaindeer
|==========================================|
\*=======================================*/

RAS = {}

--[[Includes]]--
include( "ras/config.lua" )
include( "ras/antispam.lua" )
include( "ras/admincoms.lua" )
include( "include/mysqlite.lua" )
require( "tmysql4" )

--[[Load the config on server startup & Config Func.]]--
	if !file.Exists( "ras_data/ras_config.txt", "DATA" ) then
		file.Write( "ras_data/ras_config.txt", util.TableToJSON( RAS.Config ) )
		MsgC( Color( 61,252,246 ), "\n",
[[ |--------[RAS]--------|
 |     Initilizing     |
 |---------------------|
 |       Version       |
 |         1.0         |
 |---------------------|
 |     Created By:     |
 |   MexicanRaindeer   |
 |---------------------|]], "\n"
)
	else
		local data = file.Read( "ras_data/ras_config.txt" )
		RAS.Config = util.JSONToTable( data )
		print( "[RAS]Config Loaded" )
		MsgC( Color( 61,252,246 ), "\n",
[[ |--------[RAS]--------|
 |     Initilizing     |
 |---------------------|
 |       Version       |
 |         1.0         |
 |---------------------|
 |     Created By:     |
 |   MexicanRaindeer   |
 |---------------------|]], "\n"
)
end

function RAS.UpdateConfig()
	file.Write( "ras_data/ras_config.txt", util.TableToJSON( RAS.Config ) )
end

local Database, error = tmysql.initialize( RAS.MySQL.Host, RAS.MySQL.User, RAS.MySQL.Pass, RAS.MySQL.Database, RAS.MySQL.Port, nil, nil )

--[[Create Tables in MySQL database if not already there]]--
if RAS.FirstLoad then
	timer.Simple( 180, function() Database:Query( "CREATE TABLE exempt ( steam_id TEXT NOT NULL , type TEXT NOT NULL , expire_time BIGINT NOT NULL ) ENGINE = InnoDB; CREATE TABLE banned ( steam_id TEXT NOT NULL , type TEXT NOT NULL , expire_time BIGINT NOT NULL ) ENGINE = InnoDB;" ) RAS.FirstLoad = false RAS.UpdateConfig() end )
end

--[[Checks if SteamID is valid]]--
function RAS.ValidSteamID( data )
   if string.match( data, "^STEAM_%d:%d:%d+$" ) then
		 return true
	else
		return false
	end
end

--[[Gather Current Players' Nicks]]--
local function GetNickNames()
	local tbl = {}
		for k,v in pairs( player.GetHumans() ) do
    	tbl[v:Nick()] = true
    end
  return tbl
end

--[[Get a players SteamID]]--
function RAS.GetSteamID( ply )
	for k, v in pairs( player.GetHumans() ) do
		if string.match( ply, v:Nick() ) then
			return v:SteamID()
		end
	end
end

--[[Valid Player Func]]--
function RAS.ValidPly( ply )
	local tbl = GetNickNames()
  if tbl[string.match( ply, "^.*$" )] then
  	return true
  else
    return false
  end
end

--[[Adds a message <str> to the chat of <ply> or all players if <ply> is not specified]]--
function RAS.ChatPrint( str, ply )
    if !ply then
			PrintMessage( HUD_PRINTTALK, "[RAS] " .. str )
    else
      ply:PrintMessage( HUD_PRINTTALK, "[RAS] " .. str )
    end
end

--[[Adds a notification to the screen of <ply> with the message <message> of type <kind> for <length> seconds]]--
function RAS.AddNotify( ply, message, kind, length )
    net.Start( "RAS.Notification" )
        net.WriteString( message )
        net.WriteInt( kind || NOTIFY_GENERIC )
        net.WriteInt( length || 2 )
    net.Send( ply )
end

--[[Table Func]]--
function RAS.tableValueToKey( _table, value )
	for k, v in pairs( _table ) do
		if v == value then
			return k
		end
	end
end

--[[Access Func.]]--
function RAS.HasPerms( ply )
	if !IsValid( ply ) then return false end
	return RAS.Config.UserGroups[string.lower( ply:GetUserGroup() )]
end

--[[Exempt & Ban Func.]]--
function RAS.IsExemptChat( steamid )
  if !RAS.ValidSteamID( steamid ) then return false end
  Database:Query( "SELECT COUNT( * ) as isExempt FROM exempt WHERE (steam_id = '"..steamid.."') AND (type = 'chat') AND (expire_time > '"..os.time().."')", function( result )
		PrintTable(result)
		if result[1].data[1].isExempt == 1 then
			return true
		elseif result[1].data[1].isExempt == 0 then
			return false
		end
	end)
end

function RAS.IsExemptProp( steamid )
	if !RAS.ValidSteamID( steamid ) then return false end
	Database:Query( "SELECT COUNT( * ) as isExempt FROM exempt WHERE (steam_id = '"..steamid.."') AND (type = 'prop') AND (expire_time > '"..os.time().."')", function( result )
		if result[1].data[1].isExempt == 1 then
			return true
		elseif result[1].data[1].isExempt == 0 then
			return false
		end
	end)
end

function RAS.IsExemptSent( steamid )
	if !RAS.ValidSteamID( steamid ) then return false end
	Database:Query( "SELECT COUNT( * ) as isExempt FROM exempt WHERE (steam_id = '"..steamid.."') AND (type = 'sent') AND (expire_time > '"..os.time().."')", function( result )
		if result[1].data[1].isExempt == 1 then
			return true
		elseif result[1].data[1].isExempt == 0 then
			return false
		end
	end)
end

function RAS.IsExemptEffect( steamid )
	if !RAS.ValidSteamID( steamid ) then return false end
	Database:Query( "SELECT COUNT( * ) as isExempt FROM exempt WHERE (steam_id = '"..steamid.."') AND (type = 'effect') AND (expire_time > '"..os.time().."')", function( result )
		if result[1].data[1].isExempt == 1 then
			return true
		elseif result[1].data[1].isExempt == 0 then
			return false
		end
	end)
end

function RAS.IsExemptRagdoll( steamid )
	if !RAS.ValidSteamID( steamid ) then return false end
	Database:Query( "SELECT COUNT( * ) as isExempt FROM exempt WHERE (steam_id = '"..steamid.."') AND (type = 'ragdoll') AND (expire_time > '"..os.time().."')", function( result )
		if result[1].data[1].isExempt == 1 then
			return true
		elseif result[1].data[1].isExempt == 0 then
			return false
		end
	end)
end

function RAS.IsExemptVehicle( steamid )
	if !RAS.ValidSteamID( steamid ) then return false end
	Database:Query( "SELECT COUNT( * ) as isExempt FROM exempt WHERE (steam_id = '"..steamid.."') AND (type = 'vehicle') AND (expire_time > '"..os.time().."')", function( result )
		if result[1].data[1].isExempt == 1 then
			return true
		elseif result[1].data[1].isExempt == 0 then
			return false
		end
	end)
end

function RAS.IsExemptNpc( steamid )
	if !RAS.ValidSteamID( steamid ) then return false end
	Database:Query( "SELECT COUNT( * ) as isExempt FROM exempt WHERE (steam_id = '"..steamid.."') AND (type = 'npc') AND (expire_time > '"..os.time().."')", function( result )
		if result[1].data[1].isExempt == 1 then
			return true
		elseif result[1].data[1].isExempt == 0 then
			return false
		end
	end)
end

function RAS.IsBannedChat( steamid )
  if !RAS.ValidSteamID( steamid ) then return false end
	Database:Query( "SELECT COUNT( * ) as isBanned FROM banned WHERE (steam_id = '"..steamid.."') AND (type = 'chat') AND (expire_time > '"..os.time().."')", function( result )
		PrintTable(result)
		if result[1].data[1].isBanned == 1 then
			return true
		elseif result[1].data[1].isBanned == 0 then
			return false
		end
	end)
end

function RAS.IsBannedProp( steamid )
	if !RAS.ValidSteamID( steamid ) then return false end
	Database:Query( "SELECT COUNT( * ) as isBanned FROM banned WHERE (steam_id = '"..steamid.."') AND (type = 'prop') AND (expire_time > '"..os.time().."')", function( result )
		if result[1].data[1].isBanned == 1 then
			return true
		elseif result[1].data[1].isBanned == 0 then
			return false
		end
	end)
end

function RAS.IsBannedSent( steamid )
	if !RAS.ValidSteamID( steamid ) then return false end
	Database:Query( "SELECT COUNT( * ) as isBanned FROM banned WHERE (steam_id = '"..steamid.."') AND (type = 'sent') AND (expire_time > '"..os.time().."')", function( result )
		if result[1].data[1].isBanned == 1 then
			return true
		elseif result[1].data[1].isBanned == 0 then
			return false
		end
	end)
end

function RAS.IsBannedEffect( steamid )
	if !RAS.ValidSteamID( steamid ) then return false end
	Database:Query( "SELECT COUNT( * ) as isBanned FROM banned WHERE (steam_id = '"..steamid.."') AND (type = 'effect') AND (expire_time > '"..os.time().."')", function( result )
		if result[1].data[1].isBanned == 1 then
			return true
		elseif result[1].data[1].isBanned == 0 then
			return false
		end
	end)
end

function IsBannedRagdoll( steamid )
	if !RAS.ValidSteamID( steamid ) then return false end
	Database:Query( "SELECT COUNT( * ) as isBanned FROM banned WHERE (steam_id = '"..steamid.."') AND (type = 'ragdoll') AND (expire_time > '"..os.time().."')", function( result )
		if result[1].data[1].isBanned == 1 then
			return true
		elseif result[1].data[1].isBanned == 0 then
			return false
		end
	end)
end

function RAS.IsBannedVehicle( steamid )
	if !RAS.ValidSteamID( steamid ) then return false end
	Database:Query( "SELECT COUNT( * ) as isBanned FROM banned WHERE (steam_id = '"..steamid.."') AND (type = 'vehicle') AND (expire_time > '"..os.time().."')", function( result )
		if result[1].data[1].isBanned == 1 then
			return true
		elseif result[1].data[1].isBanned == 0 then
			return false
		end
	end)
end

function RAS.IsBannedNpc( steamid )
	if !RAS.ValidSteamID( steamid ) then return false end
	Database:Query( "SELECT COUNT( * ) as isBanned FROM banned WHERE (steam_id = '"..steamid.."') AND (type = 'npc') AND (expire_time > '"..os.time().."')", function( result )
		if result[1].data[1].isBanned == 1 then
			return true
		elseif result[1].data[1].isBanned == 0 then
			return false
		end
	end)
end

--[[Logging system]]--
function RAS.Log( str )
    str = "[" .. os.date( "%I:%M" ) .. "] " .. str .. "\n"
    MsgAll( "[RAS]" .. str )
    file.Append("ras_data/logs.txt", str)
end

--[[Initialize the filesystem (create folders that don't exist basically)]]--
if !file.Exists( "ras_data", "DATA" ) then
	file.CreateDir( "ras_data", "DATA" )
end

if !file.Exists( "ras_data/logs.txt", "DATA" ) then
    file.Write( "ras_data/logs.txt", "DATA" )
end

--[[Net Strings]]--
util.AddNetworkString( "RAS.Notification" )
util.AddNetworkString( "RASSaveConfigOptions" )
util.AddNetworkString( "RASOpenConfigEditor" )
util.AddNetworkString( "RASResetConfigOptions" )

--[[Receive default settings reset from gui]]--
net.Receive( "RASResetConfigOptions", function( len, ply )
	if RAS.HasPerms( ply ) then
		RAS.Config.AntiSpamming = true
		RAS.Config.Chat.Enabled = true
		RAS.Config.Chat.Delay = 5
		RAS.Config.Prop.Enabled = true
		RAS.Config.Prop.Delay = 5
		RAS.Config.Sent.Enabled = true
		RAS.Config.Sent.Delay = 5
		RAS.Config.Effect.Enabled = true
		RAS.Config.Effect.Delay = 5
		RAS.Config.Ragdoll.Enabled = true
		RAS.Config.Ragdoll.Delay = 5
		RAS.Config.Vehicle.Enabled = true
		RAS.Config.Vehicle.Delay = 5
		RAS.Config.Npc.Enabled = true
		RAS.Config.Npc.Delay = 5
		RAS.UpdateConfig()
		RAS.ChatPrint( "Config options have been reset!", ply )
	end
end)

--[[Receive save settings net message from gui]]--
net.Receive("RASSaveConfigOptions", function(len, ply)
	if RAS.HasPerms( ply ) then
		local answer1 = net.ReadBool()
		local answer2 = net.ReadBool()
		local answer3 = math.Round( net.ReadFloat() )
		local answer4 = net.ReadBool()
		local answer5 = math.Round( net.ReadFloat() )
		local answer6 = net.ReadBool()
		local answer7 = math.Round( net.ReadFloat() )
		local answer8 = net.ReadBool()
		local answer9 = math.Round( net.ReadFloat() )
		local answer10 = net.ReadBool()
		local answer11 = math.Round( net.ReadFloat() )
		local answer12 = net.ReadBool()
		local answer13 = math.Round( net.ReadFloat() )
		local answer14 = net.ReadBool()
		local answer15 = math.Round( net.ReadFloat() )

		RAS.Config.AntiSpamming = answer1
		RAS.Config.Chat.Enabled = answer2
		RAS.Config.Chat.Delay = answer3
		RAS.Config.Prop.Enabled = answer4
		RAS.Config.Prop.Delay = answer5
		RAS.Config.Sent.Enabled = answer6
		RAS.Config.Sent.Delay = answer7
		RAS.Config.Effect.Enabled = answer8
		RAS.Config.Effect.Delay = answer9
		RAS.Config.Ragdoll.Enabled = answer10
		RAS.Config.Ragdoll.Delay = answer11
		RAS.Config.Vehicle.Enabled = answer12
		RAS.Config.Vehicle.Delay = answer13
		RAS.Config.Npc.Enabled = answer14
		RAS.Config.Npc.Delay = answer15
		RAS.UpdateConfig()
		RAS.ChatPrint( "Config options have been saved!", ply  )
	end
end)

RAS.Log( "Start of logs from " .. os.date( "%m/%d/%y" ) )
