// Phase control
switch (phase) {
    case 1:
        // Phase 1: Spinning with lollipop scepter
        image_angle += spin_speed;
        // Add collision check with player or attack logic here
        break;

    case 2:
        // Phase 2: Shooting candy corn projectiles
        if (alarm[0] <= 0) {
            var proj = instance_create_layer(x, y, "Instances", obj_candy_projectile);
            proj.direction = point_direction(x, y, obj_player_parent.x, obj_player_parent.y);
            proj.speed = 5; // Adjust as needed
            alarm[0] = projectile_cooldown;
        }
        // Add dive bomb logic here
        break;

    case 3:
        // Phase 3: Activating gumball shield
        // Assuming shield_timer is a variable that counts down to shield deactivation
		if (phase == 3 && shield_active) {
		    if (shield_timer <= 0) {
		        // Deactivate shield
		        with (obj_GumballShield) {
		            instance_destroy();
		        }
		        shield_active = false;
		        shield_timer = room_speed * 10; // 10 seconds until next shield activation
		    } else {
		        shield_timer -= 1;
		    }
		} else if (phase == 3 && !shield_active && shield_timer <= 0) {
		    // Activate shield
		    for (var i = 0; i < 360; i += 30) { // Adjust angle step as needed
		        var gx = lengthdir_x(50, i) + x;
		        var gy = lengthdir_y(50, i) + y;
		        instance_create_layer(gx, gy, "Instances", obj_GumballShield);
		    }
		    shield_active = true;
		    shield_timer = room_speed * 5; // Shield stays active for 5 seconds
		}

        break;
}

// Health-based phase transition
if (health <= 700) { phase = 2; } // Adjust threshold as needed
if (health <= 300) { phase = 3; } // Adjust threshold as needed

// Chase player logic
if (distance_to_object(obj_player_parent) > chase_distance) {
    // Add movement logic towards the player
}

// Summoning minions
if (alarm[1] <= 0) {
    instance_create_layer(x, y, "Instances", obj_GumdropMinion);
    alarm[1] = minion_summon_cooldown;
}
