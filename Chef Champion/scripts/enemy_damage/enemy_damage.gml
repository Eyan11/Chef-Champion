// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_damage(_enemy, _damage){
	if(_damage >= _enemy.health){
		_enemy.health = 0
	}
	
	else
	{
		_enemy.health -= _damage
	}

}

