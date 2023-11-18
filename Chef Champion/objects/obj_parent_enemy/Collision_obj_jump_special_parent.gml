/// @description Jump Special Damage (TEMPORARY)

if(!other.has_damaged_enemy) {
	if(health <= other.damage)
		health = 0;
	else
		health -= other.damage;
		
	other.has_damaged_enemy = true;
	
	//REMOVE: for testing
	show_debug_message("Enemy Health: ");
	show_debug_message(health);
}









