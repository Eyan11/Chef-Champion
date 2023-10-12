
/// @function					player_movement_calculations(_player);
/// @description				Calculates player horizontal and vertical speed, makes character face movement direction, and defines grounded variable
function player_movement_calculations(_player) {
	
	//set horizontal and vertical speed
	_player.hor_speed = hor_move_input() * _player.run_speed;
	_player.vert_speed += _player.grav;
	
	
	//make player face movement direction
	if(_player.hor_speed != 0)
		_player.image_xscale = sign(_player.hor_speed);


	//define grounded variable
	if(place_meeting(_player.x, _player.y + 0.2, collision_layer())) {
		_player.is_grounded = 1;
	}
	else 
		_player.is_grounded = 0;
}



/// @function					player_roll(_player);
/// @description				Calculates player roll
function player_roll(_player) {
	
	_player.roll_countdown--;
	_player.roll_cooldown_countdown--;
	
	
	//roll start step
	if(roll_input() && _player.is_rolling == 0 && _player.is_grounded == 1 && _player.roll_cooldown_countdown < 0) {
		_player.roll_countdown = _player.roll_time;
		
		//roll in the direction player is facing
		_player.roll_direction = sign(_player.image_xscale);
	
		//increase gravity so it's not "floaty"
		_player.grav *= 4;
	
		_player.is_invincible = 1;
		_player.sprite_index = spr_player_pastry_roll;
		_player.is_rolling = 1;
	}


	//roll step
	if(_player.is_rolling == 1) {
		//overide horizontal speed, now it won't take previous player input
		_player.hor_speed = _player.roll_direction * _player.roll_speed;
	
		//roll end step
		if(_player.roll_countdown < 0) {
			//return gravity to normal
			_player.grav /= 4;
			_player.roll_cooldown_countdown = _player.roll_cooldown_time;
			_player.is_invincible = 0;
			_player.sprite_index = spr_player_pastry;
			_player.is_rolling = 0;
		}
	}
}



/// @function					player_jump(_player);
/// @description				Calculates player jump
function player_jump(_player) {
	
	_player.coyote_countdown--;
	_player.variable_jump_countdown--;
	
	
	//minimum jump height and jump start step
	if(_player.coyote_countdown > 0 && jump_input() && _player.is_rolling == 0) {
		_player.vert_speed = _player.jump_speed;
		_player.variable_jump_countdown = _player.variable_jump_time;
		_player.coyote_countdown = 0;
	}


	//variable jump height and jump step
	if(_player.variable_jump_countdown > 0 && jump_input()) {
		_player.vert_speed = _player.jump_speed;
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
	
	//move player horizontally
	_player.x += _player.hor_speed;


	//if about to collide in vertical direction
	if(place_meeting(_player.x, _player.y + _player.vert_speed, collision_layer())) {
		
		//if about to hit ground, reset coyote timer
		if(_player.vert_speed > 0)
			_player.coyote_countdown = _player.coyote_time;
	
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

	//move player vertically
	_player.y += _player.vert_speed;
}




















////////////////////////////////////////////////////////////
function player_movement(_player){

//set horizontal and vertical speed
_player.hor_speed = hor_move_input() * _player.run_speed;
_player.vert_speed += _player.grav;

//reduce the coutdown timers
_player.coyote_countdown--;
_player.variable_jump_countdown--;
_player.roll_countdown--;
_player.roll_cooldown_countdown--;

//define grounded variable
if(place_meeting(_player.x, _player.y + 0.2, collision_layer())) {
	_player.is_grounded = 1;
}
else 
	_player.is_grounded = 0;


//roll start step
if(roll_input() && _player.is_rolling == 0 && _player.is_grounded == 1 && _player.roll_cooldown_countdown < 0) {
	_player.roll_countdown = _player.roll_time;
	//sign of the direction they face
	_player.roll_direction = sign(_player.image_xscale);
	
	//increase gravity so it's not "floaty"
	_player.grav *= 4;
	
	_player.sprite_index = spr_player_pastry_roll;
	_player.is_rolling = 1;
}

//roll step
if(_player.is_rolling == 1) {
	//overeide horizontal speed, now it won't take previous player input
	_player.hor_speed = _player.roll_direction * _player.roll_speed;
	
	//TODO: make invincible
	
	//roll end step
	if(_player.roll_countdown < 0) {
		//return gravity to normal
		_player.grav /= 4;
		_player.roll_cooldown_countdown = _player.roll_cooldown_time;
		_player.sprite_index = spr_player_pastry;
		_player.is_rolling = 0;
	}
}


//minimum jump height and jump start step
if(_player.coyote_countdown > 0 && jump_input() && _player.is_rolling == 0) {
	_player.vert_speed = _player.jump_speed;
	_player.variable_jump_countdown = _player.variable_jump_time;
	_player.coyote_countdown = 0;
}

//variable jump height and jump step
if(_player.variable_jump_countdown > 0 && jump_input()) {
	
	_player.vert_speed = _player.jump_speed;
}


//horizontal collision
//if about to collide in horizontal direction
if(place_meeting(_player.x + _player.hor_speed, _player.y, collision_layer())) {
	
	//while moving horizontally, reduce speed by hald
	while(abs(_player.hor_speed) > 0.1) {
		_player.hor_speed *= 0.5;
		
		//if new projected position isn't colliding, move closer to collider
		if(!place_meeting(_player.x + _player.hor_speed, _player.y, collision_layer()))
			_player.x += _player.hor_speed;
	}
	_player.hor_speed = 0;
}

_player.x += _player.hor_speed;


//vertical collision
//if about to collide in vertical direction
if(place_meeting(_player.x, _player.y + _player.vert_speed, collision_layer())) {
	
	//if about to hit ground, reset coyote timer
	if(_player.vert_speed > 0) {
		_player.coyote_countdown = _player.coyote_time;
	}

	
	//while moving vertically, reduce speed until 0
	while(abs(_player.vert_speed) > 0.1) {
		_player.vert_speed *= 0.5;
		
		//if new projected position isn't colliding, move closer to collider
		if(!place_meeting(_player.x, _player.y + _player.vert_speed, collision_layer()))
			_player.y += _player.vert_speed;
	}
	_player.vert_speed = 0;
}

_player.y += _player.vert_speed;


//makes player face movement direction
if(_player.hor_speed != 0)
	_player.image_xscale = sign(_player.hor_speed);

}
