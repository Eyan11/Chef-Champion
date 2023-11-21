/// @description damage player and despawn

//only damage enemy once
if(!has_damaged_enemy) {
	
	if(other.current_health <= damage)
		other.current_health = 0;
	else  {
		other.isSlowed = true;
		other.current_health -= damage;
	}
		
	has_damaged_enemy = true;
	
	//REMOVE: for testing
	show_debug_message("Enemy Health: ");
	show_debug_message(other.current_health);

}

