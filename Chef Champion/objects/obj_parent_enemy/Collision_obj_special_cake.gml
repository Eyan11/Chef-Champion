/// @description Ground Special Damage (TEMPORARY)

if(other.is_exploding) {
	
	if(current_health <= other.damage)
		current_health = 0;
	else
		current_health -= other.damage;

	other.is_exploding = false;
}

//REMOVE: for testing
show_debug_message("Enemy Health: ");
show_debug_message(current_health);
