/// @description damage player and despawn

//only damage enemy once
if(!has_damaged_enemy) {

	enemy_damage(other, damage);	
	has_damaged_enemy = true;
}

