/// @description Adds Ground Special

// Inherit the parent event
event_inherited();

//Burger Ground Special
if(special_attribute_level >= 5 && special_input() && is_grounded && !is_rolling && !is_dead
	&& (current_special_meter >= burger_cost) && (special_cooldown_countdown < 0)) {
	
	spend_special_meter(self, burger_cost);
	var _obj;
	
	//if moving to the right, spawn to right
	if(abs(hor_move_input()) > 0 && self.image_xscale == 1) {
		_obj = instance_create_layer(self.x + burger_spawn_width, self.y - burger_spawn_height, "Instances", obj_special_burger_right);
		_obj = instance_create_layer(self.x, self.y - burger_spawn_height, "Instances", obj_special_burger_left);
	}
	//if moving to the left, spawn to left
	else if(abs(hor_move_input()) > 0 && self.image_xscale == -1) {
		_obj = instance_create_layer(self.x, self.y - burger_spawn_height, "Instances", obj_special_burger_right);
		_obj = instance_create_layer(self.x - burger_spawn_width, self.y - burger_spawn_height, "Instances", obj_special_burger_left);
	}
	//if not/barely moving horizontally, spawn ontop of player
	else {
		_obj = instance_create_layer(self.x + (burger_spawn_width/2), self.y - burger_spawn_height, "Instances", obj_special_burger_right);
		_obj = instance_create_layer(self.x - (burger_spawn_width/2), self.y - burger_spawn_height, "Instances", obj_special_burger_left);
	}
	
	//give cake damage value
	_obj.damage = self.burger_damage;
	
	//reset cooldown timer
	special_cooldown_countdown = special_cooldown;
}