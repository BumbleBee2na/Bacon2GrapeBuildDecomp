if (!fadein)
{
    draw_sprite(spr_titlecards, index, 0, 0);
    draw_sprite(spr_titlecards, index + 1, 0 + irandom_range(-1, 1), 0 + irandom_range(-1, 1));
}

draw_set_alpha(fadeAlpha);
draw_set_color(c_black);
draw_rectangle(0, 0, obj_screensizer.displayWidth, obj_screensizer.displayHeight, false);
draw_set_color(c_white);
draw_set_alpha(1);
