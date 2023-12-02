/// @description Insert description here
// You can write your code in this editor

<<<<<<< Updated upstream:Chef Champion/objects/obj_marshmallow/Collision_obj_fry_hitbox.gml
if(other.creator == obj_player_pastry.id) {
	health--
=======
if(other.creator == obj_player_parent.id) {
	if(check_crit(obj_player_parent)) {
		current_health -= (other.damage + obj_player_parent.additional_weapon_damage) * 2
	}
	else {
		current_health -= (other.damage + obj_player_parent.additional_weapon_damage)
	}
	
>>>>>>> Stashed changes:Chef Champion/objects/obj_parent_enemy/Collision_obj_fry_hitbox.gml
	//take damage script can replace above if needed
	//burn script
}


