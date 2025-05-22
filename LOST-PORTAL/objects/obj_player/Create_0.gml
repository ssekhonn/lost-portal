/// Movement & Physics
move_speed      = 4;          // Horizontal movement speed
jump_speed      = -15;        // Jump speed (negative = upward)
gravity_force   = 0.5;        // Gravity strength
max_fall_speed  = 10;         // Maximum falling speed

/// Movement state tracking
move_x = 0;
move_y = 0;

/// Ground, jump, & climbing state
is_grounded = false;
isClimbing  = false;

/// Direction tracking (1 = right, -1 = left)
directionFacing = 1;

/// Crystal Collection Variables
crystal_count   = 0;          // Crystals collected so far
crystals_needed = 5;          // Crystals required to unlock the portal


