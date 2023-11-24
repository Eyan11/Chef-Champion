/// @description Insert description here
// You can write your code in this editor

// Health Check
if (current_health <= 0) {
	sprite_index = spr_egg_dead
    instance_destroy();
}
