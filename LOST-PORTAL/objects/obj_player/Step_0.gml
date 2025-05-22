/// ==================================================
/// 1. Horizontal Movement & Direction Tracking
/// ==================================================
move_x = (keyboard_check(vk_right) - keyboard_check(vk_left)) * move_speed;
x += move_x;
if (keyboard_check(vk_left))  directionFacing = -1;
if (keyboard_check(vk_right)) directionFacing = 1;


/// ==================================================
/// 2. Climbing Check
/// ==================================================
/// If the player is overlapping a ladder, enable climbing.
/// When climbing, vertical movement is controlled by the up/down keys
/// and gravity is not applied.
if (instance_place(x, y, obj_ladder) != noone) {
    isClimbing = true;
    
    // Vertical movement on ladder:
    if (keyboard_check(vk_up)) {
        move_y = -move_speed;
    } else if (keyboard_check(vk_down)) {
        move_y = move_speed;
    } else {
        move_y = 0;
    }
    y += move_y;
    
    // While climbing, consider the player not grounded.
    is_grounded = false;
}
else {
    isClimbing = false;
    
    /// ==================================================
    /// 3. Jump Input (Only if not climbing)
    /// ==================================================
    if (keyboard_check_pressed(vk_space) && is_grounded) {
        move_y = jump_speed;
        is_grounded = false;  // The player is now airborne.
    }
    
    /// ==================================================
    /// 4. Gravity
    /// ==================================================
    if (!is_grounded) {
        move_y += gravity_force;
        if (move_y > max_fall_speed)
            move_y = max_fall_speed;
    }
    
    /// ==================================================
    /// 5. Vertical Movement
    /// ==================================================
    y += move_y;
    
    /// ==================================================
    /// 6. Landing Check on Ground
    /// ==================================================
    /// If the player is falling (move_y >= 0), we try to detect
    /// whether they’ve landed on an instance of obj_ground.
    if (move_y >= 0) {
        var floor_inst = instance_place(x, y + 2, obj_ground);
        if (floor_inst != noone) {
            // Snap to the floor. We use the offset (bbox_bottom - y)
            // so that the player's bottom aligns exactly with the floor.
            var off = bbox_bottom - y;
            y = floor_inst.y - off;
            move_y = 0;
            is_grounded = true;
        }
        else {
            is_grounded = false;
        }
    }
}


// ==================================================
/// 7. Room Boundary Check
/// ==================================================
/// Restart the room if the player goes off-screen vertically.
if (y < -20 || y > room_height + 20) {
    room_restart();
}


// --- Shooting (Bullet Creation with Mouse Aiming) ---
if (keyboard_check_pressed(ord("Z"))) {
    // Calculate the angle from the player's (x,y) to the mouse cursor
    var aim_angle = point_direction(x, y, mouse_x, mouse_y);
    
    // Define an offset so the bullet spawns a bit away from the player
    var offset = 16;
    var bullet_x = x + lengthdir_x(offset, aim_angle);
    var bullet_y = y + lengthdir_y(offset, aim_angle);
    
    // Create the bullet instance at the calculated position
    var bullet = instance_create_layer(bullet_x, bullet_y, "Instances", obj_bullet);
    
    // Set the bullet's travel direction and speed
    bullet.direction = aim_angle;
    bullet.speed = 8;
}


// ==================================================
/// 9. Crystal Collection
/// ==================================================
/// If the player touches a crystal, increase the count and destroy the crystal.
var cry = instance_place(x, y, obj_crystal);
if (cry != noone) {
    crystal_count += 1;
    instance_destroy(cry);
}





// ==================================================
/// 11. Sprite Selection
/// ==================================================
/// Set the sprite based on the current action.
/// Priority: Shooting > Jumping > Climbing > Walking > Idle
if (keyboard_check_pressed(ord("Z"))) {
    sprite_index = spr_player_shoot;
}
else if (!is_grounded && !isClimbing) {
    sprite_index = spr_player_jump;
}
else if (isClimbing) {
    sprite_index = spr_player_climb;
}
else if (move_x != 0) {
    sprite_index = (directionFacing == 1) ? spr_player_walk_right : spr_player_walk_left;
}
else {
    sprite_index = spr_player_idle;
}
