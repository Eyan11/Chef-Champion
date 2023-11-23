
/// @function					reset_special_meter(_player);
/// @description				Sets special meter to max
function reset_special_meter(_player){

	_player.current_special_meter = _player.max_special_meter;
}



/// @function					spend_special_meter(_player, _cost);
/// @description				Reduces special meter by the amount of the cost
function spend_special_meter(_player, _cost) {
	
	_player.special_meter_regen_countdown = _player.special_meter_regen_cooldown * 60; //60fps
	
	if(_player.current_special_meter <= _cost)
		_player.current_special_meter = 0;
	else
		_player.current_special_meter -= _cost;
		
	//REMOVE: remove later, just for testing
	show_debug_message("Special Meter: ");
	show_debug_message(_player.current_special_meter);
		
}



/// @function					regenerate_special_meter(_player);
/// @description				Replenishes special meter at the speed of the player's regen rate
function regenerate_special_meter(_player) {
	
	//if not at max meter, keep regenerating
	if(_player.current_special_meter < _player.max_special_meter)
		_player.current_special_meter += _player.special_meter_regen_rate/60; //60fps
	//if at max meter, stop regenerating
	else
		_player.current_special_meter = _player.max_special_meter;
}



/// @function					jump_special(_player, _special_obj, _special_spawn_offset);
/// @description				Spawns the special attack object in the direction of movement input
function jump_special(_player, _special_obj, _special_spawn_offset) {
	
	//if a platform already exists, destroy it immediately
	if(instance_exists(obj_special_platform_parent))
		obj_special_platform_parent.alarm[0] = 1;
	if(instance_exists(obj_jump_special_parent))
		obj_jump_special_parent.alarm[0] = 1;
	
	//if player is too close to wall, adjust eclair spawn to prevent it clipping inside wall
	if(place_meeting(_player.x + (_player.image_xscale * _special_spawn_offset), _player.y, collision_layer())) {
		_special_spawn_offset = (-1 * _player.image_xscale) * (_player.sprite_width/2);
	}
	
	var _obj;
	
	//make player jump and play special sound
	_player.vert_speed = jump_speed;
	audio_play_sound(snd_player_jump_special, 5, false);
	
	//0 is left (or no input), 90 is up, 180 is right, 270 is down
	var _direction = move_direction_angle();
	
	//Spawns jump special object in direction of movement input
	//if no input, spawn infront of player
	if(vert_move_input() == 0 && hor_move_input() == 0) {
		_obj = instance_create_layer(_player.x + (_player.image_xscale * _special_spawn_offset), 
			_player.y, "Instances", _special_obj);
		
		//rotate sprite
		_obj.image_xscale = _player.image_xscale;
		
		//set direction
		_obj.hor_dir = _player.image_xscale;
		_obj.vert_dir = 0;
		
		//can only become platform when moving horizontally
		_obj.can_become_platform = true;
	}
	//if moving left
	else if(_direction < 25 || _direction > 335) {
		_obj = instance_create_layer(_player.x - _special_spawn_offset, 
			_player.y, "Instances", _special_obj);
			
		//rotate sprite
		_obj.image_xscale = -1;
		_obj.image_angle = 0;
			
		//set direction
		_obj.hor_dir = -1;
		_obj.vert_dir = 0;
		
		//can only become platform when moving horizontally
		_obj.can_become_platform = true;
	}
	//if moving top left
	else if(_direction >= 25 && _direction <= 65) {
		_obj = instance_create_layer(_player.x - (_special_spawn_offset * (sqrt(2)/2)), 
			_player.y - (_special_spawn_offset * (sqrt(2)/2)), "Instances", _special_obj);
			
		//rotate sprite
		_obj.image_xscale = -1;
		_obj.image_angle = -45;
		
		//set direction
		_obj.hor_dir = -(sqrt(2)/2);
		_obj.vert_dir = -(sqrt(2)/2);
	}
	//if moving up
	else if(_direction > 65 && _direction < 115) {
		_obj = instance_create_layer(_player.x, _player.y - _special_spawn_offset, 
			"Instances", _special_obj);
			
		//rotate sprite
		_obj.image_angle = 90;
			
		//set direction
		_obj.hor_dir = 0;
		_obj.vert_dir = -1;
	}
	//if moving top right
	else if(_direction >= 115 && _direction <= 155) {
		_obj = instance_create_layer(_player.x + (_special_spawn_offset * (sqrt(2)/2)), 
			_player.y - (_special_spawn_offset * (sqrt(2)/2)), "Instances", _special_obj);
			
		//rotate sprite
		_obj.image_angle = 45;	
		
		//set direction
		_obj.hor_dir = (sqrt(2)/2);
		_obj.vert_dir = -(sqrt(2)/2);
	}
	//if moving right
	else if(_direction > 155 && _direction < 205) {
		_obj = instance_create_layer(_player.x + _special_spawn_offset, 
			_player.y, "Instances", _special_obj);
		
		//sprite already facing correct direction
		//set direction
		_obj.hor_dir = 1;
		_obj.vert_dir = 0;
		
		//can only become platform when moving horizontally
		_obj.can_become_platform = true;
	}
	//if moving bottom right
	else if(_direction >= 205 && _direction <= 245) {
		_obj = instance_create_layer(_player.x + (_special_spawn_offset * (sqrt(2)/2)), 
			_player.y + (_special_spawn_offset * (sqrt(2)/2)), "Instances", _special_obj);
			
		//rotate sprite
		_obj.image_angle = -45;
			
		//set direction
		_obj.hor_dir = (sqrt(2)/2);
		_obj.vert_dir = (sqrt(2)/2);
	}
	//if moving bottom
	else if(_direction > 245 && _direction < 295) {
		_obj = instance_create_layer(_player.x, _player.y + _special_spawn_offset, 
			"Instances", _special_obj);
			
		//rotate sprite
		_obj.image_angle = -90;
			
		//set direction
		_obj.hor_dir = 0;
		_obj.vert_dir = 1;
	}
	//if moving bottom left
	else if(_direction >= 295 && _direction <= 335) {
		_obj = instance_create_layer(_player.x - (_special_spawn_offset * (sqrt(2)/2)), 
			_player.y + (_special_spawn_offset * (sqrt(2)/2)), "Instances", _special_obj);
			
		//rotate sprite
		_obj.image_xscale = -1;
		_obj.image_angle = 45;
		
		//set direction
		_obj.hor_dir = -(sqrt(2)/2);
		_obj.vert_dir = (sqrt(2)/2);
	}
	
	//give the jump special a damage value
	_obj.damage = _player.jump_special_damage;
}



