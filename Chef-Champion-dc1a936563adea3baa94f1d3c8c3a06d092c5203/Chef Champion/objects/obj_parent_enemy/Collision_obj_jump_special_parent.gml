/// @description Jump Special Damage (TEMPORARY)



if(health <= obj_player_pastry.jump_special_damage)
	health = 0;
else
	health -= obj_player_pastry.jump_special_damage;

show_debug_message("Enemy Health: ");
show_debug_message(health);

instance_destroy(other);





