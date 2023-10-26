// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_normal_attack(_projectile_spawner, _player) {
	if(norm_attack_input() && _player.can_shoot) {
		instance_create_layer(_projectile_spawner.x,_projectile_spawner.y,"Instances", obj_temp_bullet)
		_player.can_shoot = false
		_player.alarm[4] = room_speed * .33 //3 projectiles a second
	}
}