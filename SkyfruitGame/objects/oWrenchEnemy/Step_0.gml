/// @description Update

event_inherited();

if(!global.paused && !global.hitPause)
{
	if(firing && image_index > 16 && !fired)
	{
		if(IsOnScreen(y,x)) audio_play_sound(snd_EnemyShoot,5,false);
		bullet =  instance_create_layer(x+(dir*8),y-4,"Enemies",oWrench);
		if(dir == 1) bullet.dir = dir;
		fired = true;
	}
}
else
{

}