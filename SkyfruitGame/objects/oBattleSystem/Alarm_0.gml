if(resultsFrame < 5)
{
	ScreenShake(2,10);
	resultsFrame++;
	alarm[0] = random_range(0.1,0.2) * room_speed;
	audio_play_sound(snd_GunFire,5,false);
}
else
{
	alarm[1] = room_speed * 0.5;	
}