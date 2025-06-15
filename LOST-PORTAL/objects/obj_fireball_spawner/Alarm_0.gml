var x_pos = random(room_width); // Generates a random X position
instance_create_layer(x_pos, 0, "Instances", obj_fireball); // Spawns fireball at the top
alarm[0] = random_range(15, 60); // Resets alarm to spawn fireballs at random intervals




