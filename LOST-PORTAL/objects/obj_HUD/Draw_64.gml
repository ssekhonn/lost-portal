// obj_HUD: Draw GUI Event

var icon_scale = 0.5;
var icon_x = 20;
var icon_y = 20;
draw_sprite_ext(spr_crystal, 0, icon_x, icon_y, icon_scale, icon_scale, 0, c_white, 1);

var icon_draw_width = sprite_get_width(spr_crystal) * icon_scale;
draw_set_font(fnt_hud);
draw_set_color(c_white);
draw_text(icon_x + icon_draw_width + 10, icon_y + 5, "x " + string(global.crystal_count));



