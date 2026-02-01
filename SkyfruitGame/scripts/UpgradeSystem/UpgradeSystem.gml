
enum UPGRADES {
	
	// Multiple upgrades
	HEALTH_UP,
	FIRE_SPEED_UP,
	MOVE_SPEED_UP,
	DAMAGE_UP,
	EXTRA_DASH,
	
	// One-offs
	BIG_BULLETS,
	INVULNERABLE_DASH,
}


function GetUpgrade(_upgrade) {
	array_push(global.upgradesList, _upgrade);
	instance_create_depth(0, 0, 0, oUpgradeGet, {
		upgrade: _upgrade
	});
}