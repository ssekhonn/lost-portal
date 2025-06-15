// Choose a random direction (left or right)
chosen_direction = choose("left", "right");

// Handle movement and sprite updates
if (chosen_direction == "left") {
    hspeed = -3;    // Move left
    sprite_index = spr_moveLeft;  // Update to "left-moving" sprite
} else if (chosen_direction == "right") {
    hspeed = 3;     // Move right
    sprite_index = spr_moveRight; // Update to "right-moving" sprite
}

// Reset the alarm for continuous movement
alarm[0] = 30;





