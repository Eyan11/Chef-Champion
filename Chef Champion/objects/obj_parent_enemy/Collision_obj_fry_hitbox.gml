/// @description Insert description here
// You can write your code in this editor

if(other.creator == obj_player_parent.id) {
	
	/*
	if(!isInvincible)
	{	
		current_health -= other.damage
	}
	*/
	
	enemy_damage(self, other.damage);
	instance_create_layer(other.x, other.y, "Instances", obj_grease_pool);
	
}


