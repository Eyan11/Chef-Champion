
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
	
	//if dead don't take damage or invincible (unless they have a debuff)
	if(_player.is_dead || (_player.is_invincible && !_player.is_burning && !_player.is_greased))
		return;
		
	//player is dead
	if(_damage >= _player.current_health) {
		_player.current_health = 0;
		player_death(_player);
	}
	//still alive
	else
		_player.current_health -= _damage;
		
	//REMOVE: for testing remove later
	show_debug_message("Player Health: ");
	show_debug_message(_player.current_health);
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
		
	//REMOVE: for testing remove later
	show_debug_message("Player Health: ");
	show_debug_message(_player.current_health);
}



/// @function					frosted(_player);
/// @description				Applies FROSTED effect, reduces player movement by 50% for 6 seconds
function frosted(_player) {
	
	if(!_player.is_frosted) {
		
		audio_play_sound(snd_frosting, 8, true);
		var _frosting = instance_create_layer(_player.x, _player.y, "Foreground_Instances", obj_frosting);
		_frosting.obj_to_follow = _player;
		_frosting.following_enemy = false;
	}
	
	_player.is_frosted = true;
	_player.alarm[0] = _player.frosted_time * 60; //60 steps per seconds
}

function slowed(_player) {
	_player.is_slowed = true;
	_player.alarm[6] = _player.slowed_time * 60;
}


/// @function					burn(_player);
/// @description				Applies BURN effect, take 5 damage every second, for 5 seconds (25 dmg)
function burning(_player) {
	
	//if already burning, don't disturb the timing of the burn and just reset burn counter
	if(_player.is_burning)
		_player.burn_counter = 0;
	//If not burning apply burn
	else {
		_player.is_burning = true;
		audio_play_sound(snd_fire, 5, true);
		
		//spawn fire
		var _fire = instance_create_layer(_player.x, _player.y, "Foreground_Instances", obj_fire);
		_fire.obj_to_follow = _player;
		_fire.following_enemy = false;
		
		_player.alarm[1] = 60; //60 steps per second, start first burn after 1 second
	}
}



/// @function					greased(_player);
/// @description				Applies GREASED effect, take 2t damage for t seconds you are in a grease pool
function greased(_player) {

	//if already greased, just continue damage without disturbing the timing of the damage
	if(!_player.is_greased) {
		
		_player.greased_damage_counter = 0;
		_player.greased_timer = 0;
		_player.alarm[2] = 60; //60 steps per second, start first damage after 1 second
		_player.is_greased = true;
	}
	else {
		_player.greased_timer++;
	}
	
}



function sear(_player){

	if(!_player.is_seared) {
		sear_count = 0;
		_player.alarm[3] = 60;
		_player.is_seared = true;
		
		
	}
	else
	{
		_player.sear_count++;
		
	}
}
	

function update_health_ui(_player) {
	
	//update health ui
	if(instance_exists(obj_player_pastry)) {
		_player.current_health_ui_pastry = (100 * _player.current_health) / _player.max_health
		_player.max_health_ui_pastry = 0 + _player.current_health_ui_pastry
	}
	if(instance_exists(obj_player_fry)) {
		_player.current_health_ui_fry = (100 * _player.current_health) / _player.max_health
		_player.max_health_ui_fry = 0 + _player.current_health_ui_fry
	}
	if(instance_exists(obj_player_grill)) {
		_player.current_health_ui_grill = (100 * _player.current_health) / _player.max_health
		_player.max_health_ui_grill = 0 + _player.current_health_ui_grill
	}
	
	
	
	
}
function update_special_ui(_player) {
	
	//update special ui
	if(instance_exists(obj_player_pastry)) {
		_player.current_special_ui_pastry = (100 * _player.current_special_meter) / _player.max_special_meter
		_player.max_special_ui_pastry = 0 + _player.current_special_ui_pastry
	}
	if(instance_exists(obj_player_fry)) {
		_player.current_special_ui_fry = (100 * _player.current_special_meter) / _player.max_special_meter
		_player.max_special_ui_fry = 0 + _player.current_special_ui_fry
	}
	if(instance_exists(obj_player_grill)) {
		_player.current_special_ui_grill = (100 * _player.current_special_meter) / _player.max_special_meter
		_player.max_special_ui_grill = 0 + _player.current_special_ui_grill
	}
	
}