text_struct = NONE; // The text struct loaded into the handler
page_array = NONE; // Array of pages loaded into the handler
active_textbox = noone;
active_choice_menu = noone;

page = 0;
page_rendered = false;
next_page_choice = false;
choice_menu_buffer_timer = 0;
time_in_state = 0;

state = StateAwaiting;