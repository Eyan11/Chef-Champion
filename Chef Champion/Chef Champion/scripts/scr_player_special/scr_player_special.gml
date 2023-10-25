
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
