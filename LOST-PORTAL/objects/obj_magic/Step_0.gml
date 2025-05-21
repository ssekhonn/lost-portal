// Move by built-in speed and direction for projectiles
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Destroy the projectile if off‑screen
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

// Check for collision with enemy (using place_meeting within step event for simplicity)
if (place_meeting(x, y, obj_enemy)) {
    var enemy = instance_place(x, y, obj_enemy);
    if (enemy != noone) {
        enemy.hp -= 1; // Reduce enemy HP by 1
        if (enemy.hp <= 0) {
            instance_destroy(enemy);
        }
        instance_destroy(); // Destroy projectile on hit
    }
}
