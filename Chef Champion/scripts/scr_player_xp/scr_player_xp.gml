
/// @function					get_xp(_player)
/// @description				Returns the player's current xp
function get_xp(_player) {
	return _player.current_xp;
}


/// @function					get_level(_player)
/// @description				Returns the player's current level
function get_level(_player) {
	return _player.current_level;
}


/// @function					death_xp_loss(_player)
/// @description				Reduces player xp by 3% of threshold
function death_xp_loss(_player) {
	reduce_xp(_player, floor(_player.level_up_threshold * 0.03));
}


/// @function					add_xp(_player, _xp)
/// @description				Increases player xp by specified amount, and checks for level up
function add_xp(_player, _xp) {
	_player.current_xp += _xp;
	
	if(_player.current_xp >= _player.level_up_threshold) {
		level_up(_player);
	}
	
	show_debug_message("Current XP: ");
	show_debug_message(_player.current_xp);
}


/// @function					reduce_xp(_player, _xp)
/// @description				Decreases player xp by specified amount
function reduce_xp(_player, _xp) {
	if(_player.current_xp > _xp)
		_player.current_xp -= _xp;
	else
		_player.current_xp = 0;
		
	show_debug_message("Current XP: ");
	show_debug_message(_player.current_xp);
}


/// @function					level_up(_player)
/// @description				Increases the player's level by one
function level_up(_player) {
	//level up if under max level
	if(_player.current_level < 50) {
		reduce_xp(_player, _player.level_up_threshold)
		_player.current_level++;
		
		//level up stats
		_player.max_health += 1;
		gain_health(_player, 1);
		_player.additional_weapon_damage += 1;
		_player.max_special_meter += 1;
	}
	//gain attribute token if under max upgrade level (45 total attribute upgrades)
	if(_player.current_level < 45) {
		add_attribute_tokens(_player, 1);
	}
	
	//if level is a multiple of 5, increase threshold
	if(_player.current_level mod 5 == 0)
		_player.level_up_threshold += 250;
		
	show_debug_message("Current Level: ");
	show_debug_message(_player.current_level);
}
