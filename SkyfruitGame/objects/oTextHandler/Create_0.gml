text_struct = NONE; // The text struct loaded into the handler
page_array = NONE; // Array of pages loaded into the handler
active_textbox = noone;
active_choice_menu = noone;

interact = false;

page = 0;
page_rendered = false;
next_page_choice = false;
choice_menu_buffer_timer = 0;
time_in_state = 0;


// Text handler isn't active
StateAwaiting = function() {
	if (page_array == NONE) { return; }
	
	// Received a page (through LoadText)
	page = 0;
	state = StateHandleNextPage;
	state();
}


StateHandleNextPage = function() {

	// Wait for the correct room and transition to end
	if (room != rScene) { return; }
	with (oTransition) { if (mode != TRANS_MODE.OFF) return; }

	// Last page
	if (page >= array_length(page_array)) {
		
		// Clean up the final page
		page = 0;
		fade_in = true;
		page_array = NONE;
		
		state = StateAwaiting;
		return;
	}

	// Vary our next action depending on type of page
	var _next_page = page_array[page];
	switch (_next_page.type) {
			
		// CodePage
		case PAGE_TYPE.CODE:
			script_execute_ext(_next_page.code, _next_page.args);
			page++;
			state(); // In case the code adds another page
			break;

		// GoToPage
		case PAGE_TYPE.GOTO:
			page_array = struct_get(text_struct, _next_page.goto);
			page = 0;
			state = StateAwaiting;
			state(); // Run again to prevent a frame of lawlessness
			break;
			
		// Normal Page
		default:
			active_textbox = CreateTextbox(_next_page);
			fade_in = false;
			state = StateReadPage;
			break;
	}
}



StateReadPage = function() {

	if !page_rendered { return; }

	// Choices
	if (next_page_choice) {
		
		// Slight buffer for choice menu
		choice_menu_buffer_timer++;
		if (choice_menu_buffer_timer >= 25) {
			choice_menu_buffer_timer = 0;
			page++; // Advance to the choice page
			active_choice_menu = CreateChoiceMenu(page_array[page].choices);
			state = StateAwaitChoice;
		}
	}
	
	// No choices
	else {
		state = StateAwaitNextPage;
	}	
}

StateAwaitNextPage = function() {

	if (interact) {

		// Textbox is over
		instance_destroy(active_textbox);
		active_textbox = noone;
		page++;
		state = StateHandleNextPage;
		state();
	}
}


StateAwaitChoice = function() {
	
	// Choice found
	if (active_choice_menu.choice_made == NONE) { return; }
	var _next_key = active_choice_menu.choice_made.next_key;
	
	// Clean up
	instance_destroy(active_choice_menu);
	active_choice_menu = noone;
	instance_destroy(active_textbox);
	active_textbox = noone;
	page++;

	// No key brings us to the next page
	if (_next_key == NONE) {
		state = StateHandleNextPage;
		state();
	}
	// A next key brings us to a new page_array
	else {
		page_array = struct_get(text_struct, _next_key);
		state = StateAwaiting;
		state(); // Run again to prevent a frame of lawlessness
	}
}

state = StateAwaiting;

