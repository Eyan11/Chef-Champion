/// @description Start Falling Noise

audio_play_sound(snd_cake_fall, 5, false);

//checks if cake spawned in wall
if(place_meeting(x, y + fall_speed, special_attack_collision_layer()))
	spawned_in_wall = true;
	