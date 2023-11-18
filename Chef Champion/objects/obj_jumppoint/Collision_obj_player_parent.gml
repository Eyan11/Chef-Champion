/// @description Insert description here
// You can write your code in this editor

other.vert_speed = -18;

//stop player from jumping again until they land
other.coyote_countdown = 0;

self.sprite_index = spr_jumppoint_interact;

if (audio_is_playing(sfx_squish)) {
	
}
else {
	audio_play_sound(sfx_squish,1,0,1,0);
}

alarm[0] = 60