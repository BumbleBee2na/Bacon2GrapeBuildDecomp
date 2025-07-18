if (!instance_exists(obj_titlecards))
{
    var xx = obj_screensizer.displayWidth - 229;
    var yy = obj_screensizer.displayHeight - 190;
    draw_sprite(sprite_index, image_index, xx, yy);
    draw_set_font(global.moneyfont);
    draw_set_halign(fa_center);
    draw_text(xx + 114.5, (yy + 95) - 10, string("{0}$", global.money));
}
