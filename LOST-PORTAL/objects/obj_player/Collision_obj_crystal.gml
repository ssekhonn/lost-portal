// Check for a collision with a crystal.
var cry = instance_place(x, y, obj_crystal);
if (cry != noone) {
    // Increase the global crystal count.
    global.crystal_count += 1;
    // Destroy the collected crystal.
    instance_destroy(cry);
}






