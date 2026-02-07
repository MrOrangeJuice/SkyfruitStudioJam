// Track player

if(!global.paused && !global.hitPause)
{
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
}
else
{
	alarm[0]++;
	alarm[1]++;
	alarm[2]++;
	alarm[3]++;
	alarm[4]++;
	alarm[5]++;
	alarm[6]++;
}

// Animate
if(state == 1)
{
	if(firing)
	{
		sprite_index = villin9;
	}
	else if(fired)
	{
		sprite_index = villin10;
	}
	else
	{
		sprite_index = villin6;
	}
}
else if(state == 0)
{
	sprite_index = villin1;
}