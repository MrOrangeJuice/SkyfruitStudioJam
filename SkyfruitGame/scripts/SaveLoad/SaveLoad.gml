#macro SAVE_FILE_NAME "johnny_slick.save"

function SaveGame() {
	var _string = json_stringify({
		storyBeat: global.storyBeat,
		upgradesList: global.upgradesList,
	}, true);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, SAVE_FILE_NAME);
	buffer_delete(_buffer);
}

function LoadGame() {
	if (!file_exists(SAVE_FILE_NAME)) {
		return -1;
	}
	
	var _buffer = buffer_load(SAVE_FILE_NAME);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	// Determine if file is json
	var _json;
	try {
		_json = json_parse(_string);
	} catch(_exception) {
		return -1;
	}

	global.storyBeat = struct_get(_json, "storyBeat");
	global.upgradesList = struct_get(_json, "upgradesList");
	return 0;
}