// ** AI Logic for Movement and Attack **

if (state == "idle") {

    // ** Back and Forth Movement Logic **

    // If at the right boundary
    if (x >= start_x + move_distance) {
        move_direction = -1; // Change to move left
    }
    // If at the left boundary
    else if (x <= start_x - move_distance) {
        move_direction = 1; // Change to move right
    }

    // Set the horizontal speed
    hspeed = speed * move_direction;

    // Check if Marshmallow should switch to "prepareAttack" state
    if (distance_to_object(obj_player_parent) <= attack_distance && 
        attack_timer <= 0 &&
        obj_player_parent.x < x // Ensure player is behind or on the same x-coordinates
    ) {
        state = "prepareAttack"; 
        shockwave_timer = shockwave_duration;
        hspeed = 0; // Stop movement when preparing for an attack
    }
}
else if (state == "prepareAttack") {
    shockwave_timer--;
    if (shockwave_timer <= 0) {
        state = "attack";
		
        var shockwave = instance_create_layer(x, y, "Instances", obj_shockwave);
        attack_timer = attack_cooldown;
        hspeed = 0; // Stop movement during the attack
    }
}
else if (state == "attack") {
    attack_timer--;

    // Check for collision with the player during the attack
    if (instance_exists(obj_shockwave) && collision_rectangle(obj_shockwave.x - obj_shockwave.sprite_width/2, obj_shockwave.y - 
	obj_shockwave.sprite_height/2, obj_shockwave.x + 
	obj_shockwave.sprite_width/2, obj_shockwave.y + 
	obj_shockwave.sprite_height/2, obj_player_parent, false, true)) {
       // obj_player_parent.playerhealth--;  // Reduce the player's health
	   take_damage(obj_player_parent, 5)
		
    }

    if (attack_timer <= 0) {
        state = "idle";
        hspeed = speed * move_direction;
    }
}

// ** State-based Animation **

switch (state) {
    case "idle":
        sprite_index = spr_marshmallow_idle;
        break;
    case "prepareAttack":
        sprite_index = spr_marshmallow_prepareAttack;
        break;
    case "attack":
        sprite_index = spr_marshmallow_attack;
        break;
    case "death":
	
        sprite_index = spr_marshmallow_dead;
        break;
}

// ** Debuff Mechanics **

if (burn) {
    health -= 0.05;
}

if (frosted) {
    speed = 0.25; // Even slower movement due to frost
} else {
    speed = 0.5;
}

if (grease) {
    hspeed *= 0.9;
    vspeed *= 0.9;
}

