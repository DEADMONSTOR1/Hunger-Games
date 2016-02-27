include( "shared.lua" )
include( "level/cl_expsys.lua" ) 


net.Receive( "UpdateTheClient", function(len, ply)
	time = net.ReadInt(32)
	text = net.ReadString(32)
end ) 

net.Receive( "UpdateTheClient2", function(len, ply)
	level = net.ReadInt(32)
end ) 
function SecondHud()
	draw.SimpleText("Level: " ..level, "Trebuchet18", ScrW() / 7, ScrH() - 30, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
end
timer.Simple( 3, function() hook.Add("HUDPaint", "SecondHUD", SecondHud ) end)

function MainHUD()
--Round Timer
	draw.RoundedBox(4,ScrW() / 1000, ScrH() - 53, ScrW(), 50 , Color(0, 0, 0, 180))
	draw.SimpleText("Round State: " ..text, "Trebuchet18", ScrW() / 2 - 30, ScrH() - 28, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("Time Left: " ..string.ToMinutesSeconds(tostring(time)), "Trebuchet18", ScrW() / 2 + 30, ScrH() - 5 , Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
end
timer.Simple( 5, function() hook.Add("HUDPaint", "MainHUD", MainHUD) end)

