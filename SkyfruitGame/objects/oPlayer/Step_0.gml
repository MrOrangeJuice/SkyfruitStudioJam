// Get Player Input

key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_jump = keyboard_check(vk_space) || keyboard_check(ord("Z")) || keyboard_check(ord("P"));
key_jump_released = keyboard_check_released(vk_space) || keyboard_check_released(ord("Z")) || keyboard_check_released(ord("P"));
key_shoot = mouse_check_button_pressed(mb_left) || keyboard_check_pressed(ord("X")) || keyboard_check_pressed(ord("O"));
key_shoot_released = mouse_check_button_released(mb_left) || keyboard_check_released(ord("X")) || keyboard_check_released(ord("O"));
key_dash = keyboard_check_pressed(vk_lshift) || keyboard_check_pressed(ord("C")) || keyboard_check_pressed(ord("I"));

if (key_left) || (key_right) || (key_jump) || (key_shoot) || (key_dash)
{
	global.controller = 0;
}

// Gamepad input
if (gamepad_axis_value(0,gp_axislh) < -0.2 || gamepad_button_check(0,gp_padl) || gamepad_axis_value(4,gp_axislh) < -0.2 || gamepad_button_check(4,gp_padl))
{
	key_left = 1;
	global.controller = 1;
}

if (gamepad_axis_value(0,gp_axislh) > 0.2 || gamepad_button_check(0,gp_padr) || gamepad_axis_value(4,gp_axislh) > 0.2 || gamepad_button_check(4,gp_padr))
{
	key_right = 1;
	global.controller = 1;
}

if (gamepad_button_check(0,gp_face1) || gamepad_button_check(4,gp_face1))
{
	key_jump = 1;
	global.controller = 1;
}

if (gamepad_button_check_released(0,gp_face1) || gamepad_button_check_released(4,gp_face1))
{
	key_jump_released = 1;
	global.controller = 1;
}

if (gamepad_button_check_pressed(0,gp_face3) || gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(4,gp_face3) || gamepad_button_check_pressed(4,gp_face2))
{
	key_shoot = 1;
	global.controller = 1;
}

if (gamepad_button_check_released(0,gp_face3) || gamepad_button_check_released(0,gp_face2) || gamepad_button_check_released(4,gp_face3) || gamepad_button_check_released(4,gp_face2))
{
	key_shoot_released = 1;
	global.controller = 1;
}

if (gamepad_button_check_pressed(0,gp_shoulderl) || gamepad_button_check_pressed(0,gp_shoulderr) || gamepad_button_check_pressed(4,gp_shoulderl) || gamepad_button_check_pressed(4,gp_shoulderr))
{
	key_dash = 1;
	global.controller = 1;
}

if(!global.paused && !global.hitPause)
{
	image_speed = 1;
	
	shootTimer--;

	// If player doesn't release jump, they can't jump again
	if(key_jump_released)
	{
		canJump = true;
	}

	// Build up speed depending on inputs
	if(key_left && !key_right)
	{
		currentwalksp -= accel;
		if(currentwalksp < (-walksp - accel * 2))
		{
			currentwalksp += accel * 2;
		}
		else if(currentwalksp < -walksp)
		{
			currentwalksp += accel;
		}
	}
	if(key_right && !key_left)
	{
		currentwalksp += accel;
		if(currentwalksp > (walksp + accel * 2))
		{
			currentwalksp -= accel * 2;
		}
		else if(currentwalksp > walksp)
		{
			currentwalksp -= accel;
		}
	}
	// Slow down if not moving
	if (!(key_left || key_right) || (key_left && key_right))
	{
		if(currentwalksp < 0)
		{
			currentwalksp += accel;
		}
		if(currentwalksp > 0)
		{
			currentwalksp -= accel;
		}
	}
	
	hsp = currentwalksp;
	vsp = vsp + grv;

	// Decrement jump buffer
	jumpBuffer--;
	
	// Check if player is airborne
	if(!place_meeting(x, y + 1, oWall))
	{
		airborne = true;	
	}
	else
	{
		if(airborne)
		{
			instance_create_layer(x,y,"VFX",oLandVFX);
			hit = false;		
		}
		airborne = false;	
		jumpBuffer = 5;
	}

	// Jump
	if (jumpBuffer > 0) && (key_jump) && (canJump)
	{
		vsp = -4;
		audio_play_sound(snd_Jump, 5, false);
		instance_create_layer(x,y,"VFX",oJumpVFX);
		canJump = false;
	}

	// Spawn dust
	if(spawnDust-- < 0 && abs(hsp) > 0 && place_meeting(x,y+1,oWall))
	{
		instance_create_layer(x+random_range(-2,2),y+6+random_range(-2,2),"BackVFX",oDustVFX);
		spawnDust = irandom_range(3,7);
	}

	// Variable jump height
	if vsp < 0 && (!(key_jump)) //if you're moving upwards in the air but not holding down jump
	{
		vsp *= 0.85; //essentially, divide your vertical speed
	}

	// Dash
	if(key_dash && !dashing)
	{
		speedValue = 4;
		dashing = true;
		initialRunDir = image_xscale;
		dashOver = false;
		walksp = speedValue;
		hit = false;
		if(key_right)
		{
			currentwalksp = speedValue;
		}
		else if(key_left)
		{
			currentwalksp = -speedValue;
		}
		else
		{
			currentwalksp = speedValue * sign(image_xscale);
		}
		dashVFX = instance_create_layer(x,y,"VFX",oDashVFX);
		if (image_xscale == -1) dashVFX.image_xscale = -1;
		alarm[0] = room_speed * 0.2;
		dashParticles = instance_create_layer(x,y,"Walls",oPlayerDashParticle);
		alarm[1] = room_speed * 0.05;
		if (airborne)
		{
			airDash = true;
		}
		audio_play_sound(snd_Dash,5,false);
	}
			
	// Changes while dashing
	if(dashing)
	{
		if(airDash)
		{
			vsp = 0;
		}
		else
		{
			if(airborne)
			{
				walksp -= 0.035;
				if(walksp < 2) walksp = 2;
			}
		}
	}
	else
	{
		walksp = 2;
	}
			
	// End Dash
	if(dashOver)
	{
		// If an air dash, stop immediately
		if(airDash)
		{
			dashing = false;
			airDash = false;
			instance_destroy(dashParticles);
		}
		// Otherwise end when touching the ground or holding a different direction
		else
		{
			if(!airborne || image_xscale != initialRunDir)
			{
				dashing = false;
				airDash = false;
				instance_destroy(dashParticles);
			}
		}
	}

	// Horizontal Collision
	if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;

	// Vertical Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;

	// Shoot
	if (key_shoot && shootTimer <= 0)
	{
		shootTimer = shootCooldown;
		bullet = instance_create_layer(x+(13*image_xscale),y+3.5,"Bullets",oBullet);
		if(image_xscale == 1)
		{
			bullet.xdir = 1;
			bullet.image_xscale = 1;
			for(var i = 0; i < 3; i++)
			{
				var vfx = instance_create_layer(x+8,y+2,"VFX",oParticleStabVFXRight);
				vfx.particleSpeed += hsp;
			}
		}
		else
		{
			bullet.xdir = -1;	
			bullet.image_xscale = -1;
			for(var i = 0; i < 3; i++)
			{
				var vfx = instance_create_layer(x-8,y+2,"VFX",oParticleStabVFXLeft);
				vfx.particleSpeed += abs(hsp);
			}
		}
		audio_play_sound(snd_Shoot,5,false);
		ScreenShake(1,5);
	}
}
else
{
	alarm[0]++;
	alarm[1]++;
	image_speed = 0;
}
// Animation
if(hit)
{
	sprite_index = sPlayerPlaceholderHit;	
}
else if(airborne)
{
	if (vsp <= 0) sprite_index = sPlayerPlaceholderJump;
	if (vsp > 0) sprite_index = sPlayerPlaceholderJumpDown;
}
else if(dashing)
{
	sprite_index = sPlayerPlaceholderDash;	
}
else
{
	if (hsp != 0)
	{
		sprite_index = sPlayerPlaceholderRun;
	}
	else
	{
		sprite_index = sPlayer;
	}
}

if (hsp != 0 && !hit) image_xscale = sign(hsp);