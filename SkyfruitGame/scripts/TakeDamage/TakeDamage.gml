// damage, horizontal knockback, vertical knockback, hitStun
function TakeDamage(argument0,argument1,argument2,argument3)
{
	if(instance_exists(oPlayer))
	{
		with (oPlayer)
		{
			audio_play_sound(snd_PlayerHit,5,false);
			global.timesHit++;
			if (room != rTitle) 
			{
				global.health -= argument0;
			}
			// Kill player
			if(global.health <= 0)
			{
				vsp = -argument1;
				// Set hsp to the opposite of your current direction
				currentwalksp = -sign(image_xscale) * argument2;
				hit = true;
				ScreenShake(2,10);
				hitStop = instance_create_layer(0,0,"Instances",oHitstopLong);
				hitStop.death = true;
			}
			// Don't kill player
			else
			{
				vsp = -argument1;
				// Set hsp to the opposite of your current direction
				if (argument3) currentwalksp = -sign(image_xscale) * argument2;
				invulnerable = 100;
				if(argument3) hit = true;
				if(argument3) canJump = true;
				ScreenShake(2,10);
				if(argument3) hitStop = instance_create_layer(0,0,"Instances",oHitstop);
			}
		}
		with (oBattleSystem) healthTextScale = 1.15;
	}
}