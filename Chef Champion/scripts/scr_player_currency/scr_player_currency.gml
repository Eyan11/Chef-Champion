
/// @function			get_attribute_tokens(_player)		
/// @description		Returns the players current attribute tokens	
function get_attribute_tokens(_player) {
	return _player.current_attribute_tokens;	
}


/// @function			spend_attribute_tokens(_player, _cost)
/// @description		Reduces players attribute tokens by specified cost
function spend_attribute_tokens(_player, _cost) {
	if(_player.current_attribute_tokens <= _cost)
		_player.current_attribute_tokens = 0;
	else
		_player.current_attribute_tokens -= _cost;
}


/// @function			add_attribute_tokens(_player, _amount)	
/// @description		Increases players attribute tokens by specified amount		
function add_attribute_tokens(_player, _amount) {
	_player.current_attribute_tokens += _amount;
}



/// @function			get_recipes(_player)		
/// @description		Returns the players current recipes
function get_recipes(_player) {
	return _player.current_recipes;
}


/// @function			spend_recipes(_player, _cost)		
/// @description		Reduces players recipes by specified cost
function spend_recipes(_player, _cost) {
	if(_player.current_recipes >= _cost){
		_player.current_recipes -= _cost;
		audio_play_sound(sfx_crumble,1,false)
		show_debug_message("bought")
	}
	else {
		show_debug_message("not bought")
		audio_play_sound(sfx_error,1,false)
	}
	show_debug_message("Current Recipes: ");
	show_debug_message(_player.current_recipes);
}


/// @function			add_recipes(_player, _amount)		
/// @description		Increases players recipes by specified amount
function add_recipes(_player, _amount) {
	_player.current_recipes += _amount;
	
	show_debug_message("Current Recipes: ");
	show_debug_message(_player.current_recipes);
}



/// @function			death_recipe_loss(_player)		
/// @description		Reduces players recipes by 5% of current recipes with a cap at 5
function death_recipe_loss(_player) {
	spend_recipes(_player, min(ceil(_player.current_recipes * 0.05), 5));
}
