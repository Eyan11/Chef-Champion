/// @description Player Death and Respawn

save_game();

instance_destroy(current_chef);
player_respawn(current_chef);

load_game();


