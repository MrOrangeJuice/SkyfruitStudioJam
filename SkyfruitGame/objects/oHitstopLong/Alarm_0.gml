/// @description Destroy

global.hitPause = false;
// Kill player if necessary
if(death)
{
	if(instance_exists(oPlayer))
	{
		audio_play_sound(snd_Death,5,false);
		for(var i = 0; i < 20; i++)
		{
			instance_create_layer(oPlayer.x,oPlayer.y,"VFX",oParticleExplode);
		}
		instance_destroy(oPlayer);
		SlideTransition(TRANS_MODE.GOTO,room);
		global.health = global.maxHealth;
	}
}
instance_destroy();