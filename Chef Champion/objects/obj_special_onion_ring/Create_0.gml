/// @description Create List, Spawn Grease, and Check if Spawned In Wall

damaged_targets = ds_list_create();

alarm[1] = grease_spawn_interval * 60;

//checks if the bottom of the onion ring spawned in wall
if(place_meeting(x, y + vert_speed, special_attack_collision_layer())) {
	bottom_in_wall = true;
	show_debug_message("Bottom Spawned in Wall");
}

//checks if the side (side its moving) of the onion ring spawned in wall
if(place_meeting(x + (hor_speed * dir), y, special_attack_collision_layer()))
	side_in_wall = true;
