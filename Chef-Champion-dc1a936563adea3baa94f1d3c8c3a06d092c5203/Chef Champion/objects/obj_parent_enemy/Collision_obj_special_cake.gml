/// @description Ground Special Damage (TEMPORARY)

if(other.is_damage_frame) {
	
	if(health <= obj_player_pastry.ground_special_damage)
		health = 0;
	else
		health -= obj_player_pastry.ground_special_damage;

	other.is_damage_frame = false;
}

