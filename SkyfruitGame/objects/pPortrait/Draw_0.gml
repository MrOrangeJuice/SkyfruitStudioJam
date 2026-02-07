if live_call() return live_result;

draw_sprite_ext(
	sprite_index,
	image_index,
	x + shake_offset + wiggle_offset,
	y,
	image_xscale*(object_index == oPorIsla or object_index == oPorVillin ? -1 : 1),
	1,
	0,
	c_white,
	1
)