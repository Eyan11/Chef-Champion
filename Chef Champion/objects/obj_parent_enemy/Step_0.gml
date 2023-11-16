// Handle slow debuff
if (isSlowed) {
    speed *= 0.5; // Example: reduce speed
    slowTimer--;
    if (slowTimer <= 0) {
        isSlowed = false;
    }
}

// Handle burning debuff
if (isBurning) {
    health -= fireDamage; // Apply fire damage
    burnTimer--;
    if (burnTimer <= 0) {
        isBurning = false;
    }
}

// Handle grease debuff
if (isInGrease) {
	speed *= 0.5;
    health -= greaseDamage; // Apply grease damage
    greaseTimer--;
    if (greaseTimer <= 0) {
        isInGrease = false;
    }
}








