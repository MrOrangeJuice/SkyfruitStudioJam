if live_call() return live_result;


// Handle pausing
if (global.paused) {
	pause_timer = 5;
	exit;
}
if (pause_timer > 0) {
	pause_timer--;
	exit;
}


key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
key_select = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_space);
if ((gamepad_axis_value(0,gp_axislv) < -0.4 && analogUpPrev == false) || gamepad_button_check_pressed(0,gp_padu) || (gamepad_axis_value(4,gp_axislv) < -0.4 && analogUpPrevD == false) || gamepad_button_check_pressed(4,gp_padu))
{
	key_up = 1;
	global.controller = 1;
	analogUpPrev = true;
}

if ((gamepad_axis_value(0,gp_axislv) > 0.4 && analogDownPrev == false) || gamepad_button_check_pressed(0,gp_padd) || (gamepad_axis_value(4,gp_axislv) > 0.4 && analogDownPrevD == false) || gamepad_button_check_pressed(4,gp_padd))
{
	key_down = 1;
	global.controller = 1;
	analogDownPrev = true;
}

if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
{
	key_select = 1;
	global.controller = 1;
}





t++;

n_options = array_length(options);

// Movement
pos += key_down - key_up;
pos = (pos + n_options) % n_options; // Loop around

// SFX
if (key_down - key_up != 0) { audio_play_sound(snd_GunClick, 0, false); }

// Slide textboxes in
for (var i = 0; i < n_options; i++) {
	with (textboxes[i]) { x = Approach(x, (SCREEN_W - textbox_w)/2, 0.12, 0.1); }
}

// Update selector and targets
tar_y = textbox_y(pos) + sel_y_offset;
sel_x = textboxes[pos].x + sel_x_offset;
sel_y = Approach(sel_y, tar_y, 0.4, 1);

if (global.paused) { exit; }


// Selecting
if (key_select and t > grace_frames) {
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
