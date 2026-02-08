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
	sGiftSmall,
	sTextbox,
	sGarbageClosed,
	
	// Upgrades
	sBottle,
	sBottle,
	sGift,
	sGift,
	sHealthUp,
	sExtraDash,
	sFireSpeedUp,
	sMoveSpeedUp,
	sDamageUp,
	sBigBullets,
	sInvulernableDash,
	sHealthUp,
	sExtraDash,
	sFireSpeedUp,
	sMoveSpeedUp,
	sDamageUp,
	sBigBullets,
	sInvulernableDash,
	
	// Portraits
	sPorJohnnyNeutral,
	sPorJohnnyShocked,
	sPorJohnnySad,
	sPorJohnnySus,
	sPorJohnnyHumility,
	sPorClyde,
	sPorClydeNotepad,
	sPorClydeUp,
	sPorClydeNOOO,
	sPorIslaNeutral,
	sPorIslaEyeroll,
	sPorIslaMad,
	sPorIslaConsidering,
	sPorIslaUncertain,
	sPorAlloy,
	sPorAlloyHappy,
	sPorAlloySurprised,
	sPorAlloyPissed,
	sPorAlloyCheeky,
	sPorVillin,
	sPorVillinGlare,
	sPorVillinSmirk,
	sPorVillinHeadless,
	sPorVillinHeadlessSmile,
	sPorVillinHeadlessRage,
	sPorMustard
];


image_xscale = (random(1) < 0.5 ? -1 : 1);
image_speed = 0;
sprite_index = sprites[irandom(array_length(sprites) - 1)];
image_index = random(image_number);

// Secret
if (random(1) < 1/500) {
	sprite_index = sSecret;
	image_xscale = 1;
}