
/// @function					survival_attribute_upgrade(_player)
/// @description				Levels up the players survival attribute, spends 1 token, and upgrades stats
function survival_attribute_upgrade(_player) {
	
	if(_player.survival_attribute_level < 15 && get_attribute_tokens(_player) > 0) {
		spend_attribute_tokens(_player, 1)
		_player.survival_attribute_level++;
		
		_player.max_health += 4;
		gain_health(_player, 4);
		_player.run_speed += 0.1;
		
		show_debug_message("Survival Attribute Level: ");
		show_debug_message(_player.survival_attribute_level);
	}
}



/// @function					combat_attribute_upgrade(_player)
/// @description				Levels up the players combat attribute, spends 1 token, and upgrades stats
function combat_attribute_upgrade(_player) {
	
	if(_player.combat_attribute_level < 15 && get_attribute_tokens(_player) > 0) {
		spend_attribute_tokens(_player, 1)
		_player.combat_attribute_level++;
		
		_player.additional_weapon_damage += 0.5;
		// +1% crit percent
		_player.crit_percent += 0.01;
		
		show_debug_message("Combat Attribute Level: ");
		show_debug_message(_player.combat_attribute_level);
	}
}



/// @function					special_attribute_upgrade(_player)
/// @description				Levels up the players special attribute, spends 1 token, and upgrades stats
function special_attribute_upgrade(_player) {
	
	if(_player.special_attribute_level < 15 && get_attribute_tokens(_player) > 0) {
		spend_attribute_tokens(_player, 1)
		_player.special_attribute_level++;
		
		_player.max_special_meter += 3;
		_player.ground_special_damage += 2;
		_player.jump_special_damage += 1;
		
		show_debug_message("Special Attribute Level: ");
		show_debug_message(_player.special_attribute_level);
	}
}


/// @function					get_survival_attribute_level(_player)
/// @description				Returns the players survival attribute level
function get_survival_attribute_level(_player) {
	
	return _player.survival_attribute_level;
}

/// @function					get_combat_attribute_level(_player)
/// @description				Returns the players combat attribute level
function get_combat_attribute_level(_player) {
	
	return _player.combat_attribute_level;
}

/// @function					get_special_attribute_level(_player)
/// @description				Returns the players special attribute level
function get_special_attribute_level(_player) {
	
	return _player.special_attribute_level;
}
