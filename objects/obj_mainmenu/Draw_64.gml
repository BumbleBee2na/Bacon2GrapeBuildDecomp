switch (state)
{
    case 0:
        draw_set_font(global.bigfont);
        draw_set_halign(fa_center);
        maynia_draw_text(obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight - 100 - 32, "/sPRESS [J]");
        break;
    
    case 1:
        draw_set_font(global.bigfont);
        draw_set_halign(fa_center);
        maynia_draw_text(obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight - 100 - 32, string("/sFILE {0}", selected + 1));
        draw_set_halign(fa_left);
        draw_set_color(c_red);
        draw_set_font(global.smallfont);
        maynia_draw_text(100, obj_screensizer.displayHeight - 100, "[T] delete file");
        break;
}

draw_set_color(c_white);
