state();

if(buffer_timer > 0 or global.paused)
{
	buffer_timer--;
	key_up = 0;
	key_down = 0;
	key_select = 0;
	key_pause = 0;
}
else
{
	key_up = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
	key_down = keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down);
    key_select = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("P"));

	if (key_up) || (key_down) ||  (key_select) || (key_pause)
	{
		global.controller = 0;
	}

	if ((gamepad_axis_value(0,gp_axislv) < -0.4 && analogUpPrev == false) || gamepad_button_check_pressed(0,gp_padu) || (gamepad_axis_value(4,gp_axislv) < -0.4 && analogUpPrevD == false) || gamepad_button_check_pressed(4,gp_padu))
	{
		key_up = 1;
		global.controller = 1;
		analogUpPrev = true;
	}

	if ((gamepad_axis_value(0,gp_axislv) > 0.4 && analogDownPrev == false) || gamepad_button_check_pressed(0,gp_padd) || (gamepad_axis_value(4,gp_axislv) > 0.4 && analogDownPrevD == false) || gamepad_button_check_pressed(4,gp_padd))
	{
		key_down = 1;
		global.controller = 1;
		analogDownPrev = true;
	}

	if (gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(4,gp_face1))
	{
		key_select = 1;
		global.controller = 1;
	}
	
	// Record analog inputs for this frame
	if(gamepad_axis_value(0,gp_axislv) < -0.4)
	{
		analogUpPrev = true;	
	}
	else
	{
		analogUpPrev = false;	
	}

	if(gamepad_axis_value(0,gp_axislv) > 0.4)
	{
		analogDownPrev = true;	
	}
	else
	{
		analogDownPrev = false;	
	}

	if(gamepad_axis_value(4,gp_axislv) < -0.4)
	{
		analogUpPrevD = true;	
	}
	else
	{
		analogUpPrevD = false;	
	}

	if(gamepad_axis_value(4,gp_axislv) > 0.4)
	{
		analogDownPrevD = true;	
	}
	else
	{
		analogDownPrevD = false;	
	}
}


// Selector approaching target
sel_x = Approach(sel_x, sel_tar_x, 0.2, 0.3);
sel_y = Approach(sel_y, sel_tar_y, 0.2, 0.3);