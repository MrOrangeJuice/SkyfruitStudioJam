// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// y, x
function IsOnScreen(argument0, argument1)
{
	if(instance_exists(oPlayer))
	{
		if(argument1 > oCamera.x - 240 && argument1 < oCamera.x + 240)
		{
			return true;	
		}
		else
		{
			return false;	
		}
	}
}