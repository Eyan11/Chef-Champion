/// @description damage player and despawn

//if enemy hasn't been damaged yet, and is not despawning
if(ds_list_find_index(damaged_targets, other.id) == -1 && sprite_index != spr_onion_ring_despawn) {
	
	//damage enemy and add them to list
	enemy_damage(other, damage);
	ds_list_add(damaged_targets, other.id);
	
	//add xp when doing damage
	add_xp(obj_player_parent, damage);
}

//if enemy has already been damaged, do nothing