if(place_meeting(self.x, self.y, obj_player_parent)){
	//buying
	if(buy_item_spend_point()) {
		if(obj_player_parent.current_attribute_tokens >= 1) {	
			obj_player_parent.current_attribute_tokens--
			obj_player_parent.survival_attribute_level++			
		}
	}
} 