// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// y, x
function IsOnScreen(argument0, argument1)
{
	if(instance_exists(oCamera))
	{
		if(argument0 > oCamera.y - 120 && argument0 < oCamera.y + 120 && argument1 > oCamera.x - 200 && argument0 < oCamera.x + 200)
		{
			return true;	
		}
		else
		{
			return false;	
		}
	}
}