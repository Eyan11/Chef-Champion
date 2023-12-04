 /// @description Spawn in Weapon

//spawn in weapon if it's not already in the room
if(!instance_exists(inventory_weapon))
	instance_create_layer(0, 0, "Instances", inventory_weapon);

//reset health and special when going to home room
if(room == kitchen_home) {
	reset_special_meter(self);
	reset_health(self);
}
	

