/// @description Player Death and Respawn

save_game();

instance_destroy(current_chef);
player_respawn(current_chef);

load_game();

//player is invincible for 5 seconds when respawning
current_chef.is_invincible = true;
current_chef.alarm[9] = 5 * 60;

