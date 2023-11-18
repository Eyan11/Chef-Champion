/// @description Player Death and Respawn

var _chef;

//respawn the current_chef
if(current_chef == obj_player_pastry)
	_chef = obj_player_pastry;
else if(current_chef == obj_player_grill)
	_chef = obj_player_grill;
else if(current_chef == obj_player_fry)
	_chef = obj_player_fry;

save_game();

instance_destroy(_chef);
player_respawn(_chef);

load_game();


