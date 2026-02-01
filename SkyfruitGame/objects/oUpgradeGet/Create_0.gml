if live_call() return live_result;

switch (upgrade) {
	
	case UPGRADES.HEALTH_UP:
		sprite_index = sHealthUp;
		upgrade_text = "Health up!";
		break;
		
	case UPGRADES.FIRE_SPEED_UP:
		sprite_index = sFireSpeedUp;
		upgrade_text = "Fire speed up!";
		break;
		
	case UPGRADES.MOVE_SPEED_UP:
		sprite_index = sMoveSpeedUp;
		upgrade_text = "Move speed up!";
		break;
		
	case UPGRADES.DAMAGE_UP:
		sprite_index = sDamageUp;
		upgrade_text = "Damage up!";
		break;
		
	case UPGRADES.BIG_BULLETS:
		sprite_index = sBigBullets;
		upgrade_text = "BULLET SIZE UP!!";
		break;
}

alpha = 1;
depth = UPGRADE_GET_DEPTH;
start_y = 100;
x = 180;
y = start_y;
audio_play_sound(snd_Upgrade, 0, false);