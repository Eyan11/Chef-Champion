/// @description damage player and despawn

//if enemy hasn't been damaged yet
if(ds_list_find_index(damaged_targets, other.id) == -1) {
	
	//damage enemy and add them to list
	enemy_damage(other, damage);
	ds_list_add(damaged_targets, other.id);
}

//if enemy has already been damaged, do nothing