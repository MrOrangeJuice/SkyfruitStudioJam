/// @description Fire

firing = false;
fired = true;
ScreenShake(2,10);
instance_create_layer(x+40,y+27,"Enemies",oMissile);
alarm[5] = room_speed * 0.1;
alarm[4] = room_speed * 0.34;
if(alarm[1] > room_speed * 2)
	alarm[2] = room_speed * 1;