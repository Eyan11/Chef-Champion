event_inherited()
// ** AI Logic for Movement and Attack **

if (state == "idle"){

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
    hspeed = max_speed * move_direction;

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
		var shockwave = instance_create_layer(obj_marshmallow.x - 200, obj_marshmallow.y - 90, "Instances", obj_shockwave);
        attack_timer = attack_cooldown;
        hspeed = 0; // Stop movement during the attack
    }
}
else if (state == "attack") {
    attack_timer--;

    // Check for collision with the player during the attack
    // Assuming the shockwave appears centered around the marshmallow man
    if (instance_exists(obj_shockwave)) {
        // Define the shockwave's collision area relative to the marshmallow man
        var shockwave_left = x - obj_shockwave.sprite_width / 2;
        var shockwave_right = x + obj_shockwave.sprite_width / 2;
        var shockwave_top = y - obj_shockwave.sprite_height / 2;
        var shockwave_bottom = y + obj_shockwave.sprite_height / 2;
        
        // Check if the player is within the shockwave's collision area
        if (collision_rectangle(shockwave_left, shockwave_top, shockwave_right, shockwave_bottom, obj_player_parent, false, true)) {
            take_damage(obj_player_parent, 1);
        }
	}

    if (attack_timer <= 0) {
        state = "idle";
        hspeed = max_speed * move_direction;
    }
}

// ** State-based Animation **

switch (state) {
    case "idle":
        sprite_index = spr_marshmallow_idle;
        break;
    case "prepareAttack":
        sprite_index = spr_marshmallow_prepareAttack;
		if audio_is_playing(sfx_marshmallow){
		}
		else {
		audio_play_sound(sfx_marshmallow,5,false)
		}
		break;
    case "attack":
        sprite_index = spr_marshmallow_attack;
		
        break;
    case "death":
        sprite_index = spr_marshmallow_dead;
		if audio_is_playing(sfx_death) {
		}
		else {
		audio_play_sound(sfx_death,5,false)
		}
		break;
}



