event_inherited()
/// @description Insert description here
// You can write your code in this editor

dir = 1
spd = 4
grv = 0.3
vspd = 0
hspd = 0;
dont_fall = true

current_speed = spd


max_health = 50
current_health = max_health


// Initialize attack variables

is_attacking = false; // State of the enemy's attack
damage = 10; // Damage dealt to the player

// Create Event for Pancake Enemy
attackRange = 100; // Range within which the enemy will attack
timeSinceLastAttack = 0; // Timer for managing attacks
attackCooldown = 60; // Cooldown time between attacks in frames
isAttacking = false; // State of the enemy's attack
facingDirection = 1


gummyBearDead = false
dropChance = irandom(2);