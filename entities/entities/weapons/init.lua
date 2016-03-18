
AddCSLuaFile( "cl_init.lua" ) -- Make sure clientside
AddCSLuaFile( "shared.lua" )  -- and shared scripts are sent.
 
include('shared.lua')
 
function ENT:Initialize()
 
	self:SetModel( "models/Items/ammocrate_smg1.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )      -- Make us work with physics,
	self:SetMoveType( MOVETYPE_NONE )   -- after all, gmod is a physics
	self:SetSolid( SOLID_VPHYSICS )         -- Toolbox
 
        local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end
 
function ENT:Use( activator, caller )
	activator:Give(tostring(table.Random(allweapons)))
	self:Remove()
end
 
function ENT:Think()
	-- asdasd
end
 
hook.Add("WeaponEquip", "WeaponEquip", function(weapon)
 
	-- put everything inside this timer so it's called on the next frame.
	timer.Simple(0, function() 
 
		local ply = weapon:GetOwner() -- no longer a null entity.
 
		ply:PrintMessage(3, "Picked Up: "..weapon:GetClass()) -- inform the player.
 
	end) 	
end)
