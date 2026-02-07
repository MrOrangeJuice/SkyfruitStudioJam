/// @description Hit

ScreenShake(2,10);
other.hp--;
other.flash = 5;
audio_play_sound(snd_Hit,5,false);
if(xdir = 1)
{
	instance_create_layer(x,y,"VFX",oHitStabVFX);
	for(var i = 0; i < 5; i++)
	{
		instance_create_layer(x,y,"VFX",oParticleStabVFXRight);
	}
}
else if(xdir = -1)
{
	instance_create_layer(x,y,"VFX",oHitStabVFXLeft);
	for(var i = 0; i < 5; i++)
	{
		instance_create_layer(x,y,"VFX",oParticleStabVFXLeft);
	}
}
if(other.hp <= 0)
{
	audio_play_sound(snd_Die,5,false);
	for(var i = 0; i < 20; i++)
	{
		instance_create_layer(other.x+36,other.y+48,"VFX",oParticleExplode);
	}
	instance_destroy(other);
	
	global.enemiesLeft--;
	
	instance_create_layer(0,0,"Instances",oHitstopEnd);
	audio_play_sound(snd_Upgrade,5,false);
}

instance_destroy();
