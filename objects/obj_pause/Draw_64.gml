if (active)
{
    draw_set_color(c_black);
    draw_set_alpha(1);
    draw_rectangle(0, 0, obj_screensizer.displayWidth, obj_screensizer.displayHeight, false);
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_sprite(screensprite, 0, 0, 0);
    draw_sprite(guisprite, 0, 0, 0);
    draw_set_alpha(backalpha);
    draw_set_color(c_white);
    draw_rectangle(0, 0, obj_screensizer.displayWidth, obj_screensizer.displayHeight, false);
    draw_set_color(c_white);
    draw_set_alpha(1);
    update_snooze();
    
    if (active == 1)
    {
        if (!ds_list_empty(options))
        {
            var xx = obj_screensizer.displayWidth / 2;
            var yy = (obj_screensizer.displayHeight / 2) - (48 * (ds_list_size(options) - 2));
            
            for (var i = 0; i < ds_list_size(options); i++)
            {
                var q = ds_list_find_value(options, i);
                
                if (is_struct(q))
                {
                    var _col = (selected == i) ? 16777215 : 8421504;
                    draw_set_font(global.bigfont);
                    draw_set_color(_col);
                    draw_set_halign(fa_center);
                    maynia_draw_text(xx, yy, q.option);
                    yy += 48;
                }
            }
        }
    }
}

draw_sprite(spr_pause_border_left, borderindex, border1pos[0] + wave(0, -2, 4, 0), border1pos[1] + wave(0, 2, 8, 0));
draw_sprite(spr_pause_border_right, borderindex, border2pos[0] + wave(0, 2, 4, 60), border2pos[1] + wave(0, -2, 8, 60));
