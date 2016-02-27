GM.Name = "Hunger Games"
GM.Author = "N/A"
GM.Email = "N/A"
GM.Website = "N/A"

function GM:Initialize()
	return
end

function GM:PlayerInitialSpawn( ply ) 
 
	XPSYS.AddXP(ply, 1)
 
end 

function GM:PlayerSpawn( ply )

	ply:SetModel("models/player/Group01/Male_01.mdl")
end
 
local hide = {
	CHudHealth = true,
	CHudBattery = true,
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then return false end
end )


	
	
local function spawn( ply )
	if roundtext == "Round is now Active" or roundtext == "Waiting" then
		ply:Spectate(6)
	end
end
hook.Add( "PlayerSpawn", "some_unique_name", spawn )