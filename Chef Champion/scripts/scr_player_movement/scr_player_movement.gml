
/// @function					player_movement_calculations(_player);
/// @description				Calculates player horizontal and vertical speed, makes character face movement direction, and defines grounded variable
function player_movement_calculations(_player) {
	
	//set horizontal and vertical speed
	_player.hor_speed = hor_move_input() * _player.run_speed;
	_player.vert_speed += _player.grav;
	
	
	//make player face movement direction
	if(_player.hor_speed != 0)
		_player.image_xscale = sign(_player.hor_speed);


	//define grounded variable and reset coyote time
	if(place_meeting(_player.x, _player.y + abs(_player.vert_speed), collision_layer())) {
		_player.is_grounded = true;
		_player.coyote_countdown = _player.coyote_time;
	}
	else 
		_player.is_grounded = false;
		
}



/// @function					player_roll(_player);
/// @description				Calculates player roll
function player_roll(_player) {
	
	_player.roll_countdown--;
	_player.roll_cooldown_countdown--;
	
	
	//roll start step
	if(roll_input() && !_player.is_rolling && _player.is_grounded && _player.roll_cooldown_countdown < 0) {
		_player.roll_countdown = _player.roll_time;
		
		//roll in the direction player is facing
		_player.roll_direction = sign(_player.image_xscale);
	
		//increase gravity so it's not "floaty"
		_player.grav *= 4;
	
		_player.is_invincible = false;
		_player.sprite_index = spr_pastry_roll;
		_player.is_rolling = true;
	}


	//roll step
	if(_player.is_rolling) {
		//overide horizontal speed, now it won't take previous player input
		_player.hor_speed = _player.roll_direction * _player.roll_speed;
	
		//roll end step
		if(_player.roll_countdown < 0) {
			//return gravity to normal
			_player.grav /= 4;
			_player.roll_cooldown_countdown = _player.roll_cooldown_time;
			_player.is_invincible = false;
			_player.sprite_index = spr_pastry_idle;
			_player.is_rolling = false;
		}
	}
}



/// @function					player_jump(_player);
/// @description				Calculates player jump
function player_jump(_player) {
	
	_player.coyote_countdown--;
	_player.variable_jump_countdown--;
	
	
	//minimum jump height and jump start step
	if(_player.coyote_countdown > 0 && jump_input() && !_player.is_rolling) {
		_player.vert_speed = _player.jump_speed;
		_player.variable_jump_countdown = _player.variable_jump_time;
		_player.coyote_countdown = 0;
		_player.jump_is_starting = true;
	}


	//variable jump height and jump step
	if(_player.variable_jump_countdown > 0 && jump_input()) {
		_player.vert_speed = _player.jump_speed;
	}
	
	//float jump
	if(_player.survival_attribute_level >= 5 && jump_input() && 
		(_player.vert_speed >= _player.float_jump_speed) && !_player.is_rolling) {
		
		_player.vert_speed = _player.float_jump_speed;
	}
}



/// @function					player_collision_and_move(_player);
/// @description				Calculates player collision and coyote time and moves player
function player_collision_and_move(_player) {
	
	//if about to collide in horizontal direction
	if(place_meeting(_player.x + _player.hor_speed, _player.y, collision_layer())) {
	
		//while moving horizontally, reduce speed by half
		while(abs(_player.hor_speed) > 0.1) {
			_player.hor_speed *= 0.5;
		
			//if new projected position isn't colliding, move closer to collider
			if(!place_meeting(_player.x + _player.hor_speed, _player.y, collision_layer()))
				_player.x += _player.hor_speed;
		}
		//if player can't move any closer to collider, stop moving
		_player.hor_speed = 0;
	}
	
	//move player horizontally, reducing horizontal speed when frosted
	if(_player.is_frosted)
		_player.x += _player.hor_speed * _player.frosted_multiplier;
	else
		_player.x += _player.hor_speed;


	//if about to collide in vertical direction
	if(place_meeting(_player.x, _player.y + _player.vert_speed, collision_layer())) {
		/*
		//if about to hit ground, reset coyote timer
		if(_player.vert_speed > 0)
			_player.coyote_countdown = _player.coyote_time;
		*/
		//while moving vertically, reduce speed until 0
		while(abs(_player.vert_speed) > 0.1) {
			
			_player.vert_speed *= 0.5;
		
			//if new projected position isn't colliding, move closer to collider
			if(!place_meeting(_player.x, _player.y + _player.vert_speed, collision_layer()))
				_player.y += _player.vert_speed;
		}
		//if player can't move any close to collider, stop moving
		_player.vert_speed = 0;
	}

	//move player vertically, reducing vertical speed when frosted
	if(_player.is_frosted)
		_player.y += _player.vert_speed * _player.frosted_multiplier;
	else
		_player.y += _player.vert_speed;
}


