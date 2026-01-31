/// @description Size variables and mode setup

w = SCREEN_W;
h = SCREEN_H;
h_half = h * 0.5;
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}
mode = TRANS_MODE.INTRO; 
percent = 1;
target = room;