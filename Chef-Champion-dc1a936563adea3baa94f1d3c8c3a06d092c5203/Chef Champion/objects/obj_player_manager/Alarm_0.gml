/// @description Player Death and Respawn

var _chef;
if(current_chef == 0)
	_chef = obj_player_pastry;

save_game();

instance_destroy(_chef);
player_respawn(_chef);

load_game();


