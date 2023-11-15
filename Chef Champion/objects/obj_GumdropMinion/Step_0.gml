// Move towards the player
if (instance_exists(obj_player_parent)) {
    move_towards_point(obj_player_parent.x, obj_player_parent.y, speed);
}

// Collision check with the player
if (place_meeting(x, y, obj_player_parent)) {
    // Apply damage to the player
    take_damage(obj_player_parent, 1)
    instance_destroy(); // Destroy the minion
}




