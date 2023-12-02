/// @description Damage Enemies

//damage enemies once
if(is_exploding) {
	
	enemy_damage(other, damage);
	
	//apply frosted effect
	other.isSlowed = true;
	if(!audio_is_playing(snd_frosting))
		audio_play_sound(snd_frosting, 8, true);
	var _frosting = instance_create_layer(other.x, other.y, "Foreground_Instances", obj_frosting);
	_frosting.obj_to_follow = other;
	_frosting.following_enemy = true;

	//add xp when doing damage
	add_xp(obj_player_parent, damage);
	is_exploding = false;
}



