// Set speed (the direction will be determined from the player)
speed = 8;

// Determine direction based on player's facing
// (Assumes player exists near creation; adjust if necessary)
var pl = instance_nearest(x, y, obj_player);
if (pl.directionFacing == 1) {
    direction = 0;   // right
} else {
    direction = 180; // left
}
image_angle = direction;

