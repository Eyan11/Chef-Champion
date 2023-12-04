/// @description Insert description here
// You can write your code in this editor

if(place_meeting(self.x, self.y, obj_player_parent)){
	
	//buying
	if(buy_item_spend_point()) {
		
		buy_dish(obj_damage_dish, 5);
		/*
		if(obj_player_parent.current_recipes >= 5) {	
			obj_player_parent.current_recipes -= 5
			obj_player_parent.total_damage_dishes++			
		}
		*/
	}
	
	if(equip_dish()) {
		swap_dish(obj_damage_dish);
		obj_player_parent.inventory_dish = obj_damage_dish
		obj_player_parent.inventory_dish = obj_damage_dish
	}
	
}



       