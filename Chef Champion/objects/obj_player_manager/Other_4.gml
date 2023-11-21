/// @description Load player stats

load_game();

//spawn in weapon if it's not already in the room
if(!instance_exists(obj_player_parent.inventory_weapon))
	instance_create_layer(x, y, "Instances", obj_player_parent.inventory_weapon);
