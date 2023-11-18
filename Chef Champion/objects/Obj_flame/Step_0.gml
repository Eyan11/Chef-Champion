 /// @description Insert description here
// You can write your code in this editor
time += 1

if (time = t) {
	self.sprite_index = spr_grill_flame_small;
}
else if (time = t * 2) {
	self.sprite_index = spr_grill_flame_large;
	time = 0
}

if(state == 0) {
	audio_play_sound_on(emit,sfx_flame,true,1);
	state  = 1;
}  