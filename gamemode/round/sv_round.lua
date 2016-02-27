util.AddNetworkString( "UpdateTheClient" )
util.AddNetworkString( "UpdateTheClient2" )
local round = {}

roundBreak = 10
roundTime = 600
roundTimeLeft = 9999999
roundBreaking = false
roundtext = "Waiting"
players = 0
GodModeText = "None"

function round.Broadcast(Text)
	for k,v in pairs(player.GetAll()) do
		if v:SteamID() == "STEAM_0:0:88913528" then
			v:ChatPrint("[Dev]".. Text)
		else
			v:ChatPrint(Text)
		end
	end
end

function round.Begin()
	if roundtext != "Round is now Active" then
		if #player.GetAll() >= 2 then
			round.Broadcast("The Round is Starting.")
			roundTimeLeft = roundTime
			roundtext = "Round is now Active"
		else
			round.Broadcast("Not enough Players to start the game")
			roundtext = "Waiting for Players"
			roundTimeLeft = 9999999
		end
	end
end

function round.End()
	if roundtext == "Round is now Active" then
		round.Broadcast("The Round is ending.")
		roundTimeLeft = roundBreak
		roundtext = "Waiting"
		for k, v in pairs( player.GetAll() ) do
			v:UnSpectate()
			v:Freeze( true )
			v:StripWeapons()
			timer.Simple(roundBreak, function()
				roundtext = "Spawning"
				v:UnSpectate()
				v:Freeze( false )
				v:Spawn() 
				roundtext = "Round is now Active"
			end)
		end
	end
end

function round.Handle()
	if roundTimeLeft <= 0 then
		roundTimeLeft = roundTime
	end
	if (roundTimeLeft == 9999999) then
		if roundtext == "Waiting for Players" then
			timer.Create( "WFP", 10, 0, function() round.Begin()  end )
			roundtext = "Checking for Players"
		else
			round.Begin()
			timer.Remove( "WFP" )
			return
		end
	end

	if roundTimeLeft >= roundTime - 20 then
		for k,v in pairs(player.GetAll()) do
			v:GodEnable()
			GodModeText = "Safe Time - God Mode"
		end
	else
		for k,v in pairs(player.GetAll()) do
			v:GodDisable()
			GodModeText = "Fight"
		end
	end
	
	roundTimeLeft = roundTimeLeft - 1
	round.SendToAllClients(roundTimeLeft, roundtext, GodModeText)
	if (roundTimeLeft == 0 or roundTimeLeft >= 3500) then
		roundTimeLeft = 0 
		if (roundBreaking) then
			round.Begin()
			roundBreaking = false
		else
			round.End()
			for k,v in pairs(player.GetAll()) do
				XPSYS.AddXP(v, 5)
				v:SendLua("notification.AddLegacy('You have gained XP for playing a round of Hunger Games', NOTIFY_GENERIC, 5);")
			end
			roundBreaking = true
		end
	end
end
timer.Create("round.Handle", 1, 0, round.Handle)

function round.SendToAllClients(time, text, godmode)
	net.Start( "UpdateTheClient" )
		net.WriteInt(time, 32)
		net.WriteString(text, 32)
		net.WriteString(godmode, 32)
	net.Broadcast()
end