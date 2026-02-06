if live_call() return live_result;

x = random_range(0, SCREEN_W);
y = -100;

vel_y = 0;
acc_y = random_range(0.008, 0.015)/2;


sprites = [
	sContinue,
	sJump,
	sDash,
	sShoot,
	sArrow,
	sEnemyUI,
	sPlayerJumpRed,
	sWanted,
	sPlayerHurt,
	sBullet,
	sBottle,
	sTarget,
	sPalette,
	sPlayerRun,
	sPlayer,
	sCowboyBack,
	sCowboyWalk,
	sCowboy,
	sCowboyFire,
	sMissileRight,
	sMissileUp,
	sMissileLeftUp,
	sTankEnemyFire,
	sTankEnemy,
	sTitleCard,
	
	// Upgrades
	sHealthUp,
	sExtraDash,
	sFireSpeedUp,
	sMoveSpeedUp,
	sDamageUp,
	sBigBullets,
	
	// Portraits
	sPorJohnnyNeutral,
	sPorClyde,
	sPorIslaNeutral,
	sPorAlloy,
	sPorVillin,
	sPorMustard
];


image_xscale = (random(1) < 0.5 ? -1 : 1);
image_speed = 0;
sprite_index = sprites[irandom(array_length(sprites) - 1)];
image_index = random(image_number);