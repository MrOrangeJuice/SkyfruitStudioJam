draw_set_alpha(alpha);
draw_rectangle_colour(-4, -4, SCREEN_W + 4, SCREEN_H + 4, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

// Selector
draw_sprite(
	sChoicerGun,
	0,
	sel_x - 2,
	sel_y
)
