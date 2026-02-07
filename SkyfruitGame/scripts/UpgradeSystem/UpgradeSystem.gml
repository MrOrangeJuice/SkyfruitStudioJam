
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
	ApplyUpgrades();
}


function CheckUpgrades(upgrade)
{
	var num = 0;
	for(i = 0; i < array_length(global.upgradesList); i++)
	{
		if(upgrade == global.upgradesList[i])
		{
			num++;
		}
	}
	
	return num;
}


// I'm gonna call this whenever you get an upgrade -Arkie
function ApplyUpgrades() {

	with (oBattleSystem) {
		bigBulletUpgrade = CheckUpgrades(UPGRADES.BIG_BULLETS);
		invincDashUpgrade = CheckUpgrades(UPGRADES.INVULNERABLE_DASH);

		damageUpgrade = CheckUpgrades(UPGRADES.DAMAGE_UP);
		dashUpgrade = CheckUpgrades(UPGRADES.EXTRA_DASH);
		fireRateUpgrade = CheckUpgrades(UPGRADES.FIRE_SPEED_UP);
		moveSpeedUpgrade = CheckUpgrades(UPGRADES.MOVE_SPEED_UP);
		healthUpgrade = CheckUpgrades(UPGRADES.HEALTH_UP);

		global.maxHealth = 10 + (healthUpgrade * 2);
		global.health = global.maxHealth;
	}
}