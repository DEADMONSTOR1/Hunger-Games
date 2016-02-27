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
 
local hide = {
	CHudHealth = true,
	CHudBattery = true,
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then return false end
end )