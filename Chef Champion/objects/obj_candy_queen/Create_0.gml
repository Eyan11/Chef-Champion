// Initialization
health = 2000; // Adjust as needed
phase = 1;
spin_speed = 5; // Rotation speed for phase 1
projectile_cooldown = 120; // Frames between candy corn shots
minion_summon_cooldown = 300; // Frames between summoning minions
chase_distance = 200; // When to start chasing the player
shield_active = false;
// Initialize shield timer
shield_timer = room_speed * 10; // Start with a delay before the first shield activation
