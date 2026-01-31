function print(_str) {
	show_debug_message(_str);
}

/// @desc Function that makes things move smoothly per-frame. Trust me.
function Approach(a, b, _prop, _linear) {
	var _change =  min(abs(_prop*(b - a)) + _linear, abs(b - a));
	return a + _change*sign(b - a);
}

function LoadText(_text_struct_name, _key) {

	// Retrieve the conversation
	var _text_struct = variable_global_get(_text_struct_name);
	// Retrieve the specific part of the conversation
	var _page_array = struct_get(_text_struct, _key);
	
	with (global.text_handler) {
		text_struct = _text_struct;
		page_array = _page_array;
	}
}

function SetupTextbox() {
	
	
    // Text effect arrays
    char_x = [];
    char_y = [];
    char_col = [];
    char_wave = [];
    char_shake = [];
    
    draw_set_font(font);
    char_count = 0;
    text_pause_timer = 0;
	text_pause_voice_timer = 0;
	
	string_widths = []; // Track string width of each line
	n_lines = 0;
    
    // Auto add line breaks, colours, effects
    last_space_pos = -1;
    line_start_pos = 1;
    active_colour = text_colour;
    active_wave = false;
    active_shake = false;
	
	// Reading text
    for (var c = 0; c < string_length(text); c++) {
    	var c_pos = c+1;
    	var char = string_char_at(text, c_pos);
    
    	// Check for effect triggers
    	if c <= string_length(text) - EFFECT_CODE_LEN {
    		var trigger = string_copy(text, c_pos, EFFECT_CODE_LEN);
    		var effect = true;
    		switch trigger {
    			case "|W|":
    				active_colour = c_white;
    				break;
    			case "|R|":
    				active_colour = c_red;
    				break;
    			case "|B|":
    				active_colour = c_blue;
    				break;
    			case "|G|":
    				active_colour = c_green;
    				break;
    			case "|Y|":
    				active_colour = c_yellow;
    				break;
    			case "|V|":
    				active_wave = true;
    				break;
    			case "/V/":
    				active_wave = false;
    				break;
    			case "|S|":
    				active_shake = true;
    				break;
    			case "/S/":
    				active_shake = false;
    				break;
    			default:
    				effect = false;
    				break;
    		}
    		if effect {
    			text = string_delete(text, c_pos, EFFECT_CODE_LEN);
    			c--;
    			continue;
    		}
    	}
    
    	// Create effects
    	char_col[c] = active_colour;
    	char_wave[c] = active_wave;
    	char_shake[c] = active_shake;
    
    	var substr_to_pos = string_copy(text, line_start_pos, c_pos - line_start_pos + 1);
    	if (string_width(substr_to_pos) > line_w) {
    		if (last_space_pos == -1) {
    			// If the line can't actually fit, just force it to a new line
    			line_start_pos = c_pos;
    		} else {
    			// Otherwise replace the last space with a newline
    			text = string_delete(text, last_space_pos, 1);
    			text = string_insert("\n", text, last_space_pos);
    			line_start_pos = last_space_pos;
    			last_space_pos = -1;
    		}
    	}
    	if (char == " ") {
    		last_space_pos = c_pos;
    	}
    }

	// Record the final line widths of each line
	// Note: must be done after the above loop since Effect Codes need to already be removed
    line_start_pos = 0;
	for (var c = 0; c < string_length(text); c++) {
    	var c_pos = c + 1;
    	if (string_char_at(text, c_pos) == "\n") {
			string_widths[n_lines] = string_width(string_copy(text, line_start_pos, c_pos - line_start_pos));
			n_lines++;
    		line_start_pos = c_pos;
    	}
	}
	// Record the width of the last line
	string_widths[n_lines] = string_width(string_copy(text, line_start_pos, c_pos - line_start_pos));

    // Get coords of each character
    running_x_pos = 0;
    running_y_pos = 0;
    line_start_pos = 1;
	line = 0;
    for (var c = 0; c < string_length(text); c++) {
    	var c_pos = c + 1;
    	var substr_to_c = string_copy(text, line_start_pos, c_pos - line_start_pos);
    	running_x_pos = string_width(substr_to_c);
    	char_x[c] = running_x_pos + (center_text)*(line_w - string_widths[line])/2;
    	char_y[c] = running_y_pos;
    	if string_char_at(text, c_pos) == "\n" {
    		line_start_pos = c_pos;
    		running_y_pos += line_h;
			line++;
    	}
    }
	
    
    text_length = string_length(text);
}

function draw_text_border_ext(_x, _y, _str, _sep, _width, _scale = 1, _colour = c_white) {
	for (var i = -1; i <= 1; i++) {
		for (var j = -1; j <= 1; j++) {
			draw_text_ext_transformed_color(_x + i, _y + j, _str, _sep, _width, _scale, _scale, 0, c_black, c_black, c_black, c_black, 1);
		}
	}
	draw_text_ext_transformed_color(_x, _y, _str, _sep, _width, _scale, _scale, 0, _colour, _colour, _colour, _colour, 1);
}
function draw_text_border(_x, _y, _str) {
	draw_text_border_ext(_x, _y, _str, 99, 99);
}


function CreateTextbox(_page, _params = {}) {
	var _textbox = instance_create_layer(0, 0, LAYER_INSTANCES, oTextbox, _params);
	
	with (_textbox) {
		text = _page.text;
		
		var _speaker = variable_global_get(_page.speaker);
		name = _speaker.name;
		voice = _speaker.voice;
		portrait = _speaker.portrait;
		left = (portrait != NONE and instance_exists(portrait) and portrait.left);
		
		
		SetupTextbox();
		// Jump the portrait
		if (portrait != NONE) { PortraitJump(portrait); }
	}
	return _textbox;
}

function CreateChoiceMenu(_choices) {
	
	// Prepare choices: it's mostly an array copy, but removing the -ifs that don't qualify
	var _choice_menu = instance_create_layer(
		0, 0, LAYER_INSTANCES, oChoiceMenu, { choices: _choices }
	);
	return _choice_menu;
}
