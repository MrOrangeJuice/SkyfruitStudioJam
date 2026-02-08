if live_call() return live_result;

// BG
draw_sprite_ext(
	sBackgroundOutside,
	0,
	0,
	0,
	1,
	1,
	0,
	c_white,
	0.5
)

if (state == StateMain) {

	// Title card
	draw_sprite(
		sLogo,
		0,
		SCREEN_W/2 - sprite_get_width(sLogo)/2 - 2,
		16
	)

	// Title menu options
	draw_set_font(fntDaniel);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	for (var i = 0; i < array_length(main_options); i++) {
		
		var _w = 54;
		var _y = 100 + 18*i
		
		// Box
		draw_sprite_stretched(
			sTextbox,
			0,
			SCREEN_W/2 - _w/2,
			_y,
			_w,
			18
		)
		
		// Text
		var _colour = PALETTE_YELLOW;
		if (i == 0 and !save_file_detected) { _colour = PALETTE_GREY; }
		draw_text_border_ext(
			SCREEN_W/2,
			_y,
			main_options[i],
			99,
			99,
			1,
			_colour,
			1
		)
	}
} else if (state == StateCredits) {

	
	draw_set_valign(fa_top);
	for (var i = 0; i < 3; i++) {
		var _offset = 56*i;
		draw_set_halign(fa_left);
		draw_text_border_ext(
			32, _offset + 12,
			credits_names[i],
			999, 999, 1, PALETTE_YELLOW
		)
		draw_text_border_ext(
			32, _offset + 32, credits_desc[i], 12, 280,
			1, #00a89d,
		)
		draw_sprite_stretched(
			sTextbox,
			0,
			180, _offset + 11, 120, 19
		)
		draw_set_halign(fa_center);
		draw_text_border(
			241, _offset + 12, credits_plug[i]
		)
	}
	
	// Back
	draw_sprite_stretched(
		sTextbox,
		0,
		252, 160, 40, 16
	)
	draw_set_halign(fa_left);
	draw_text_border(
		264, 159, "Back"
	)
	

}

// Selector draws regardless of state
draw_sprite(
	sChoicerGun,
	0,
	sel_x,
	sel_y
)