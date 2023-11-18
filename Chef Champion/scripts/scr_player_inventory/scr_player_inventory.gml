

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
	
	//REMOVE: for debugging, doesn't actually do anything except for else statement
	if(_weapon == obj_pastry_weapon)
		show_debug_message("Set inventory weapon to pastry weapon");
	else if (_weapon == obj_grill_weapon)
		show_debug_message("Set inventory weapon to grill weapon");
	else if(_weapon == obj_fry_weapon)
		show_debug_message("Set inventory weapon to fry weapon");
	else {
		show_debug_message("Weapon doesn't exist");
		return;
	}
	
	//TODO: despawn current weapon, and spawn in new weapon
	//set weapon
	obj_player_parent.inventory_weapon = _weapon;
}



/// @function					purchase_weapon(_weapon, _cost);
/// @description				Purchases specified weapon and adds it to inventory
function buy_weapon(_weapon, _cost) {
	
	//if cost is too large, don't let player buy the weapon
	if(_cost > get_recipes(obj_player_parent)) {
		show_debug_message("insufficient funds");
		return;
	}
	
	//add a weapon to the player's inventory (pastry weapon will probably be default weapon)
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
		
		obj_player_parent.own_grill_weapon = true;;
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
		show_debug_message("dish doesn't exist");
		return;
	}
	
	//spend the players money
	spend_recipes(obj_player_parent, _cost);
}



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
	
	//TODO: Despawn current chef, and spawn in new chef
	//set weapon
	obj_player_manager.current_chef = _chef;
}
