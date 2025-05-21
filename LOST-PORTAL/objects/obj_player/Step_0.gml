// --- Movement: Horizontal ---
if (keyboard_check(vk_left)) {
    hsp = -move_speed;
    directionFacing = -1;
    isWalking = true;
} else if (keyboard_check(vk_right)) {
    hsp = move_speed;
    directionFacing = 1;
    isWalking = true;
} else {
    hsp = 0;
    isWalking = false;
}

// --- Jumping ---
if (keyboard_check_pressed(vk_space) && place_meeting(x, y + 1, obj_ground)) {
    vsp = jump_speed;
    isJumping = true;
}

// --- Climbing (if overlapping a ladder) ---
if (place_meeting(x, y, obj_ladder)) {
    if (keyboard_check(vk_up)) {
        vsp = -move_speed;
        isClimbing = true;
    } else if (keyboard_check(vk_down)) {
        vsp = move_speed;
        isClimbing = true;
    } else {
        // On the ladder but not moving vertically
        vsp = 0;
    }
} else {
    isClimbing = false;
}

// --- Gravity ---
if (!isClimbing) {
    vsp += gravity;
}

// --- Shooting ---
if (keyboard_check_pressed(ord("Z"))) {
    // Create the projectile a few pixels in front of the player
    instance_create_layer(x + (directionFacing * 16), y, "Instances", obj_magic);
    isShooting = true;
} else {
    isShooting = false;
}

// --- Animation Selection ---
if (isShooting) {
    sprite_index = spr_player_shoot;
} else if (isJumping) {
    sprite_index = spr_player_jump;
} else if (isWalking) {
    sprite_index = spr_player_walk;
} else if (isClimbing) {
    sprite_index = spr_player_climb;
} else {
    sprite_index = spr_player_idle;
}

// --- Move the player ---
// Horizontal movement with collision check
if (!place_meeting(x + hsp, y, obj_ground)) {
    x += hsp;
} else {
    hsp = 0;
}
// Vertical movement with collision check
if (!place_meeting(x, y + vsp, obj_ground)) {
    y += vsp;
} else {
    // When landing on ground, cancel jump state
    if (vsp > 0) isJumping = false;
    vsp = 0;
}


