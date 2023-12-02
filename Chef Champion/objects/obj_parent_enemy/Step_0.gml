 // Handle slow debuff
if (isSlowed) {
    current_speed *= 0.5; // Example: reduce speed
    slowTimer--;
    if (slowTimer <= 0) {
        isSlowed = false;
    }
}

// Handle burning debuff
if (isBurning) {
    current_health -= fireDamage; // Apply fire damage
    burnTimer--;
    if (burnTimer <= 0) {
        isBurning = false;
    }
}

// Handle grease debuff
if (isInGrease) {
	current_speed *= 0.5;
    current_health -= greaseDamage; // Apply grease damage
    greaseTimer--;
    if (greaseTimer <= 0) {
        isInGrease = false;
    }
}








