// Follow the Candy Queen
if (instance_exists(follow_object)) {
    x = follow_object.x + x_offset;
    y = follow_object.y + y_offset;
}

// Rotate around Candy Queen
var angle_step = 5; // Speed of rotation
x_offset = lengthdir_x(50, direction);
y_offset = lengthdir_y(50, direction);
direction += angle_step;




