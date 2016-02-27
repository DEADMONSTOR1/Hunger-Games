util.AddNetworkString( "UpdateTheClient" )
util.AddNetworkString( "UpdateTheClient2" )
local round = {}

roundBreak = 20
roundTime = 300
roundTimeLeft = 9999999
roundBreaking = false
roundtext = "Waiting"

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
	round.Broadcast("The Round is Starting.")
	roundTimeLeft = roundTime
	roundtext = "Playing"
end

function round.End()
	round.Broadcast("The Round is ending.")
	roundTimeLeft = roundBreak
	roundtext = "Waiting"
	for k, v in pairs( player.GetAll() ) do
		v:Freeze( true )
		timer.Simple(roundBreak, function()
			v:Freeze( false )
			v:Spawn() 
		end)
	end
end

function round.Handle()
	if (roundTimeLeft == 9999999) then
		round.Begin()
		return
	end

	roundTimeLeft = roundTimeLeft - 1
	round.SendToAllClients(roundTimeLeft, roundtext)
	if (roundTimeLeft == 0) then
		if (roundBreaking) then
			round.Begin()
			roundBreaking = false
		else
			round.End()
			for k,v in pairs(player.GetAll()) do
				XPSYS.AddXP(v, 10)
				v:SendLua("notification.AddLegacy('You have gained XP for playing a round of Hunger Games', NOTIFY_GENERIC, 5);")
			end
			roundBreaking = true
		end
	end
end
timer.Create("round.Handle", 1, 0, round.Handle)

function round.SendToAllClients(time, text)
	net.Start( "UpdateTheClient" )
		net.WriteInt(time,32)
		net.WriteString(text,32)
	net.Broadcast()
end