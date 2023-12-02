/// @description Damage Enemy

//damage enemies once
if(is_exploding) {
	
	enemy_damage(other, damage);
	//other.isBurning = true;
	//var _fire = instance_create_layer(other.x, other.y, "Foreground_Instances", obj_fire);
	//_fire.obj_to_follow = other;
	//_fire.following_enemy = true;

	//add xp when doing damage
	add_xp(obj_player_parent, damage);
	is_exploding = false;
}




