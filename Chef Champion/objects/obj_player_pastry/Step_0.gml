 /// @description Adds Cake Special

// Inherit the parent event
event_inherited();

//ground special
if(special_attribute_level >= 5 && special_input() && is_grounded && !is_rolling && !is_dead
	&& (current_special_meter >= cake_cost) && (special_cooldown_countdown < 0)) {
	
	spend_special_meter(self, cake_cost);
	var _obj;
	
	//if moving horizontally, spawn infront of player
	if(abs(hor_move_input()) > 0) {
		_obj = instance_create_layer(self.x + (self.image_xscale * cake_spawn_width), self.y - cake_spawn_height, "Instances", obj_special_cake);
	}
	//if not/barely moving horizontally, spawn ontop of player
	else {
		_obj = instance_create_layer(self.x, self.y - cake_spawn_height, "Instances", obj_special_cake);
	}
	
	//give cake damage value
	_obj.damage = self.ground_special_damage;
	
	//reset cooldown timer
	special_cooldown_countdown = special_cooldown;
}




