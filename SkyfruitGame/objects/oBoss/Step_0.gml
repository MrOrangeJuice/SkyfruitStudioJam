// Track player

if(instance_exists(oPlayer))
{
	if(oPlayer.x < x+32)
	{
		hsp -= accel;
		if(hsp < -walksp)
			hsp = -walksp;
	}
	if(oPlayer.x > x+40)
	{
		hsp += accel;
		if(hsp > walksp)
			hsp = walksp;
	}
	
	x += hsp;
}