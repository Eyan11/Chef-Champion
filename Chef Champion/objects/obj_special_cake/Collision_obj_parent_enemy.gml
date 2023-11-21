/// @description damage enemies (Once enemy parent is fully implemented)

//Will use this code once enemy health is working

if(is_exploding) {
	
	if(other.current_health <= damage)
		other.current_health = 0;
	else {
		other.isSlowed = true;
		other.current_health -= damage;
	}

	is_exploding = false;
	
	//REMOVE: for testing
	show_debug_message("Enemy Health: ");
	show_debug_message(other.current_health);
}



