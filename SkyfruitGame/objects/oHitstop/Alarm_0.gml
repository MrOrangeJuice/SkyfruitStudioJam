/// @description Destroy

global.hitPause = false;
// Kill player if necessary
if(death)
{
	if(instance_exists(oPlayer))
	{
		SlideTransition(TRANS_MODE.RESTART);
	}
}
instance_destroy();