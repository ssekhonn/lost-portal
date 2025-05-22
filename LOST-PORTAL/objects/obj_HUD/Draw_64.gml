// Set a scale for the crystal icon so it appears small.
var icon_scale = 0.5;

// Position for the icon (adjust these values as desired).
var icon_x = 20;
var icon_y = 20;

// Draw the crystal sprite (assumed to be spr_crystal) scaled down.
draw_sprite_ext(spr_crystal, 0, icon_x, icon_y, icon_scale, icon_scale, 0, c_white, 1);

// Calculate the drawn width of the crystal icon.
var icon_draw_width = sprite_get_width(spr_crystal) * icon_scale;

// Draw the crystal count text next to the icon.
draw_set_font(fnt_hud);  // Optional: set a font (fnt_hud) if you have one.
draw_set_color(c_white);
draw_text(icon_x + icon_draw_width + 10, icon_y + 5, "x " + string(global.crystal_count));




