/// @description Insert description here
// You can write your code in this editor

<<<<<<< Updated upstream:Chef Champion/objects/obj_player_pastry/Alarm_4.gml
self.can_attack = true //player can attack again
=======
if(check_crit(obj_player_parent)) {
	current_health -= (other.damage + obj_player_parent.additional_weapon_damage) * 2
}
else {
	current_health -= (other.damage + obj_player_parent.additional_weapon_damage)
}
>>>>>>> Stashed changes:Chef Champion/objects/obj_parent_enemy/Collision_obj_temp_bullet.gml


