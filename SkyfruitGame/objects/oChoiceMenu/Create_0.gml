if live_call() return live_result;

t = 0;
grace_frames = 30;
alpha = 0;

font = fntBitty;
sprite_index = sTextbox;

// Initialize variables
pos = 0;
up = 0;
down = 0;
interact = 0;
options = [];
for (var i = 0; i < array_length(choices); i++) {
	options[i] = choices[i].text;
}
n_options = array_length(options);


// Creating the textboxes (need textboxes for coloured words, etc)
textboxes = [];

textbox_w = 140;
textbox_h = 18;
textbox_y = function(_pos) {
	return  32 + (textbox_h + 8)*_pos;
}

for (var i = 0; i < n_options; i++) {
	textboxes[i] = CreateTextbox(
		Page(spk_none, options[i]),
		{
			textbox_y: textbox_y(i),
			textbox_w: textbox_w,
			textbox_h: textbox_h,
			center_text: true,
			instant_text: true,
			border_x: 0,
			border_y: 1,
			gift_req: choices[i].gift_req,
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
