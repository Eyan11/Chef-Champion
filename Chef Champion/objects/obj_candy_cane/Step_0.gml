 event_inherited()
// ** Step Event for Candy Cane Enemy **


var certified_range = 100; // adjust this value as needed

// Horizontal Movement Logic
if (state != "attack") {
    x += max_speed * move_direction;
    // Check boundaries within the certified range and reverse direction if necessary
    if (x < start_x - certified_range) {
        x = start_x - certified_range;
        move_direction = 1; // Move right
    } else if (x > start_x + certified_range) {
        x = start_x + certified_range;
        move_direction = -1; // Move left
    }
}

// Shorten the player detection range
var shortened_attack_distance = 50; // adjust this value as needed

// Check for attack opportunity and manage visibility
if (distance_to_object(obj_player_parent) <= shortened_attack_distance) {
    visible = true;
    state = "attackPrep";
    attack_timer = attack_prep_duration;
} else {
    // Visibility Logic when player is not in range
    visibility_timer--;
    if (visibility_timer <= 0) {
        visible = !visible; // Toggle visibility
        visibility_timer = visibility_duration; // Reset timer
    }
}


// Idle and Attack Logic
if (visible) {
    switch (state) {
        case "idle":
            // Idle logic is handled above
            break;

        case "attackPrep":
		if audio_is_playing(sfx_candyCane) {
		}
		else {
		audio_play_sound(sfx_candyCane,10,false)
		}
            attack_timer--;
            if (attack_timer <= 0) {
                state = "attack";
                // Launch 3 shrapnel projectiles towards the player
                for (var i = 0; i < 3; i++) {
                    var projectile = instance_create_layer(x, y, "Instances", obj_candy_shrapnel);
                    projectile.direction = point_direction(x, y, obj_player_parent.x, obj_player_parent.y);
                    projectile.speed = shrapnel_speed;
                }
                attack_timer = attack_cooldown;
            }
            break;

        case "attack":
            attack_timer--;
            if (attack_timer <= 0) {
                state = "idle"; // Return to idle after attacking
            }
            // Check each shrapnel instance to see if it hits the player
            with (obj_candy_shrapnel) {
                if (distance_to_object(obj_player_parent) < collision_threshold) { // collision_threshold is the distance at which we consider the shrapnel to have hit the player
                    take_damage(obj_player_parent,sharpnel_damage)
                    //instance_destroy(obj); // Destroy the shrapnel after it hits
                }
            }
            break;
    }
} else {
    // Logic for when the enemy is invisible and not attacking
    // Typically, the enemy cannot attack or be attacked when invisible
}

// Animation State Switch
switch (state) {
    case "idle":
        sprite_index = visible ? spr_candy_cane_idle : spr_candy_cane_invisible;
        break;
    case "attackPrep":
        sprite_index = visible ? spr_candy_cane_attackPrep : spr_candy_cane_invisible;
        break;
    case "attack":
        sprite_index = visible ? spr_candy_cane_attack : spr_candy_cane_invisible;
        break;
}






