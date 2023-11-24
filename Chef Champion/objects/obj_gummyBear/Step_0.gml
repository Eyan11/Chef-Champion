 //collision Logic
//TODO

 // ** AI Logic for Movement and Attack **
if (state == "idle") {
    if (distance_to_object(obj_player_parent) <= attack_distance && attack_timer <= 0) {
        state = "hop";
        hop_timer = hop_duration;
        target_x = obj_player_parent.x;
        vertical_speed = -5;
        
        // Attack the player when conditions are met
        //obj_player.playerhealth -= 20; // Assuming 20 is the amount of damage inflicted
		take_damage(obj_player_parent, 20);
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
    x += lengthdir_x(max_speed, direction);
    y += lengthdir_y(max_speed, direction);
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



