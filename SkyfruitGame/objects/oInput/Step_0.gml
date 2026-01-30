// Inputs
global.key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
global.key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
global.key_jump = keyboard_check(vk_space) || keyboard_check(ord("Z"));
global.key_attack = keyboard_check_pressed(vk_lshift) || keyboard_check_pressed(ord("X"));
global.key_stab = keyboard_check_pressed(vk_lcontrol) || keyboard_check_pressed(ord("C"));
global.key_heal = keyboard_check_pressed(vk_alt) || keyboard_check_pressed(ord("V"));
global.key_heal_release = keyboard_check_released(vk_alt) || keyboard_check_released(ord("V"));
global.key_pause = keyboard_check_pressed(vk_escape);

if (global.key_left) || (global.key_right) || (global.key_jump) || (global.key_attack) || (global.key_stab) || (global.key_heal) || (global.key_heal_release) || (global.key_pause)
{
	global.controller = 0;
}

// Gamepad input
if (gamepad_axis_value(0,gp_axislh) < -0.2 || gamepad_button_check(0,gp_padl) || gamepad_axis_value(4,gp_axislh) < -0.2 || gamepad_button_check(4,gp_padl))
{
	global.key_left = 1;
	global.controller = 1;
}

if (gamepad_axis_value(0,gp_axislh) > 0.2 || gamepad_button_check(0,gp_padr) || gamepad_axis_value(4,gp_axislh) > 0.2 || gamepad_button_check(4,gp_padr))
{
	global.key_right = 1;
	global.controller = 1;
}

if (gamepad_button_check(0,gp_face1) || gamepad_button_check(4,gp_face1))
{
	global.key_jump = 1;
	global.controller = 1;
}

if (gamepad_button_check_pressed(0,gp_face3) || gamepad_button_check_pressed(4,gp_face3))
{
	global.key_attack = 1;
	global.controller = 1;
}

if (gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(4,gp_face2))
{
	global.key_stab = 1;
	global.controller = 1;
}

if (gamepad_button_check_pressed(0,gp_face4) || gamepad_button_check_pressed(4,gp_face4))
{
	global.key_heal = 1;
	global.controller = 1;
}

if (gamepad_button_check_released(0,gp_face4) || gamepad_button_check_released(4,gp_face4))
{
	global.key_heal_release = 1;
	global.controller = 1;
}

if (gamepad_button_check_pressed(0,gp_start) || gamepad_button_check_pressed(4,gp_start))
{
	global.key_pause = 1;
	global.controller = 1;
}