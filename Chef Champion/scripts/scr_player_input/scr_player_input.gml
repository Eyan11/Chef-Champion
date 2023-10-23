/// @function					hor_move_input();
/// @description				returns a value between -1 and 1 for horizontal movement
function hor_move_input() {
	var _hor_movement = 0;
	
	//collects horizontal input from controller
	if(gamepad_is_connected(0)) {
		_hor_movement = gamepad_axis_value(0, gp_axislh);
	}
	//collects horizontal input from keyboard
	else {
		_hor_movement = max(keyboard_check(vk_right), keyboard_check(ord("D"))) //right arrow and "d" key
					  - max(keyboard_check(vk_left), keyboard_check(ord("A"))); //left arrow and "a" key
	}

	return _hor_movement;
}



/// @function					vert_move_input();
/// @description				returns a value between -1 and 1 for vertical movement
function vert_move_input() {
	var _vert_movement = 0;
	
	//collects vertical input from controller
	if(gamepad_is_connected(0)) {
		_vert_movement = gamepad_axis_value(0, gp_axislv);
		
	}
	//collects vertical input from keyboard
	else {
		_vert_movement = max(keyboard_check(vk_up), keyboard_check(ord("W"))) //up arrow and "w" key
					   - max(keyboard_check(vk_down), keyboard_check(ord("S"))); //down arrow and "s" key
	}

	return _vert_movement;	
}



/// @function					jump_input();
/// @description				returns true when pressing A or space
function jump_input() {
	var _is_jumping; //bool
	
	//collects jump input from controller
	if(gamepad_is_connected(0)) {
		_is_jumping = gamepad_button_check(0, gp_face1); //A button
	}
	//collects jump input from keybpard
	else {
		_is_jumping = keyboard_check(vk_space);
	}

	return _is_jumping;
}



/// @function					roll_input();
/// @description				returns true when pressing B or Shift
function roll_input() {
	var _is_rolling;
	
	//collects roll input from controller
	if(gamepad_is_connected(0)) {
		_is_rolling = gamepad_button_check(0, gp_face2); //B button
		
	}
	//collects roll input from keybpard
	else {
		_is_rolling = keyboard_check(vk_shift);
	}
	
	return _is_rolling;
}



/// @function					special_input();
/// @description				returns true when pressing Y or C
function special_input() {
	var _is_special_attacking;
	
	//collects special input from controller
	if(gamepad_is_connected(0)) {
		_is_special_attacking = gamepad_button_check(0, gp_face4); //Y button
	}
	//collects special input from keybpard
	else {
		_is_special_attacking = keyboard_check(ord("C"));
	}
	
	return _is_special_attacking;
}
