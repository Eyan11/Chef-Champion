<<<<<<< Updated upstream

	//check which room you are in and go to next room
	
	switch(room) {
		
		case Boss_room_dessert:
		obj_player_parent.level_6_complete = true
		room_goto(kitchen_home)
		break;
		
		case Boss_room_dinner:
		obj_player_parent.level_4_complete = true
		room_goto(kitchen_home)
		break;
		
		default:
		show_debug_message("am i somehow defaulting")
		break;
	}
	
=======
//check for what level and then complete   
	switch(room) {
	
	case Boss_room_dinner:
	obj_player_parent.level_4_complete = true
	
	break;
	
	case Boss_room_dessert:
	break;
	
	
	default:
	game_end()
	break;
	
	}
	
	room_goto(kitchen_home)
>>>>>>> Stashed changes
	self.sprite_index = spr_door;



