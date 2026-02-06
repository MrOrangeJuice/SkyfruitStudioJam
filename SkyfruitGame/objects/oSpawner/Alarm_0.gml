// Spawn alarm

if(!IsOnScreen(y,x) && (global.enemiesLeft - instance_number(oTankEnemy)) > 0 && instance_number(oTankEnemy) < 10)
{
	var rand = random_range(0,4);
	var xplace = x+random_range(-64,64);
	var yplace = y+16;
	while(place_meeting(xplace,yplace,oTankEnemy))
	{
		xplace = x+random_range(-64,64);
		yplace = y+16;
	}
	if(rand < 1 && room == rLevel3)
	{
		instance_create_layer(xplace,yplace-8,"Enemies",oWrenchEnemy);
	}
	if(rand < 2 && (room == rLevel2 || room == rLevel3))
	{
		instance_create_layer(xplace,yplace-8,"Enemies",oTankEnemy);
	}
	else
	{
		instance_create_layer(xplace,yplace,"Enemies",oCowboy);
	}
	alarm[0] = room_speed * random_range(4,6);
}
else
{
	alarm[0] = room_speed * random_range(1,3);
}