/// @description Init

event_inherited();

hp = 10;
hsp = 0.5;
grv = 0.15;
vsp = 0;
state = "patrol";
moving = true;
randInt = 0;
canTurn = true;
canStartMovingAgain = true;
canStopMoving = true;
firing = false;
forward = true;
fired = false;

// Sprites
idle = sWrenchEnemy;
run = sWrenchEnemyRun;
back = sWrenchEnemyBack;
fire = sWrenchEnemyThrow;

image_xscale = dir;