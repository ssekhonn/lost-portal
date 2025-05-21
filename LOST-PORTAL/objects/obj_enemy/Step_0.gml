// Move horizontally
x += move_speed * direction;

// Reverse direction when at edge or colliding with a wall/edge
if (!place_meeting(x + (move_speed * direction), y, obj_ground)) {
    direction = -direction;
}


