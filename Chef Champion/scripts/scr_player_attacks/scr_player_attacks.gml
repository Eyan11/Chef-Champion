// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_normal_attack_pastry(_projectile_spawner, _player) {
	var isChargedAttack
	
	if(_player.current_charge >= _player.max_charge) {
		isChargedAttack = true
	}
	else {
		isChargedAttack = false
	}
	
	if(_player.can_attack) {
		if(_player.image_xscale < 0) {
			instance_create_layer(_player.x - 20, _player.y, "Instances", obj_shoot_animation)
		}
		else {
			instance_create_layer(_player.x + 20, _player.y, "Instances", obj_shoot_animation)
		}
		with(instance_create_layer(_projectile_spawner.x,_projectile_spawner.y,"Instances", obj_temp_bullet)) {
				if(isChargedAttack) {
					image_xscale = 3
					image_yscale = 3
					damage *= 2	
				}
		}
		
		//add_xp(_player, 50)
		//_player.current_xp_ui = (100 * _player.current_xp) / _player.level_up_threshold
		//_player.level_up_threshold_ui = 100 - _player.current_xp_ui
		
		_player.can_attack = false
		_player.alarm[4] = room_speed * .33 //3 projectiles a second
		_player.current_charge = 0
		_projectile_spawner.chargeSound = true
	}
}

//starts grill weapon attack, basically checks for attack cooldown
function player_normal_attack_grill_start(_melee_object, _player) {
	
	//in casxe of naming issues
	var mo = _melee_object
	var p = _player
	
	//variable to tell if an attack is charged
	var isChargedAttack
	var whichBox = 0
	
	//tracks charge time
	if(_player.current_charge >= _player.max_charge) {
		isChargedAttack = true
	}
	else {
		isChargedAttack = false
	}
	
	if(_player.can_attack) {
		player_normal_attack_grill_hitbox(mo, p, isChargedAttack, whichBox)
	}
	
}

//will spawn the grill weapon hitboxes
function player_normal_attack_grill_hitbox(_melee_object, _player, isChargedAttack, whichBox) {
	
	//make first hitbox
	if(_player.image_xscale < 0) {
		with (instance_create_layer(_player.x - 40, _player.y, "Instances", obj_grill_hitbox)) {
			image_xscale = -1
			if(isChargedAttack) {
				damage *= 2
			}
		}
	}
	else {
		with(instance_create_layer(_player.x + 40, _player.y, "Instances", obj_grill_hitbox)){
			if(isChargedAttack) {
				damage *= 2	
			}
		}
	}
	if(whichBox == 0) {
		_player.alarm[5] = room_speed * .15 //time between both hitboxes
	}
	
	if(whichBox == 1) {
		_player.can_attack = false
		_player.alarm[4] = room_speed * .50 // 2 swings a second
		_melee_object.chargeSound = true
		_player.current_charge = 0
		
	}
}

function player_normal_attack_fry(_melee_object, _player) {
	
	var isChargedAttack
	
	if(_player.current_charge >= _player.max_charge) {
		isChargedAttack = true
	}
	else {
		isChargedAttack = false
	}
	
	if(_player.can_attack) {
		if(_player.image_xscale < 0) {
			with (instance_create_layer(_player.x - 90, _player.y, "Instances", obj_fry_hitbox)) {
				image_xscale = -2
				if(isChargedAttack) {
					damage *= 2
				}
			}
		}
		else {
			with(instance_create_layer(_player.x + 90, _player.y, "Instances", obj_fry_hitbox)) {
				image_xscale = 2
				if(isChargedAttack) {
					damage *= 2
				}
			}
		}
	
		_player.can_attack = false
		_player.alarm[4] = room_speed * .65 //little more than 1 swing a second
		_player.current_charge = 0
		_melee_object.chargeSound = true
	}
}

