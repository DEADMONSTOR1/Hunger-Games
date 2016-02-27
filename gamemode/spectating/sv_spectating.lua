hook.Add( "PlayerSay", "Spectating", function( ply, text, team )
	if ( string.sub( text, 1, 9 ) == "/spectate" ) then 
		ply:Spectate(6)
		return ""
	end
end )

hook.Add( "PlayerSay", "UnSpectating", function( ply, text, team )
	if ( string.sub( text, 1, 12 ) == "/unspectate" ) then 
		ply:UnSpectate()
		ply:KillSilent()
		return ""
	end
end )

