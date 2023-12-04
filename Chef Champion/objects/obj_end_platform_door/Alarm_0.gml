//check for what level and then complete   
	switch(room) {
	
	case Breakfast_platform_1:
	obj_player_parent.level_1_complete = true
	room_goto(kitchen_home)
	break;
	
	case Breakfast_platform_2:
	obj_player_parent.level_2_complete = true
	room_goto(kitchen_home)
	break;
	
	case Dinner_platform_3:
	obj_player_parent.level_3_complete = true
	room_goto(kitchen_home)
	break;
	
	case Dinner_platform_4:
	room_goto(boss_room_dinner)
	break;
	
	case Dessert_platform_5:
	obj_player_parent.level_5_complete = true
	room_goto(kitchen_home)
	break;
	
	case Dessert_platform_6:
	room_goto(boss_room_dessert)
	break;
	
	default:
	game_end()
	break;
	
	}
	
	self.sprite_index = spr_door;



