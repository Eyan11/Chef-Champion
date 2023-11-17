event_inherited()
// ** AI Logic for Movement and Attack **
if (state == "idle") {
    if (distance_to_object(obj_player_parent) <= attack_distance && attack_timer <= 0) {
        state = "hop";
        hop_timer = hop_duration;
        target_x = obj_player_parent.x;
        vertical_speed = -5;
        
        // Attack the player when conditions are met
        //obj_player.playerhealth--; // Assuming 1 is the amount of damage inflicted
		take_damage(obj_player_parent, 1);
    }
	else if (point_distance(x, y, target_x, target_y) < 5) {
        target_x = x + random_range(-100, 100);  // Random movement when idle
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
    attack_timer--; // Decrement attack timer continuously in attack state
    if (attack_timer <= 0) {
        state = "idle"; // revert back to idle after attack cooldown finishes
    }
}

// ** Movement Mechanic **
if (state == "hop") {
    y += vertical_speed;
    vertical_speed += gravity;
    // Check if Gummy Bear is back on the ground
    if (vertical_speed > 0 && point_distance(x, y, target_x, target_y) < 5) {
        state = "idle";
        vertical_speed = 0;
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
        break;
    case "attack":
        sprite_index = spr_gummyBear_attack;
        break;
    case "death":
        sprite_index = spr_gummyBear_death;
        break;
}


// ** Debuff Mechanics **
if (burn) {
    health -= 0.05; 
}

if (frosted) {
    speed = 0.5;
} else {
    speed = 2;
}

if (grease) {
    hspeed *= 0.9;
    vspeed *= 0.9;
}


