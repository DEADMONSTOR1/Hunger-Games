XPSYS = {}
XPSYS.XP = 0
XPSYS.level = 1
XPSYS.XPOfNextLevel = 1

--[[---------------------------------------------------------
   Name: XPSYS.Update()
   Desc: Updates all the data on the client.
-----------------------------------------------------------]]

function XPSYS.Update(len)
	XPSYS.XP = net.ReadInt(32)
	XPSYS.level = net.ReadInt(32)
	XPSYS.XPOfNextLevel = net.ReadInt(32)
end
net.Receive("UpdateClient",XPSYS.Update)


function XPSYS.XPBarDraw()
		draw.RoundedBox( 8,  ScrW()/4, ScrH()/40 + 7, ScrW()/2, 20, Color(100,0,100,200) )
		local ratio = XPSYS.XP / XPSYS.XPOfNextLevel

		if ratio <= 0.01 then
			ratio = 0.01
		end
		
		if ratio <= 0.98 then
			draw.RoundedBoxEx( 5,ScrW()/4, ScrH()/40 + 7 , (ScrW()/2) * ratio, 20, Color(0,255,255,200),true,false,true,false)
		else
			draw.RoundedBox( 5,ScrW()/4, ScrH()/40 + 7 , (ScrW()/2) * ratio, 20, Color(255,255,255,100))
		end
		draw.DrawText( "XP Bar " , "Trebuchet24",ScrW()/2 - 10 , ScrH()/40 - 18, Color( 0, 255, 255, 255 ), TEXT_ALIGN_CENTER )
end

hook.Add( "HUDPaint", "Experience Bar", XPSYS.XPBarDraw )