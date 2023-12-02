event_inherited()


// Collision Logic
hspd = dir * spd;
vspd = vspd + grv;

// Horizontal Collision
if (place_meeting(x + hspd, y, collision_layer())) {
    while (!place_meeting(x + sign(hspd), y, collision_layer())) {
        x = x + sign(hspd);
    }
    dir = dir * -1; // Change direction upon collision
    hspd = 0;
}
x = x + hspd;

// Vertical Collision
if (place_meeting(x, y + vspd, collision_layer())) {
    while (!place_meeting(x, y + sign(vspd), collision_layer())) {
        y = y + sign(vspd);
    }
    vspd = 0;

    if (dont_fall && !position_meeting(x + (sprite_width / 2) * dir, y + (sprite_height / 2) + 7, collision_layer())) {
        dir = dir * -1; // Change direction upon vertical collision edge condition
    }
}
y = y + vspd;