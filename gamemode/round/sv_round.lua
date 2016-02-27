util.AddNetworkString( "UpdateTheClient" )

local round = {}

roundBreak = 20
roundTime = 300
roundTimeLeft = 9999999
roundBreaking = false
roundtext = "Inactive"

function round.Broadcast(Text)
	for k,v in pairs(player.GetAll()) do
		v:ChatPrint(Text)
	end
end

function round.Begin()
	round.Broadcast("The Round is Starting.")
	roundTimeLeft = roundTime
	roundtext = "Active"
end

function round.End()
	round.Broadcast("The Round is ending.")
	roundTimeLeft = roundBreak
	roundtext = "Inactive"
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