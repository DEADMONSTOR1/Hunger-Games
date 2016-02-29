DeathMatchPos = {
  "Vector(0,0,0)",  
  "Vector(0,0,0)",
  "Vector(0,0,0)"
}

DeathMatchTimer = 5
function ResetAllTimers()
	DeathMatchTimer = 5
end

function DeathMatchCheck()
	if roundTimeLeft == roundTime / 4 then
		if roundtext == "Round is now Active" then
			timer.Create( "DeathMatchTimer", 1, 4, function() DeathMatchTimer = DeathMatchTimer - 1 end )
			round.BroadCast("DeathMatch Starts In" ..DeathMatchTimer)
			for k,v in pairs(player.GetAll()) do
				if ( v:Alive() ) then 
					for i,p in pairs(DeathMatchPos)
						v:SetPos(DeathMatchPos[i])
						v:Freeze( true ) 
						roundtext = "Round Active - DeathMatch"
							timer.Simple(5, function()
							v:Freeze( false )
							end)
					end
				end      
			end
		end
	end
end
hook.Add( "Think", "DeathMatchTimeHook", DeathMatchCheck )
