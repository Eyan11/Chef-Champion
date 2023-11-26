/// @description Add slow effect


// Inherit the parent event
event_inherited();

//apply frosted effect
other.isSlowed = true;
audio_play_sound(snd_frosting, 8, true);
var _frosting = instance_create_layer(other.x, other.y, "Instances", obj_frosting);
_frosting.obj_to_follow = other;
_frosting.following_enemy = true;
