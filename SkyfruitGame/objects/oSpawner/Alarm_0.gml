// Spawn alarm

if(!IsOnScreen(y,x) && global.enemiesLeft > 0 && instance_number(oCowboy) < 10)
{
	instance_create_layer(x+random_range(-64,64),y+16,"Enemies",oCowboy);
	alarm[0] = room_speed * random_range(4,6);
}
else
{
	alarm[0] = room_speed * random_range(1,3);
}