if (instance_exists(obj_player)) {
    // Determine the angle from this enemy to the player
    var target_angle = point_direction(x, y, obj_player.x, obj_player.y);
    
    // Move toward the player using the enemy's move_speed
    x += lengthdir_x(move_speed, target_angle);
    y += lengthdir_y(move_speed, target_angle);
}
