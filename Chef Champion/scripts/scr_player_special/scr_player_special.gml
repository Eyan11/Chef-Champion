
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



/// @function					jump_special(_player, _special_obj);
/// @description				Spawns the special attack object in the direction of movement input
function jump_special(_player, _special_obj) {
	
	_player.can_jump_special = false;
	spend_special_meter(_player, _player.jump_special_cost);
	
	//0 is left (or no input), 90 is up, 180 is right, 270 is down
	var _direction = move_direction_angle();
	
	//Spawns jump special object in direction of movement input
	//if no input, spawn infront of player
	if(vert_move_input() == 0 && hor_move_input() == 0) {
		var _obj = instance_create_layer(_player.x + (_player.image_xscale * _player.jump_special_spawn_offset), 
			_player.y, "Instances", _special_obj);
		
		//make sprite face move direction
		_obj.image_xscale = _player.image_xscale;
		
		//set direction
		_obj.hor_dir = _player.image_xscale;
		_obj.vert_dir = 0;
	}
	//if moving left
	else if(_direction < 25 || _direction > 335) {
		var _obj = instance_create_layer(_player.x - _player.jump_special_spawn_offset, 
			_player.y, "Instances", _special_obj);
			
		//make sprite face move direction
		_obj.image_xscale = -1;
		_obj.image_angle = 0;
			
		//set direction
		_obj.hor_dir = -1;
		_obj.vert_dir = 0;
	}
	//if moving top left
	else if(_direction >= 25 && _direction <= 65) {
		instance_create_layer(_player.x - (_player.jump_special_spawn_offset * (sqrt(2)/2)), 
			_player.y - (_player.jump_special_spawn_offset * (sqrt(2)/2)), "Instances", _special_obj);
			
		//set direction
		_special_obj.hor_dir = -(sqrt(2)/2);
		_special_obj.vert_dir = -(sqrt(2)/2);
	}
	//if moving up
	else if(_direction > 65 && _direction < 115) {
		instance_create_layer(_player.x, _player.y - _player.jump_special_spawn_offset, 
			"Instances", _special_obj);
			
		//set direction
		_special_obj.hor_dir = 0;
		_special_obj.vert_dir = -1;
	}
	//if moving top right
	else if(_direction >= 115 && _direction <= 155) {
		instance_create_layer(_player.x + (_player.jump_special_spawn_offset * (sqrt(2)/2)), 
			_player.y - (_player.jump_special_spawn_offset * (sqrt(2)/2)), "Instances", _special_obj);
			
		//set direction
		_special_obj.hor_dir = (sqrt(2)/2);
		_special_obj.vert_dir = -(sqrt(2)/2);
	}
	//if moving right
	else if(_direction > 155 && _direction < 205) {
		var _obj = instance_create_layer(_player.x + _player.jump_special_spawn_offset, 
			_player.y, "Instances", _special_obj);
		
		//sprite already facing correct direction
		//set direction
		_obj.hor_dir = 1;
		_obj.vert_dir = 0;
	}
	//if moving bottom right
	else if(_direction >= 205 && _direction <= 245) {
		instance_create_layer(_player.x + (_player.jump_special_spawn_offset * (sqrt(2)/2)), 
			_player.y + (_player.jump_special_spawn_offset * (sqrt(2)/2)), "Instances", _special_obj);
			
		//set direction
		_special_obj.hor_dir = (sqrt(2)/2);
		_special_obj.vert_dir = (sqrt(2)/2);
	}
	//if moving bottom
	else if(_direction > 245 && _direction < 295) {
		instance_create_layer(_player.x, _player.y + _player.jump_special_spawn_offset, 
			"Instances", _special_obj);
			
		//set direction
		_special_obj.hor_dir = 0;
		_special_obj.vert_dir = 1;
	}
	//if moving bottom left
	else if(_direction >= 295 && _direction <= 335) {
		instance_create_layer(_player.x - (_player.jump_special_spawn_offset * (sqrt(2)/2)), 
			_player.y + (_player.jump_special_spawn_offset * (sqrt(2)/2)), "Instances", _special_obj);
			
		//set direction
		_special_obj.hor_dir = -(sqrt(2)/2);
		_special_obj.vert_dir = (sqrt(2)/2);
	}
}

function set_jump_special_direction(_direction) {
	
}

function get_jump_special_direction() {
	
}
