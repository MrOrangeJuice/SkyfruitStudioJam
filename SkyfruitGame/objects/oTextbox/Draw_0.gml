if live_call() return live_result;

draw_set_font(font);
if (center_text) {
	draw_set_halign(fa_center);
} else {
	draw_set_halign(fa_left);
}

// Draw the names
if (name != NONE and !instance_exists(oChoiceMenu)) {
	name_offset = 36;
	name_w = string_width(name) + 12;
	name_h = 23;
	name_x = (left ? x + name_offset : x + textbox_w - name_offset - name_w);
	name_y = y - 15;
	draw_sprite_stretched(
		sprite_index,
		image_index,
		name_x,
		name_y,
		name_w,
		24
	);
	draw_text_border_ext(
		name_x + 6,
		name_y,
		name,
		999,
		999,
		1,
		c_white
	)
}



// Textbox
draw_sprite_stretched(
	sprite_index,
	image_index,
	x,
	y,
	textbox_w,
	textbox_h
);

// Each letter rendered individually
for (var c = 0; c < min(char_count, text_length); c++) {
	
	// Character info
	var _char = string_char_at(text, c+1);
	
	// Wavy text
	var _wave_adj = 0;
	if char_wave[c] {
		_wave_adj = wave_height_factor * dsin(wave_sep*c - wave_speed*frame);
	}
	
	// Shakey text
	var _shake_adj_x = 0;
	var _shake_adj_y = 0;
	if (char_shake[c] && irandom(shake_ave_time - 1) == 0) {
		var _shake_dir = irandom(360);
		_shake_adj_x = lengthdir_x(random(shake_intensity_x), _shake_dir);
		_shake_adj_y = lengthdir_y(random(shake_intensity_y), _shake_dir);
	}

	// Draw text
	var _col = char_col[c];
	draw_text_border_ext(
		x + (char_x[c] + _shake_adj_x) + border_x,
		y + (char_y[c] + _wave_adj + _shake_adj_y) + border_y,
		_char,
		999,
		999,
		1,
		_col
	)
}

// Draw the gift req
if (gift_req != 0) {
	draw_sprite(
		sGift,
		0,
		x + textbox_w,
		y + textbox_h
	)
	draw_text_border(
		x + textbox_w + GIFT_TEXT_X_OFFSET,
		y + textbox_h + GIFT_TEXT_Y_OFFSET,
		$"x{gift_req}"
	)
}