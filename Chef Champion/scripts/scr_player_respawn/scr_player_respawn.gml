
/// @function					player_death(_player);
/// @description				Destroys player and starts respawn
function player_death(_player) {
	
	//TODO: death anim
	audio_play_sound(snd_player_death, 1, false);
	
	//reduces xp and recipes on death
	death_xp_loss(_player);
	death_recipe_loss(_player);
	
	instance_destroy(_player);
	player_respawn(_player);
}



/// @function					player_respawn(_player);
/// @description				Respawns player at last checkpoint
function player_respawn(_player) {
	
	var _chef;
	if(obj_player_manager.current_chef == 0)
		_chef = obj_player_pastry;
	
	//TODO: add all chefs
	instance_create_layer(get_checkpoint().x, get_checkpoint().y - 10, "Instances", _chef);
}



/// @function					checkpoint_save(_checkpoint);
/// @description				Sets the last checkpoint
function checkpoint_save(_checkpoint) {
	
	obj_player_manager.last_checkpoint = _checkpoint;
}



/// @function					get_checkpoint(_checkpoint);
/// @description				Returns the last checkpoint
function get_checkpoint() {
	
	return obj_player_manager.last_checkpoint;
}


