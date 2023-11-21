
/// @function					player_death(_player);
/// @description				Destroys player and starts respawn
function player_death(_player) {
	//leave funciton if already dead
	if(_player.is_dead)
		return;
	
	_player.is_dead = true;
	
	//reduces xp and recipes on death
	death_xp_loss(_player);
	death_recipe_loss(_player);
	//removes any dish buffs if active
	_player.alarm[7] = 1;
	_player.alarm[8] = 1;
	
	//WARNING: MAKE SURE PLAYER MANAGER OBJ IS IN ROOM
	//Alarm destroys player obj and calls respawn function
	obj_player_manager.alarm[0] = 180; //3 seconds
}



/// @function					player_respawn(_player);
/// @description				Respawns player at last checkpoint
function player_respawn(_player) {

	instance_create_layer(get_checkpoint().x, get_checkpoint().y - 10, "Instances", _player);
	
	//add weapon into room if not aready in there (when player dies with dish selected)
	if(!instance_exists(_player.inventory_weapon))
		instance_create_layer(_player.x, _player.y, "Instances", _player.inventory_weapon);
	_player.is_dead = false;
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

