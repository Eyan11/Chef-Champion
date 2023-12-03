if(place_meeting(self.x, self.y, obj_player_parent)){
	//buying
	if(buy_item_spend_point()) {
		
		combat_attribute_upgrade(obj_player_parent);
		
		/*
		if(obj_player_parent.current_attribute_tokens >= 1) {	
			obj_player_parent.current_attribute_tokens--
			obj_player_parent.combat_attribute_level++			
		}
		*/
	}
} 