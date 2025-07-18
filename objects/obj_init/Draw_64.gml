draw_sprite(spr_logo, 0, (obj_screensizer.displayWidth / 2) + irandom_range(-1, 1), (obj_screensizer.displayHeight / 2) + irandom_range(-1, 1));

if (global.isplaytester == false)
{
    draw_set_font(global.bigfont);
    draw_set_halign(fa_center);
    maynia_draw_text(obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight - 100 - 32, "[J] START ENGLISH");
    maynia_draw_text(obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight - 100, "[T] START PORTUGUESE");
    maynia_draw_text(obj_screensizer.displayWidth / 2, (obj_screensizer.displayHeight - 100) + 32, "[G] START SPANISH");
}
else
{
    draw_text_scribble(obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight - 100 - 32, "[spr_creditsfont][fa_center][c_red][shake] You are playing a LEAKED build of Bacon2 :(\nPlease turn off the game now...");
}
