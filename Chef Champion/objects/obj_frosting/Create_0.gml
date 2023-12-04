/// @description Play frosted sound

if(!audio_is_playing(snd_frosting))
	audio_play_sound(snd_frosting, 5, true);	
	
//reduce enemy speed
if(following_enemy) {
	//obj_to_follow.spd = max_speed/2;
}
