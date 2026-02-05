// Spawn alarm

if(!IsOnScreen(y,x) && (global.enemiesLeft - instance_number(oTankEnemy)) > 0 && instance_number(oTankEnemy) < 10)
{
	if(random_range(0,3) < 1 && room == rLevel2)
	{
		instance_create_layer(x+random_range(-64,64),y+8,"Enemies",oTankEnemy);
	}
	else
	{
		instance_create_layer(x+random_range(-64,64),y+16,"Enemies",oCowboy);
	}
	alarm[0] = room_speed * random_range(4,6);
}
else
{
	alarm[0] = room_speed * random_range(1,3);
}