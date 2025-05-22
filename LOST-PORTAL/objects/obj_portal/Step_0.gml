// Look for the player instance nearby
var player = instance_nearest(x, y, obj_player);

// If the player exists and has enough crystals, open the door.
if (player != noone && player.crystal_count >= player.crystals_needed) {
    isOpen = true;
} else {
    isOpen = false;
}

// Update the door's appearance based on state.
if (isOpen) {
    sprite_index = spr_door_open;   // Show the open door sprite
} else {
    sprite_index = spr_door_closed; // Show the closed door sprite
}

