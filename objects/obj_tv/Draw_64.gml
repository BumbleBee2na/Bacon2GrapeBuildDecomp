if (!global.hide_hud)
{
    draw_sprite(spr_combometer, 1, comboX, (comboY - 25) + teapos);
    draw_sprite(spr_combometer, 2, comboX, (comboY - 25) + teapos);
    draw_sprite(spr_combometer, 0, comboX, comboY);
    draw_text_scribble(comboX - 19, comboY + 53, string("[fa_left][spr_combofont]{0}", global.combo));
    var xx = 823;
    var yy = 75;
    bg_surf = check_surface(bg_surf, 137, 117);
    surface_set_target(bg_surf);
    draw_sprite_tiled(spr_tv_bg, 0, bg_x, 0);
    surface_reset_target();
    draw_surface(bg_surf, xx - 83, yy - 47);
    pal_swap_set(pal_player, obj_player.pal, false);
    draw_sprite(sprite_index, image_index, xx, yy);
    
    if (state == UnknownEnum.Value_38)
        draw_sprite(spr_tv_whitenoise, switchindex, xx, yy);
    
    shader_reset();
    var _sec = wrap(global.fill / 60, 0, 59);
    var _seconds = _sec;
    
    if (_sec < 10)
        _seconds = string("0{0}", _sec);
    
    var _minutes = wrap(global.fill / 3600, 0, 59);
    var _timer = string("{1}:{0}", _seconds, _minutes);
    
    if (global.escape)
    {
        draw_set_halign(fa_center);
        draw_set_font(global.bigfont);
        draw_set_color(c_white);
        draw_healthbar(350, (obj_screensizer.displayHeight - 50) + timerpos, obj_screensizer.displayWidth - 350, (obj_screensizer.displayHeight - 10) + timerpos, (1 - (global.fill / chunkmax)) * 100, c_black, c_blue, c_red, 0, true, true);
        maynia_draw_text(obj_screensizer.displayWidth / 2, (obj_screensizer.displayHeight - 50) + timerpos, _timer);
    }
}
