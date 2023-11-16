/// @description Insert description here
// You can write your code in this editor

self.x = obj_player_pastry.x
self.y = obj_player_pastry.y

if(norm_attack_input()) {
	
	if(obj_player_pastry.combat_attribute_level >= 5) {
		if(obj_player_pastry.current_charge < obj_player_pastry.max_charge) {
			obj_player_pastry.current_charge++
		}
		else {
			if(chargeSound) {
				audio_play_sound(snd_charged, 10, 0)	
				chargeSound = false
			}
		}
	}
	else {
		player_normal_attack_grill_start(self, obj_player_pastry)	
	}
	
	
}
else if(keyboard_check_released(ord("F"))) {
	player_normal_attack_grill_start(self, obj_player_pastry)
}

//player_normal_attack_grill_start(self, obj_player_pastry)


