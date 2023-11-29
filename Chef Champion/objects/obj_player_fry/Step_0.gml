/// @description Adds Onion Ring Special

// Inherit the parent event
event_inherited();

//Onion Ring Special
if(special_attribute_level >= 5 && special_input() && is_grounded && !is_rolling && !is_dead
	&& (current_special_meter >= onion_ring_cost) && (special_cooldown_countdown < 0)) {
	
	spend_special_meter(self, onion_ring_cost);
	var _obj;
	
	//if onion ring already exists, delete it
	if(instance_exists(obj_special_onion_ring))
		obj_special_onion_ring.alarm[0] = 1;
	
	//spawn towards direction player is facing
	_obj = instance_create_layer(self.x - (onion_ring_spawn_width * self.image_xscale), self.y - onion_ring_spawn_height, "Instances", obj_special_onion_ring);
	_obj.damage = self.onion_ring_damage;
	_obj.dir = self.image_xscale;
	_obj.image_xscale = self.image_xscale;
	
	//reset cooldown timer
	special_cooldown_countdown = special_cooldown;
}