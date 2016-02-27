GM.Name = "Hunger Games"
GM.Author = "N/A"
GM.Email = "N/A"
GM.Website = "N/A"

function GM:Initialize()
        team.SetUp( 1, "Spectating", Color( 125, 125, 125, 255 ) )
end

function GM:PlayerInitialSpawn( ply ) 
 
    ply:SetTeam( 1 ) 
	XPSYS.AddXP(ply, 1)
 
end 
 
local hide = {
	CHudHealth = true,
	CHudBattery = true,
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then return false end
end )