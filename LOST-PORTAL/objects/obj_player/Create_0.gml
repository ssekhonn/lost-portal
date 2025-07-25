// obj_player: Create Event

// Movement & Physics
move_speed      = 4;
jump_speed      = -15;
gravity_force   = 0.5;
max_fall_speed  = 10;

// State Variables
move_x = 0;
move_y = 0;
is_grounded = false;
isClimbing = false;
directionFacing = 1;

// Crystal Collection Requirement
crystals_needed = 5;  // Number of crystals needed to open the door

camera = view_camera[0]; // Get the active camera
global.crystal_count = 0;

// Player Create Event
health = 5;       // Starting health (5 hearts)
max_health = 5;   // Maximum health
