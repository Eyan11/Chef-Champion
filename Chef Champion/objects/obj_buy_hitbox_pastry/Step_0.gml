/// @description Insert description here
// You can write your code in this editor

if(place_meeting(self.x, self.y, obj_player_parent)){
	
	if(buy_item_spend_point() && (obj_player_parent.inventory_weapon != obj_pastry_weapon)) {
		if(obj_player_parent.own_pastry_weapon) {
			//switch weapons
			instance_create_layer(self.x, self.y, "Instances", obj_pastry_weapon)
			instance_destroy(obj_player_parent.inventory_weapon)
			obj_player_parent.inventory_weapon = obj_pastry_weapon
			
		}
		else if(obj_player_parent.current_recipes >= 30) {
			obj_player_parent.current_recipes -= 30
			obj_player_parent.own_pastry_weapon = true
			//switch weapons
			instance_create_layer(self.x, self.y, "Instances", obj_pastry_weapon)
			instance_destroy(obj_player_parent.inventory_weapon)
			obj_player_parent.inventory_weapon = obj_pastry_weapon
		}
		
	}
	
}



