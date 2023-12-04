//check for what level and then complete   
	switch(room) {
	
	case boss_room_dessert:
	room_goto(kitchen_home)
	break;
	
	case boss_room_dinner:
	room_goto(kitchen_home)
	obj_player_parent.level_4_complete = true
	break;
	
	
	
	default:
	game_end()
	break;
	
	}
	
	self.sprite_index = spr_door;



