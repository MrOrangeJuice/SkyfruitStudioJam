if live_call() return live_result;

draw_set_font(fntBitty);
draw_set_halign(fa_center);
draw_text_border(
	gift_ui_x + GIFT_TEXT_X_OFFSET,
	gift_ui_y + GIFT_TEXT_Y_OFFSET,
	$"x{global.giftCount}"
)

// Selector
draw_sprite(
	sChoicerGun,
	0,
	sel_x,
	sel_y
)