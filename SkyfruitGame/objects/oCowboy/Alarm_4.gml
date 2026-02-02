/// @description Fire

if(firing)
{
	if(IsOnScreen(y,x)) audio_play_sound(snd_EnemyShoot,5,false);
	bullet = instance_create_layer(x+(dir*27),y-1,"Enemies",oBulletEnemy);
	if(dir == 1) bullet.dir = dir;
}