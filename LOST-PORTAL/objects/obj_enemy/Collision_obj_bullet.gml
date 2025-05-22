// Decrease health by 1 when hit by a bullet
hp -= 1;

// Destroy the bullet instance (the colliding bullet is referenced by "other")
instance_destroy(other);

// If HP is 0 or less, destroy the enemy instance
if (hp <= 0) {
    instance_destroy();
}
