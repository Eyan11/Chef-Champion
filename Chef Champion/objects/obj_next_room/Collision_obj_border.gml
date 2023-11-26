/// @description Insert description here
// You can write your code in this editor
if (audio_is_playing(bgm_breakfast)) {
}
else if (level_count <= 4) {
	if (audio_is_playing(bgm_dinner)) {
	audio_stop_sound(bgm_dinner)	
	}
	if (audio_is_playing(bgm_dessert)) {
	audio_stop_sound(bgm_dessert)	
	}
	audio_play_sound(bgm_breakfast,1,0)
}



if (audio_is_playing(bgm_dinner)) {
}
else if(level_count <= 8 && level_count >= 5) {
	if (audio_is_playing(bgm_breakfast)) {
	audio_stop_sound(bgm_breakfast)	
	}
	if (audio_is_playing(bgm_dessert)) {
	audio_stop_sound(bgm_dessert)	
	}
	audio_play_sound(bgm_dinner,1,0)
}



if (audio_is_playing(bgm_dessert)) {
}
else if(level_count >=9 && level_count <= 12) {
	if (audio_is_playing(bgm_breakfast)) {
	audio_stop_sound(bgm_breakfast)	
	}
	if (audio_is_playing(bgm_dinner)) {
	audio_stop_sound(bgm_dinner)	
	}
	audio_play_sound(bgm_dessert,1,0)
}


show_debug_message(level_count)



