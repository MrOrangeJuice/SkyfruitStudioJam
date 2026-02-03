/// @description Destroy

if(dir = 1)
{
	instance_create_layer(x,y,"VFX",oHitStabVFX);
}
else if(dir = -1)
{
	instance_create_layer(x,y,"VFX",oHitStabVFXLeft);
}

instance_destroy();