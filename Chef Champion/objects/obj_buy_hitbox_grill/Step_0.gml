/// @description Insert description here
// You can write your code in this editor

if(place_meeting(self.x, self.y, obj_player_parent)){
	
	//buy grill weapon
	if(buy_item_spend_point())
		buy_weapon(obj_grill_weapon, 30);

	//using equip button to equp instead of buy button
	//equip grill weapon to inventory
	if(equip_dish())
		swap_weapon(obj_grill_weapon);
		
		
	/*
	if(buy_item_spend_point() && (obj_player_parent.inventory_weapon != obj_grill_weapon)) {
		if(obj_player_parent.own_grill_weapon) {
			//switch weapons
			instance_create_layer(self.x, self.y, "Instances", obj_grill_weapon)
			instance_destroy(obj_player_parent.inventory_weapon)
			obj_player_parent.inventory_weapon = obj_grill_weapon
			
		}
		else if(obj_player_parent.current_recipes >= 30) {
			obj_player_parent.current_recipes -= 30
			obj_player_parent.own_grill_weapon = true
			//switch weapons
			instance_create_layer(self.x, self.y, "Instances", obj_grill_weapon)
			instance_destroy(obj_player_parent.inventory_weapon)
			obj_player_parent.inventory_weapon = obj_grill_weapon
		}
		
	}
	*/
	
}



