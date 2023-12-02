// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_normal_attack(_projectile_spawner, _player) {
	if(norm_attack_input() && _player.can_shoot) {
		if(_player.image_xscale < 0) {
			instance_create_layer(_player.x - 20, _player.y, "Instances", obj_shoot_animation)	
		}
		else {
			instance_create_layer(_player.x + 20, _player.y, "Instances", obj_shoot_animation)
		}
		instance_create_layer(_projectile_spawner.x,_projectile_spawner.y,"Instances", obj_temp_bullet)
		_player.can_shoot = false
		_player.alarm[4] = room_speed * .33 //3 projectiles a second
	}
}

//starts grill weapon attack, basically checks for attack cooldown
function player_normal_attack_grill_start(_melee_object, _player) {
	
	var mo = _melee_object
	var p = _player
	
	if(norm_attack_input() && _player.can_attack) {
		player_normal_attack_grill_hitbox(mo, p)
	}
	
}

//will spawn the grill weapon hitboxes
function player_normal_attack_grill_hitbox(_melee_object, _player) {
	
	//make 2 hitboxes
	if(_player.image_xscale < 0) {
		with (instance_create_layer(_player.x - 40, _player.y, "Instances", obj_grill_hitbox)) {
			image_xscale = -1
		}
	}
	else {
		instance_create_layer(_player.x + 40, _player.y, "Instances", obj_grill_hitbox)
	}
	_player.alarm[5] = room_speed * .15 //time between both hitboxes
	
	
	_player.can_attack = false
	_player.alarm[4] = room_speed * .50 // 2 swings a second
		
}

function player_normal_attack_fry(_melee_object, _player) {
	
	if(norm_attack_input() && _player.can_attack) {
		if(_player.image_xscale < 0) {
			with (instance_create_layer(_player.x - 90, _player.y, "Instances", obj_fry_hitbox)) {
				image_xscale = -2
			}
		}
		else {
			with(instance_create_layer(_player.x + 90, _player.y, "Instances", obj_fry_hitbox)) {
				image_xscale = 2
			}
		}
	
		_player.can_attack = false
		_player.alarm[4] = room_speed * .65 //little more than 1 swing a second
	}
<<<<<<< Updated upstream
=======
}

function check_crit(_player) {
	//creat range for possibility
	var probability = int64(1 / _player.crit_percent)
	//roll for crit, choosing 1 because range of random function will decrease if crit chance goes up
	if (irandom_range(1, probability) == 1) {
		return true //if random = 1, crit
	}
	else {
		return false //else no crit
	}
>>>>>>> Stashed changes
}