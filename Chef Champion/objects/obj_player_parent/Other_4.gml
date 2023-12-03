 /// @description Spawn in Weapon

//spawn in weapon if it's not already in the room
if(!instance_exists(inventory_weapon))
	instance_create_layer(0, 0, "Instances", inventory_weapon);

