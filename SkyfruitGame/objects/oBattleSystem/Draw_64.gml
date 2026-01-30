healthToDraw = global.health;
xMod = 0;

for(i = 0; i < global.maxHealth; i++)
{
	// If there's health to draw, draw it
	if(healthToDraw > 0)
	{
		// If it's an even number, draw a full heart
		if(i % 2 == 1)
		{
			draw_sprite_stretched(sBottle,0,2 + (xMod * 9),2,8*healthTextScale,12*healthTextScale);	
			xMod++;
		}
		// Otherwise, draw a half heart
		else
		{
			draw_sprite_stretched(sBottle,1,2 + (xMod * 9),2,8*healthTextScale,12*healthTextScale);	
		}
	}
	else
	{
		// Draw an empty heart every other time
		if(i % 2 == 1)
		{
			draw_sprite_stretched(sBottle,2,2 + (xMod * 9),2,8*healthTextScale,12*healthTextScale);	
			xMod++;
		}
	}
	healthToDraw--;
}