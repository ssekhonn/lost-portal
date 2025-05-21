// Set your HUD font (make sure you’ve created fnt_HUD, or change accordingly)
draw_set_font(fnt_HUD);
draw_set_color(c_white);

// Draw crystal count (position 10,10)
draw_text(10, 10, "Crystals: " + string(global.crystalCount) + " / " + string(global.requiredCrystals));

// Draw player hearts for HP (spacing hearts vertically)
var heart_x = 10;
var heart_y = 40;
for (var i = 0; i < obj_player.hp; i++) {
    draw_sprite(spr_heart, 0, heart_x + (i * 32), heart_y);
}
