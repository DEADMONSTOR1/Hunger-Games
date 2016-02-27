include( "shared.lua" )

net.Receive( "UpdateTheClient", function(len, ply)
	time = net.ReadInt(32)
	text = net.ReadString(32)
end ) 


function MainHUD()
--Round Timer
	draw.RoundedBox(4,ScrW() / 1000, ScrH() - 53, ScrW(), 50 , Color(0, 0, 0, 180))
	draw.SimpleText("Round State: " ..text, "Trebuchet18", ScrW() / 2 - 30, ScrH() - 28, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("Time Left: " ..string.ToMinutesSeconds(tostring(time)), "Trebuchet18", ScrW() / 2 + 30, ScrH() - 5 , Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
end
hook.Add("HUDPaint", "MainHUD", MainHUD)
