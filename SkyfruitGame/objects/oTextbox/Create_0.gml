if live_call() return live_result;

depth = TEXTBOX_DEPTH;
interact = false;
pause_timer = 0;

/// @desc Default textbox params
text = "Woah";
text_colour = c_white;
frame = 0;

// Speaker
name = "Nobody";
voice = vTest;
font = fntDaniel;
sprite_index = sTextbox;

// Screen position params
line_w = textbox_w - 2*border_x;
line_h = 12;

textbox_x = (SCREEN_W - textbox_w)/2

x = textbox_x;
y = textbox_y;


// Text effect params
text_speed = 1;
text_pause_length = 8;
text_pause_voice_length = 4;

wave_sep = 20;
wave_speed = 6;
wave_height_factor = 2;

shake_intensity_x = 1;
shake_intensity_y = 1;
shake_ave_time = 2;


SetupTextbox();