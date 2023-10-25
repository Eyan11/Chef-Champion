// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_normal_attack(_projectile_spawner) {
	if(norm_attack_input()) {
		instance_create_layer(_projectile_spawner.x,_projectile_spawner.y,"Instances", obj_temp_bullet)
	}
}