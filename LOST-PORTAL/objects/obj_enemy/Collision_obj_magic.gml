hp -= 1;
if (hp <= 0) {
    instance_destroy();
}
instance_destroy(other);  // Destroys the projectile (the "other" object)



