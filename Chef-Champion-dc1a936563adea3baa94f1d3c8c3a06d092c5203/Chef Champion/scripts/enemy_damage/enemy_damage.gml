// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_damage(_enemy, _damage){
	if(_damage >= _enemy.current_health){
		_enemy.current_health = 0
		show_debug_message("Current Enemy Health: ");
		show_debug_message(_enemy.current_health);
	}
	
	else
	{
		_enemy.current_health -= _damage
		show_debug_message("Current Enemy Health: ");
		show_debug_message(_enemy.current_health);
	}

}

