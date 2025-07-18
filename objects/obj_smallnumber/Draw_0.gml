if (flash)
    shader_set(shd_flash);

draw_set_font(global.smallnumberfnt);
draw_set_halign(fa_center);
draw_text(x, y, val);

if (flash)
    shader_reset();
