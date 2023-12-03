 /// @description Spawn in Weapon

//spawn in weapon if it's not already in the room
if(!instance_exists(inventory_weapon))
	instance_create_layer(x, y, "Instances", inventory_weapon);

