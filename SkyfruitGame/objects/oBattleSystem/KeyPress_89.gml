if live_call() return live_result;

global.giftCount = 40;
room_goto(rScene);
global.paused = false;

with (oTextHandler) { print(state); }
ClearTextHandler();
//LoadText("scene_isla", "isla_1");

LoadText("scene_alloy", "alloy_1");
PlayMusic(mus_Dating);