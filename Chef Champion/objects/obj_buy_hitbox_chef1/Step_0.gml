if(place_meeting(self.x, self.y, obj_player_parent)){
	//buying
	if(equip_dish()) {
		//check for what player exists rn
		if(instance_exists(obj_player_pastry)) {
			//instance_create_layer(obj_player_pastry.x, obj_player_pastry.y, "Foreground_Instances", obj_player_fry)
			//instance_destroy(obj_player_pastry)
			//obj_player_manager.current_chef = obj_player_fry
			swap_chef(obj_player_fry)
		}
		else if(instance_exists(obj_player_fry)) {
			//instance_create_layer(obj_player_fry.x, obj_player_fry.y, "Foreground_Instances", obj_player_grill)
			//instance_destroy(obj_player_fry)
			//obj_player_manager.current_chef = obj_player_grill
			swap_chef(obj_player_grill)
		}
		else if(instance_exists(obj_player_grill)) {
			//instance_create_layer(obj_player_grill.x, obj_player_grill.y, "Foreground_Instances", obj_player_fry)
			//instance_destroy(obj_player_grill)
			//obj_player_manager.current_chef = obj_player_fry
			swap_chef(obj_player_fry)
		}
		else {
			instance_create_layer(self.x, self.y, "Foreground_Instances", obj_damage_dish)
		}
	}
} 