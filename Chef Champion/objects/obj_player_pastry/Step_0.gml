/// @description adds special attacks

// Inherit the parent event
event_inherited();

//reduce cooldown timer
cake_cooldown_countdown--;

//ground special
if(special_input() && is_grounded && !is_rolling && (current_special_meter >= cake_cost) && (cake_cooldown_countdown < 0)) {
	
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
	cake_cooldown_countdown = cake_cooldown;
}