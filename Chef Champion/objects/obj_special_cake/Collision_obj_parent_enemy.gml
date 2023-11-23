/// @description damage enemies (Once enemy parent is fully implemented)

//damage enemies once
if(is_exploding) {
	
	enemy_damage(other, damage);
	other.isSlowed = true;

	is_exploding = false;
}



