/// @description Debugging for now


/*
if(keyboard_check_pressed((ord("T"))))
	frosted(obj_player_parent);

if(keyboard_check_pressed((ord("Y"))))
	buy_dish(obj_health_dish, 1);
if(keyboard_check_pressed((ord("U"))))
	buy_dish(obj_speed_dish, 1);
*/

current_chef = global.current_chef;

show_debug_message(object_get_name(current_chef));
