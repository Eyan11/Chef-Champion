/// @description Jump Special Damage (TEMPORARY)

if(!other.has_damaged_enemy) {
	if(current_health <= other.damage)
		current_health = 0;
	else
		current_health -= other.damage;
		
	other.has_damaged_enemy = true;
	
	//REMOVE: for testing
	show_debug_message("Enemy Health: ");
	show_debug_message(health);
}









