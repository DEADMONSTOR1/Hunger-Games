GM.Name = "Hunger Games"
GM.Author = "N/A"
GM.Email = "N/A"
GM.Website = "N/A"

function GM:Initialize()
        team.SetUp( 1, "Spectating", Color( 125, 125, 125, 255 ) )
end

function GM:PlayerInitialSpawn( ply ) 
 
    ply:SetTeam( 1 ) 
 
end 
 
