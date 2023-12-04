
	//check which room you are in and go to next room
	
	switch(room) {
		
		case Breakfast_fight_1:
		room_goto(Breakfast_platform_1)
		break;
		
		case Breakfast_fight_2:
		room_goto(Breakfast_platform_2)
		break;
		
		case Dinner_fight_3:
		room_goto(Dinner_platform_3)
		break;
		
		case Dinner_Fight_4:
		room_goto(Dinner_platform_4)
		break;
		
		case Dessert_fight_5:
		room_goto(Dessert_platform_5)
		break;
		
		case Dessert_fight_6:
		show_debug_message("going to platform now please")
		room_goto(Dessert_platform_6)
		break;
		
		default:
		show_debug_message("am i somehow defaulting")
		break;
	}
	
	self.sprite_index = spr_door;



