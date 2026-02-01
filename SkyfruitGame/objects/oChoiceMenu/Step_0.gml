if live_call() return live_result;

t++;

up = keyboard_check_pressed(ord("W"));
down = keyboard_check_pressed(ord("S"));
interact =  keyboard_check_pressed(vk_space);;

n_options = array_length(options);

// Movement
pos += down - up;
pos = (pos + n_options) % n_options; // Loop around

// SFX
if (down - up != 0) { audio_play_sound(snd_GunClick, 0, false); }

// Slide textboxes in
for (var i = 0; i < n_options; i++) {
	with (textboxes[i]) { x = Approach(x, (SCREEN_W - textbox_w)/2, 0.12, 0.1); }
}

// Update selector and targets
tar_y = textbox_y(pos) + sel_y_offset;
sel_x = textboxes[pos].x + sel_x_offset;
sel_y = Approach(sel_y, tar_y, 0.4, 1);


// Selecting
if (interact and t > grace_frames) {
	var _gift_cost = options[pos].gift_req;

	// Not enough gift
	if (global.giftCount < _gift_cost) {
		audio_play_sound(snd_GunEmpty, 0, false);
	}
	
	// Successful select
	else {
		global.giftCount -= _gift_cost;
		audio_play_sound(snd_GunFire, 0, false);
		if (_gift_cost > 0) {
			audio_play_sound(snd_SpendGift, 0, false);
		}
		
		// Set state flag for any choice with an associated flag (to prevent duplicates)
		if (options[pos].flag != NONE) { SetStateFlag(options[pos].flag); }
		choice_made = options[pos];
	}
}
