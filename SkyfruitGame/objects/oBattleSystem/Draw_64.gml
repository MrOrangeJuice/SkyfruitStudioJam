if live_call() return live_result;

healthTextScale = max(healthTextScale * .95, 1);
healthToDraw = global.health;
xMod = 0;

if (room != rTitle)
{
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
	
	// Draw gifts
	giftX = SCREEN_W - 20;
	giftY = 16;
	textOffsetX = 13;
	textOffsetY = 1;
	draw_sprite(
		sGift,
		0,
		giftX,
		giftY
	)
	draw_set_font(fntDaniel);
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);
	draw_text_border(
		giftX + textOffsetX,
		giftY + textOffsetY,
		$"x{global.giftCount}"
	)
	
	// Draw enemy UI
	enemyUIX = SCREEN_W-30;
	enemyUIY = 8;
	
	draw_set_color(#7F0622);
	draw_sprite(sEnemyUI,0,enemyUIX,enemyUIY);
	draw_text(enemyUIX+20,enemyUIY-9,"x" + string(instance_number(oCowboy)));
	
	// Draw results
	draw_sprite(sWanted,resultsFrame,128,resultsY);
	draw_set_halign(fa_right);
	if(displayReward) 
	{
		draw_text(183,resultsY+59,reward);
		draw_sprite(sGiftSmall,0,167,resultsY+65);
	}
	if(displayBonus) 
	{
		draw_text(183,resultsY+67,curBonus);
		draw_sprite(sGiftSmall,0,167,resultsY+73);
	}
	draw_set_halign(fa_center);
	draw_set_color(#16171A);
	
	// Draw Pause Menu
	if(global.paused)
	{
		pauseOptions = [
			"Resume",
			"Fullscreen",
			"Main Menu",
			"Music Vol",
			"SFX Vol",
		]
		
		
		// Draw options
		draw_sprite_stretched(sPauseMenu,pauseOption,112,32,96, 112);
		for (var i = 0; i < array_length(pauseOptions); i++) {
			
			// Text alignment
			draw_set_halign(fa_middle);

			// Augment for selector position
			var _colour = (i == pauseOption ? c_white : PALETTE_YELLOW);
			var _text = (i == pauseOption ? string_concat(">", pauseOptions[i], "<") : pauseOptions[i]);
			var _y = 42 + 16*i + 10*(i>2);
			
			draw_text_border_ext(
				SCREEN_W/2 - 17*(i==3) - 21*(i==4),
				_y,
				_text,
				999,
				999,
				1,
				_colour,
				1
			)
			
			// Sliders
			if (i == 3 or i == 4) {
				draw_sprite(
					sVolume,
					(i == 3 ? round(global.musVolume/0.2) : round(global.sndVolume/0.2)),
					176,
					_y + 5
				)
			}
		}
		
	}
}