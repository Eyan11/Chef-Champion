/// @description Insert description here
// You can write your code in this editor

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
    dir = dir * -1;
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
        dir = dir * -1;
    }
}
y = y + vspd;

// Finding the nearest player
var player = instance_nearest(x, y, obj_player_parent); // Replace 'obj_player_parent' with your player object
var playerDistance = point_distance(x, y, player.x, player.y);

// Determine player's relative horizontal position
if (player.x < x) {
    facingDirection = -1; // Player is to the left
} else {
    facingDirection = 1; // Player is to the right
}

// Flip sprite based on facing direction
if (facingDirection != 0) {
    image_xscale = facingDirection;
}

// Attack Logic
if (timeSinceLastAttack <= 0 && playerDistance < attackRange) {
    isAttacking = true; // Set attacking state
	audio_play_sound(sfx_pancake, 5, false)
    hspd = 0; // Stop horizontal movement
    vspd = 0; // Stop vertical movement
    sprite_index = spr_pancake_attack; // Attack sprite
    image_xscale = facingDirection; // Face towards the player

    if (place_meeting(x, y, obj_player_parent)) {
        take_damage(obj_player_parent, damage);
        timeSinceLastAttack = attackCooldown; // Reset attack timer
    }
} else if (playerDistance >= attackRange && isAttacking) {
    isAttacking = false; // Reset attacking state
}

// Resetting Movement and Sprite
if (!isAttacking) {
    sprite_index = spr_pancake_walk; // Normal sprite
    image_xscale = facingDirection; // Continue to face towards the player
}
if (timeSinceLastAttack <= 0 && playerDistance < attackRange) {
    isAttacking = true; // Set attacking state
    hspd = 0; // Stop horizontal movement
    vspd = 0; // Stop vertical movement
    sprite_index = spr_pancake_attack; // Attack sprite

    if (place_meeting(x, y, obj_player_parent)) {
        // Apply damage to the player
        // Assuming you have a function like 'take_damage' for the player
        take_damage(obj_player_parent, damage);
        timeSinceLastAttack = attackCooldown; // Reset attack timer
    }
} else if (playerDistance >= attackRange && isAttacking) {
    isAttacking = false; // Reset attacking state
}

// Resetting Movement and Sprite
if (!isAttacking) {
    // Reset to normal sprite and movement behavior
    sprite_index = spr_pancake_walk; // Normal sprite
}

