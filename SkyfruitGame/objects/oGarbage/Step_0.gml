if live_call() return live_result;
if (oPlayer.bbox_top < bbox_top - 1 and !open) {
	shake_frames = max_shake_frames;
	open = true;
	instance_create_depth(x, y, 650, oGarbageBottom);
	audio_play_sound(snd_Garbage, 0, false);
	sprite_index = sGarbageOpen;
}

if (shake_frames > 0) {
	shake_frames--;
	shake_x = irandom_range(-shake_intensity, shake_intensity);
	shake_y = irandom_range(-shake_intensity, shake_intensity)/2;
	with (oGarbageBottom) { shake_x = other.shake_x; }
	with (oGarbageBottom) { shake_y = other.shake_y; }
} else {
	shake_x = 0;
	shake_y = 0;
	with (oGarbageBottom) { shake_x = 0; }
	with (oGarbageBottom) { shake_y = 0; }
}
