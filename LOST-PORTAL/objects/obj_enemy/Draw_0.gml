// Draw the enemy sprite
draw_self();

// -----------------------------
// Draw a small HP Bar on top of the enemy
// -----------------------------
var bar_width = 32;        // Fixed width for the HP bar
var bar_height = 4;        // Height of the HP bar
// Center the HP bar horizontally relative to the enemy's x position
var bar_x = x - (bar_width / 2);
// Place the bar slightly above the enemy's sprite. 
// This uses half the sprite's height plus a small margin (2 pixels).
var bar_y = y - sprite_get_height(sprite_index) / 2 - bar_height - 2;

// Percentage of HP remaining
var hp_percent = hp / max_hp;

// Draw a black border rectangle for the HP bar
draw_set_color(c_black);
draw_rectangle(bar_x - 1, bar_y - 1, bar_x + bar_width + 1, bar_y + bar_height + 1, false);

// Draw the green filled portion for the current HP
draw_set_color(c_green);
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * hp_percent), bar_y + bar_height, false);

// Reset draw color to white (default)
draw_set_color(c_white);
