AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "level/cl_expsys.lua" )

include( "shared.lua" )
include( "round/sv_round.lua" )
include( "level/expsys.lua" )
include( "spectating/sv_spectating.lua" )
include( "deathmatch/sv_deathmatch.lua" )

allweapons = {
	"weapon_rpg",
	"weapon_crowbar"
}
