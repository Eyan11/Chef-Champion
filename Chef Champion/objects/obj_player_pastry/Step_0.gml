/// @description adds special attacks

// Inherit the parent event
event_inherited();

//ground special
if(special_attribute_level >= 5 && special_input() && is_grounded && !is_rolling
	&& (current_special_meter >= cake_cost) && (special_cooldown_countdown < 0)) {
	
	spend_special_meter(self, cake_cost);
	
	//if moving horizontally, spawn infront of player
	if(abs(hor_move_input()) > 0) {
		instance_create_layer(self.x + (self.image_xscale * cake_spawn_width), self.y - cake_spawn_height, "Instances", obj_special_cake);
	}
	//if not/barely moving horizontally, spawn ontop of player
	else {
		instance_create_layer(self.x, self.y - cake_spawn_height, "Instances", obj_special_cake);
	}
	
	//reset cooldown timer
	special_cooldown_countdown = special_cooldown;
}


