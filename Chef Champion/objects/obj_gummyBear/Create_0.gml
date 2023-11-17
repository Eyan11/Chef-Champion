event_inherited()
// Movement and states
speed = 2;
target_x = x;
target_y = y;
state = "idle";
hop_timer = 0;
hop_duration = 30; // Time it takes for the hop to complete
gravity = 0.2;   // Controls the rate of fall
vertical_speed = 0;  // Controls the speed of the upward jump and descent


// Health
max_health = 100;
current_health = max_health

// Debuffs
burn = false;
frosted = false;
grease = false;

// Attack Variables
attack_distance = 64;
attack_cooldown = 60;
attack_timer = 0;



