// --- Horizontal Movement & Direction Tracking
move_x = (keyboard_check(vk_right) - keyboard_check(vk_left)) * move_speed;
x += move_x;
if (keyboard_check(vk_left))  directionFacing = -1;
if (keyboard_check(vk_right)) directionFacing = 1;

// --- Climbing Check
if (place_meeting(x, y, obj_ladder)) {
    isClimbing = true;
    if (keyboard_check(vk_up)) {
        move_y = -move_speed;
    } else if (keyboard_check(vk_down)) {
        move_y = move_speed;
    } else {
        move_y = 0;
    }
    y += move_y;
    is_grounded = false;
} else {
    isClimbing = false;
    
    // --- Jump Input
    if (keyboard_check_pressed(vk_space) && is_grounded) {
        move_y = jump_speed;
        is_grounded = false;
    }
    
    // --- Gravity
    if (!is_grounded) {
        move_y += gravity_force;
        if (move_y > max_fall_speed) move_y = max_fall_speed;
    }
    
    // --- Vertical Movement
    y += move_y;
    
    // --- Landing Check on Ground (for all ground objects)
    if (move_y >= 0) {
        var floor_inst = instance_place(x, y + 2, obj_ground);
        var floor_inst10 = instance_place(x, y + 2, obj_ground10);
        var floor_inst1011 = instance_place(x, y + 2, obj_ground1011);

        // Prioritize whichever ground object is detected first
        if (floor_inst10 != noone) floor_inst = floor_inst10;
        if (floor_inst1011 != noone) floor_inst = floor_inst1011;

        if (floor_inst != noone && instance_exists(floor_inst)) {
            var off = bbox_bottom - y;
            y = floor_inst.y - off;
            move_y = 0;
            is_grounded = true;
        } else {
            is_grounded = false;
        }
    }
}

// --- Room Boundary Check
if (y < -20 || y > room_height + 20) {
    room_restart();
}

// --- Shooting Code (Bullet Creation)
if (keyboard_check_pressed(ord("Z"))) {
    var aim_angle = point_direction(x, y, mouse_x, mouse_y);
    var offset = 16;
    var bullet_x = x + lengthdir_x(offset, aim_angle);
    var bullet_y = y + lengthdir_y(offset, aim_angle);
    var bullet = instance_create_layer(bullet_x, bullet_y, "Instances", obj_bullet);
    bullet.direction = aim_angle;
    bullet.speed = 8;
}

// --- Sprite Selection (Based on action priority)
if (keyboard_check_pressed(ord("Z"))) {
    sprite_index = spr_player_shoot;
} else if (isClimbing) {
    sprite_index = spr_player_climb;
} else if (move_x != 0) {
    sprite_index = (directionFacing == 1) ? spr_player_walk_right : spr_player_walk_left;
} else {
    sprite_index = spr_player_idle;
}

// --- Camera Follow
var cam_width = camera_get_view_width(camera);
var cam_height = camera_get_view_height(camera);
camera_set_view_pos(camera, x - cam_width / 2, y - cam_height / 2);
