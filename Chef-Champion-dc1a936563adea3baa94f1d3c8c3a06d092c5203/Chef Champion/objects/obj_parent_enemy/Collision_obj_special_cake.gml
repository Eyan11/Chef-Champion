/// @description Ground Special Damage (TEMPORARY)

if(other.is_exploding) {
	
	if(health <= other.damage)
		health = 0;
	else
		health -= other.damage;

	other.is_exploding = false;
}

//REMOVE: for testing
show_debug_message("Enemy Health: ");
show_debug_message(health);
