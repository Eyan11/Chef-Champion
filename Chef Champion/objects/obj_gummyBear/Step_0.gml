event_inherited();

// ** AI Logic for Movement and Attack **
if (state == "idle") {
    if (distance_to_object(obj_player_parent) <= attack_distance && attack_timer <= 0) {
        state = "hop";
        hop_timer = hop_duration;
        target_x = obj_player_parent.x;
        vertical_speed = -3;
        take_damage(obj_player_parent, 1);
    }
    else if (point_distance(x, y, target_x, target_y) < 5) {
        target_x = x + random_range(-10, 10);  // Random movement when idle
    }
}
else if (state == "hop") {
    hop_timer--;
    if (hop_timer <= 0) {
        state = "attack";
        attack_timer = attack_cooldown;
    }
}
else if (state == "attack") {
    attack_timer--;
    if (attack_timer <= 0) {
        state = "idle"; // revert back to idle after attack cooldown finishes
    }
}

// ** Movement Mechanic **
if (state == "hop") {
    y += vertical_speed;
    vertical_speed += gravity;
    if (vertical_speed > 0 && place_meeting(x, y + 1, collision_layer())) { // Check if on the ground
        state = "idle";
        vertical_speed = 0;
        y = round(y); // Snap to ground position to avoid fractional position issues
    }
} else {
    direction = point_direction(x, y, target_x, target_y);
    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);
}

// ** State-based Animation **
switch (state) {
    case "idle":
        sprite_index = spr_gummyBear_idle;
        break;
    case "hop":
        sprite_index = spr_gummyBear_hop;
        audio_play_sound(sfx_gummyBear, 5, false);
        break;
    case "attack":
        sprite_index = spr_gummyBear_attack;
        break;
    case "death":
        sprite_index = spr_gummyBear_death;
        audio_play_sound(sfx_death, 1, false);
        break;
}
