//check for what level and then complete   
	switch(room) {
	
	case Breakfast_platform_1:
	obj_player_parent.level_1_complete = true
	break;
	
	case Breakfast_platform_2:
	obj_player_parent.level_2_complete = true
	break;
	
	case Dinner_platform_3:
	obj_player_parent.level_3_complete = true
	break;
	
	case Dinner_platform_4:
	obj_player_parent.level_4_complete = true
	break;
	
	case Dessert_platform_5:
	obj_player_parent.level_5_complete = true
	break;
	
	case Dessert_platform_6:
	break;
	
	default:
	game_end()
	break;
	
	}
	
	room_goto(kitchen_home)
	
	self.sprite_index = spr_door;



