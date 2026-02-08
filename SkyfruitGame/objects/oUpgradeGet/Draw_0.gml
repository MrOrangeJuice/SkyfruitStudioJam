// Icon
draw_sprite_ext(
	sprite_index,
	image_index,
	x,
	round(y),
	1,
	1,
	0,
	c_white,
	alpha
)

// Text
draw_text_border_ext(
	x + 12,
	round(y) + 5,
	upgrade_text,
	99,
	99,
	1,
	c_white,
	power(alpha, 2)
)