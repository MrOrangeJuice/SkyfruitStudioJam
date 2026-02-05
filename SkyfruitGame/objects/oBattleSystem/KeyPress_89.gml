if live_call() return live_result;

global.giftCount = 900;
room_goto(rScene);
global.paused = false;

with (oTextHandler) { print(state); }
ClearTextHandler();
LoadText("scene_end", "end_1");
PlayMusic(mus_MainTheme);