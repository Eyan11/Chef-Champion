  /// @description Player Death and Respawn

//despawn any weapons
if(instance_exists(obj_pastry_weapon))
	instance_destroy(obj_pastry_weapon);
	
if(instance_exists(obj_fry_weapon))
	instance_destroy(obj_fry_weapon);
	
if(instance_exists(obj_grill_weapon))
	instance_destroy(obj_grill_weapon);


save_game();

//despawn and respawn player
instance_destroy(current_chef);
player_respawn(current_chef);

load_game();

//player is invincible for 5 seconds when respawning
current_chef.is_invincible = true;
current_chef.alarm[9] = 5 * 60;

