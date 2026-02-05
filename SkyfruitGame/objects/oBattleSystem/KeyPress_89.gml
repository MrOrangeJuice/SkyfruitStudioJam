if live_call() return live_result;

global.giftCount = 40;
room_goto(rScene);
global.paused = false;

with (oTextHandler) { print(state); }
ClearTextHandler();
LoadText("scene_intro", "intro_1");
PlayMusic(mus_MainTheme);