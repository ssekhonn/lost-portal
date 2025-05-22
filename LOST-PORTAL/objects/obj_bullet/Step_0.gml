// Decrease lifetime each step
lifetime -= 1;

// Destroy the bullet if its lifetime expires
if (lifetime <= 0) {
    instance_destroy();
}

// Optionally, destroy the bullet if it goes off-screen
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}
