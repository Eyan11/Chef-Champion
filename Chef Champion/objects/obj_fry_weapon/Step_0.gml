/// @description Insert description here
// You can write your code in this editor

self.x = obj_player_parent.x
self.y = obj_player_parent.y

if(norm_attack_input()) {
	
	if(obj_player_parent.combat_attribute_level >= 5) {
		if(obj_player_parent.current_charge < obj_player_parent.max_charge) {
			obj_player_parent.current_charge++
		}
		else {
			if(chargeSound) {
				audio_play_sound(snd_charged, 10, 0)	
				chargeSound = false
			}
		}
	}
	else {
		player_normal_attack_fry(self, obj_player_parent)	
	}
	
	
}
else if(keyboard_check_released(ord("F"))) {
	player_normal_attack_fry(self, obj_player_parent)
}

//player_normal_attack_fry(self, obj_player_parent)


