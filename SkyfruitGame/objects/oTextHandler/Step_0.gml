page_rendered = (active_textbox != noone) && (active_textbox.char_count >= active_textbox.text_length);
next_page_choice = (page + 1 < array_length(page_array)) && (page_array[page + 1].type == PAGE_TYPE.CHOICE);

var _state_prior = state;
state();

// Time in state
if (_state_prior != state) {
	time_in_state = 0;
}
time_in_state++;
