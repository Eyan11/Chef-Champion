
/// @function					reset_health(_player);
/// @description				Sets player health to max health
function reset_health(_player){

	_player.current_health = _player.max_health;
}



/// @function					get_health(_player);
/// @description				Returns player health
function get_health(_player){
	
	return _player.current_health;
}



/// @function					take_damage(_player, _damage);
/// @description				Reduces player health (damage should be positive num)
function take_damage(_player, _damage){
	
	//don't take damage when invincible
	if(_player.is_invincible)
		return;
	
	//player is dead
	if(_damage >= _player.current_health) {
		_player.current_health = 0;
		//TODO: death and respawn
	}
	//still alive
	else
		_player.current_health -= _damage;
}



/// @function					gain_health(_player, _health_boost);
/// @description				Increases player health
function gain_health(_player, _health_boost) {
	
	//set to max health (caps health at max health)
	if((_player.current_health + _health_boost) > _player.max_health)
		reset_health(_player);
	//add health normally
	else
		_player.current_health += _health_boost;
}
