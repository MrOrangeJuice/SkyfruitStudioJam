/// @desc HP bar!
if live_call() return live_result;
bar_len = 200;

var _frac = max(hp/starthp, 0);
draw_sprite_stretched(
	sBossHP,
	1,
	(SCREEN_W - bar_len)/2,
	32,
	bar_len,
	sprite_get_height(sBossHP)
)
draw_sprite_stretched(
	sBossHP,
	0,
	(SCREEN_W - bar_len)/2,
	32,
	bar_len*_frac,
	sprite_get_height(sBossHP)
)