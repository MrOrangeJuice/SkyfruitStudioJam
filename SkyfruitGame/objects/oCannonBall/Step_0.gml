/// @description Move

event_inherited();

if(!global.paused && !global.hitPause)
{
	x += (ballSpeed * dir);
	image_xscale = dir;
	image_speed = 1;
}
else
{
	image_speed = 0;	
}