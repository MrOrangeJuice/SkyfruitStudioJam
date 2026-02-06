if live_call() return live_result;
depth = CHOICE_MENU_DEPTH;
t = 0;
grace_frames = 30;
alpha = 0;
pause_timer = 0;

sprite_index = sTextbox;

// Initialize variables
pos = 0;
key_up = 0;
key_down = 0;
key_select = 0;
options = [];
for (var i = 0; i < array_length(choices); i++) {
	
	// If choices have an associated flag, treat them special
	if (choices[i].flag == NONE or !GetStateFlag(choices[i].flag)) {
		array_push(options, choices[i]);
	}
}
n_options = array_length(options);

// Hide original textboxes for many options
if (n_options > 4) {
	with (oTextbox) { visible = false; }
}

// Creating the textboxes (need textboxes for coloured words, etc)
textboxes = [];

textbox_w = 150;
textbox_h = 18;
textbox_y = function(_pos) {
	return  20 + (textbox_h + 8)*_pos;
}

for (var i = 0; i < n_options; i++) {
	textboxes[i] = CreateTextbox(
		Page(spk_none, options[i].text),
		{
			textbox_y: textbox_y(i),
			textbox_w: textbox_w,
			textbox_h: textbox_h,
			center_text: true,
			instant_text: true,
			border_x: 12,
			border_y: 0,
			gift_req: options[i].gift_req,
			icon: options[i].icon,
		}
	);
	textboxes[i].x = -100;
}


// Init selector variables
sel_x_offset = -16;
sel_y_offset = 12;
sel_x = textboxes[0].x + sel_x_offset;
sel_y = textboxes[0].y + sel_y_offset;

choice_made = NONE;
