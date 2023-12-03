

/// @function					swap_dish(_dish);
/// @description				Swaps inventory dish to specified dish
function swap_dish(_dish) {
	
	//REMOVE: for debugging, doesn't actually do anything except for else statement
	if(_dish == obj_speed_dish)
		show_debug_message("Set inventory dish to speed dish");
	else if (_dish == obj_damage_dish)
		show_debug_message("Set inventory dish to damage dish");
	else if(_dish == obj_health_dish)
		show_debug_message("Set inventory dish to health dish");
	else {
		show_debug_message("dish doesn't exist");
		return;
	}
	
	//set dish
	obj_player_parent.inventory_dish = _dish;
}



/// @function					buy_dish(_dish, _cost);
/// @description				Purchases specified dish and adds it to inventory
function buy_dish(_dish, _cost) {
	
	//if cost is too large, don't let player buy the dish
	if(_cost > get_recipes(obj_player_parent)) {
		show_debug_message("insufficient funds");
		return;
	}
	
	//add a dish to the player's inventory
	if(_dish == obj_speed_dish) {
		obj_player_parent.total_speed_dishes++;
		show_debug_message("Purchased speed dish");
	}
	else if (_dish == obj_damage_dish) {
		obj_player_parent.total_damage_dishes++;
		show_debug_message("Purchased damage dish");
	}
	else if(_dish == obj_health_dish) {
		obj_player_parent.total_health_dishes++;
		show_debug_message("Purchased health dish");
	}
	else {
		show_debug_message("dish doesn't exist");
		return;
	}
	
	//spend the players money
	spend_recipes(obj_player_parent, _cost);
}



/// @function					swap_dish(_dish);
/// @description				Swaps inventory dish to specified dish
function swap_weapon(_weapon) {
	
	//don't swap weapons if already equiped
	if(_weapon == obj_player_parent.inventory_weapon) {
		show_debug_message("Weapon already equiped");
		return;
	}
	
	//Don't equip weapon if player hasn't purchased it yet, or if weapon doesn't exist
	if(_weapon == obj_pastry_weapon) {
	
		if(!obj_player_parent.own_pastry_weapon) {
			show_debug_message("Don't own pastry weapon");
			return;
		}
		show_debug_message("Set inventory weapon to pastry weapon");
	}
	else if (_weapon == obj_grill_weapon) {
		
		if(!obj_player_parent.own_grill_weapon) {
			show_debug_message("Don't own grill weapon");
			return;
		}
		show_debug_message("Set inventory weapon to grill weapon");
	}
	else if(_weapon == obj_fry_weapon) {
		if(!obj_player_parent.own_fry_weapon) {
			show_debug_message("Don't own fry weapon");
			return;
		}
		show_debug_message("Set inventory weapon to fry weapon");
	}
	else {
		show_debug_message("Weapon doesn't exist");
		return;
	}
	
		
	//despawn current weapon
	if(instance_exists(obj_player_parent.inventory_weapon))
		instance_destroy(obj_player_parent.inventory_weapon);
		
	//set weapon
	obj_player_parent.inventory_weapon = _weapon;
	//spawn weapon
	if(!instance_exists(obj_player_parent.inventory_weapon))
		instance_create_layer(0, 0, "Instances", obj_player_parent.inventory_weapon);
		
}



/// @function					purchase_weapon(_weapon, _cost);
/// @description				Purchases specified weapon and adds it to inventory
function buy_weapon(_weapon, _cost) {
	
	//if cost is too large, don't let player buy the weapon
	if(_cost > get_recipes(obj_player_parent)) {
		show_debug_message("insufficient funds");
		return;
	}
	
	//add a weapon to the player's inventory
	if(_weapon == obj_pastry_weapon) {
		//don't let the player buy a weapon they already own
		if(obj_player_parent.own_pastry_weapon) {
			show_debug_message("Already own pastry weapon");
			return;
		}
		
		obj_player_parent.own_pastry_weapon = true;
		show_debug_message("Purchased speed pastry weapon");
	}
	else if (_weapon == obj_grill_weapon) {
		//don't let the player buy a weapon they already own
		if(obj_player_parent.own_grill_weapon) {
			show_debug_message("Already own grill weapon");
			return;
		}
		
		obj_player_parent.own_grill_weapon = true;
		show_debug_message("Purchased grill weapon");
	}
	else if(_weapon == obj_fry_weapon) {
		//don't let the player buy a weapon they already own
		if(obj_player_parent.own_fry_weapon) {
			show_debug_message("Already own fry weapon");
			return;
		}
		
		obj_player_parent.own_fry_weapon = true;
		show_debug_message("Purchased fry weapon");
	}
	else {
		show_debug_message("weapon doesn't exist");
		return;
	}
	
	//spend the players money
	spend_recipes(obj_player_parent, _cost);
}



/// @function					swap_chef(_chef);
/// @description				Changes the current chef to specified chef
function swap_chef(_chef) {
	
	
	//REMOVE: for debugging, doesn't actually do anything except for else statement
	if(_chef == obj_player_pastry)
		show_debug_message("Set chef to pastry chef");
	else if (_chef == obj_player_grill)
		show_debug_message("Set chef to grill chef");
	else if(_chef == obj_player_fry)
		show_debug_message("Set chef to fry chef");
	else {
		show_debug_message("Chef doesn't exist");
		return;
	}
	
	//set chef
	obj_player_manager.current_chef = _chef;
	save_game();
	load_game();
}



/// @function					use_speed_dish(_player);
/// @description				Buffs speed by 50% of current speed for 20 seconds
function use_speed_dish(_player) {
	//don't let player use multiple dishes at once and don't let player use dish if they have none
	if(_player.using_speed_dish || _player.total_speed_dishes <= 0)
		return;
	
	_player.run_speed += 3;
	_player.total_speed_dishes--;
	audio_play_sound(snd_speed_dish, 10, false);
	
	_player.using_speed_dish = true;
	//Remove BUff after 20 seconds
	_player.alarm[7] = 20 * 60;
	
	show_debug_message("Speed dishes left: ");
	show_debug_message(_player.total_speed_dishes);
}



/// @function					use_damage_dish(_player);
/// @description				Doubles current damage for normal attack weapons for 20 seconds
function use_damage_dish(_player) {
	//don't let player use multiple dishes at once and don't let player use dish if they have none
	if(_player.using_damage_dish || _player.total_damage_dishes <= 0)
		return;

	_player.additional_weapon_damage += 5;
	_player.using_damage_dish = true;
	_player.total_damage_dishes--;
	audio_play_sound(snd_damage_dish, 10, false);
	
	
	//Remove BUff after 20 seconds
	_player.alarm[8] = 20 * 60;
	
	show_debug_message("damage dishes left: ");
	show_debug_message(_player.total_damage_dishes);
}



/// @function					use_health_dish(_player);
/// @description				Increases health by 50% of current health
function use_health_dish(_player) {
	//don't let player use dish if they have none or are already at max health
	if(_player.total_health_dishes <= 0 || get_health(_player) >= _player.max_health)
		return;
	
	gain_health(_player, _player.max_health/2)
	_player.total_health_dishes--;
	audio_play_sound(snd_health_dish, 10, false);
	
	show_debug_message("health dishes left: ");
	show_debug_message(_player.total_health_dishes);
}