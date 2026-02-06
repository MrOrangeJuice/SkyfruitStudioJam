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