/// @description Add slow effect


// Inherit the parent event
event_inherited();

//apply frosted effect
other.isFrosted = true;
if(!audio_is_playing(snd_frosting))
	audio_play_sound(snd_frosting, 8, true);
var _frosting = instance_create_layer(other.x, other.y, "Foreground_Instances", obj_frosting);
_frosting.obj_to_follow = other;
_frosting.following_enemy = true;
