// Step Event
timeSinceLastAttack--;

// Collision Logic
hspd = dir * spd;
vspd = vspd + grv;

// Horizontal Collision
if (place_meeting(x + hspd, y, collision_layer())) {
    while (!place_meeting(x + sign(hspd), y, collision_layer())) {
        x = x + sign(hspd);
    }
    dir = dir * -1; // Change direction upon collision
    hspd = 0;
}
x = x + hspd;

// Vertical Collision
if (place_meeting(x, y + vspd, collision_layer())) {
    while (!place_meeting(x, y + sign(vspd), collision_layer())) {
        y = y + sign(vspd);
    }
    vspd = 0;

    if (dont_fall && !position_meeting(x + (sprite_width / 2) * dir, y + (sprite_height / 2) + 7, collision_layer())) {
        dir = dir * -1; // Change direction upon vertical collision edge condition
    }
}
y = y + vspd;

// Finding the nearest player
var player = instance_nearest(x, y, obj_player_parent);
var playerDistance = point_distance(x, y, player.x, player.y);


// Update sprite facing based on direction and buffer zone logic
if (!isAttacking) {
    image_xscale = dir;
}

// Attack Logic
if (timeSinceLastAttack <= 0 && playerDistance < attackRange) {
    isAttacking = true;
    hspd = 0;
    vspd = 0;
    sprite_index = spr_egg_attack;
    image_xscale = (player.x < x) ? -1 : 1; // Correctly face towards the player while attacking

    if (playerDistance < attackRange) {
		if audio_is_playing(sfx_candyCane){
		}
		else {
		audio_play_sound(sfx_candyCane,5,false)
		}
        take_damage(obj_player_parent, damage);
        timeSinceLastAttack = attackCooldown;
    }
} else if (playerDistance >= attackRange && isAttacking) {
    isAttacking = false;
}

// Resetting Movement and Sprite
if (!isAttacking) {
    sprite_index = spr_egg_walk;
    image_xscale = dir; // Ensure sprite direction is reset after attack phase
}
