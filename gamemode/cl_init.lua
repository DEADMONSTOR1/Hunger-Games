include( "shared.lua" )
include( "level/cl_expsys.lua" ) 
text = "Waiting"
time = 0 

net.Receive( "UpdateTheClient", function(len, ply)
	time = net.ReadInt(32)
	text = net.ReadString(32)
	godtext = net.ReadString(32)
end ) 

net.Receive( "UpdateTheClient2", function(len, ply)
	level = net.ReadInt(32)
end ) 

function MainHUD()
--Round Timer
	draw.RoundedBox(20,ScrW() / 1000 + 270, ScrH() / 1000, ScrW() / 2 + 130, 60 , Color(0, 0, 0, 230))
	draw.RoundedBox(4,ScrW() / 1000, ScrH() - 23, ScrW(), 50 , Color(0, 0, 0, 180))
	draw.SimpleText("Round State: " ..text, "Trebuchet18", ScrW() / 2 + 140, ScrH(), Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("Time Left: " ..string.ToMinutesSeconds(tostring(time)), "Trebuchet18", ScrW() / 2 + 390, ScrH() , Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("Fight State: " ..godtext, "Trebuchet18", ScrW() / 2 + 450 , ScrH() , Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
	draw.SimpleText("Level: " ..level, "Trebuchet18", ScrW() / 2 + 75, ScrH() , Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
end
hook.Add("HUDPaint", "MainHUD", MainHUD)

function MGSHud()

    local health = LocalPlayer():Health()
    
    surface.SetDrawColor( 120, 120, 255, 50 )
    surface.DrawRect(ScrW() - 1350 , ScrH() - 21, 350, 20 )
    
    surface.SetDrawColor( 100, 255, 100, 180 )
    surface.DrawRect( ScrW() - 1350 , ScrH() - 21, health * 3.5, 20 )
	draw.DrawText( "Health: ".. health, "Trebuchet18", ScrW() - 1180 , ScrH() - 19, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
	
	local armor = LocalPlayer():Armor()
    
    surface.SetDrawColor( 120, 120, 255, 50 )
    surface.DrawRect(ScrW() - 970 , ScrH() - 21, 350, 20 )
    
    surface.SetDrawColor( 100, 100, 255, 180 )
    surface.DrawRect( ScrW() - 970 , ScrH() - 21, armor * 3.5, 20 )
	draw.DrawText( "Armor: ".. armor, "Trebuchet18", ScrW() - 800 , ScrH() - 19, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
    
end 
hook.Add( "HUDPaint", "MGSLife", MGSHud )