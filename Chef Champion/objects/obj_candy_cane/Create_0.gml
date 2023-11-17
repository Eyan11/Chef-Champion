event_inherited()
// ** Create Event for Candy Cane Enemy **

// Initial State
state = "idle"; // The initial state of the Candy Cane

// Health
max_health = 250;
current_health = max_health

// Visibility and Attack Variables
visible = false; // The Candy Cane starts off invisible
visibility_timer = irandom_range(60, 120); // Randomize initial visibility timer for variability
visibility_duration = 90; // Duration of each visibility/invisibility phase
attack_distance = 150; // Distance within which the Candy Cane will attack
attack_timer = 0; // Timer for managing the delay between attacks
attack_prep_duration = 30; // Time the Candy Cane spends preparing to attack
attack_cooldown = 120; // Cooldown time between attacks

// Movement Variables
hspeed = 2; // Horizontal speed of the Candy Cane
move_direction = 1; // Initial movement direction; 1 for right, -1 for left
start_x = x; // Remember the starting x position for boundary checking
movement_range = 100; // How far from the start_x the Candy Cane can move

// Projectile Variables
shrapnel_speed = 25; // Speed of the candy shrapnel projectiles








