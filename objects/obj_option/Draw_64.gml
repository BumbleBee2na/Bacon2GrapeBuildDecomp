draw_set_color(c_white);

for (var i = 0; i < array_length(backgrounds); i++)
{
    draw_sprite_tiled_ext(spr_optionsBG, backgrounds[i][0], BGX, BGY, 1, 1, c_white, backgrounds[i][1]);
    
    if (i != 0)
    {
        if (currentmenu == i)
            backgrounds[i][1] = approach(backgrounds[i][1], 1, 0.1);
        else
            backgrounds[i][1] = approach(backgrounds[i][1], 0, 0.1);
    }
}

var m = menus[currentmenu];
var opt = m.options;
var _length = array_length(opt);

switch (m.anchor)
{
    case UnknownEnum.Value_5:
        var xx = obj_screensizer.displayWidth / 2;
        var yy = (obj_screensizer.displayHeight / 2) - ((m.ypad * _length) / 2);
        
        for (var i = 0; i < _length; i++)
        {
            var q = opt[i];
            var _col = (selected == i) ? 16777215 : 8421504;
            draw_set_font(global.bigfont);
            draw_set_color(_col);
            draw_set_halign(fa_center);
            maynia_draw_text(xx, yy + (m.ypad * i), q.name);
        }
        
        break;
    
    case UnknownEnum.Value_6:
        var xx = obj_screensizer.displayWidth / 5;
        var yy = (obj_screensizer.displayHeight / 2) - ((m.ypad * _length) / 2);
        
        for (var i = 0; i < _length; i++)
        {
            draw_set_font(global.bigfont);
            var _col = (selected == i) ? 16777215 : 8421504;
            draw_set_color(_col);
            var q = opt[i];
            
            switch (q.type)
            {
                case UnknownEnum.Value_7:
                    draw_set_halign(fa_left);
                    maynia_draw_text(xx, yy + (m.ypad * i), q.name);
                    break;
                
                case UnknownEnum.Value_8:
                    draw_set_halign(fa_left);
                    maynia_draw_text(xx, yy + (m.ypad * i), q.name);
                    draw_set_halign(fa_right);
                    maynia_draw_text(obj_screensizer.displayWidth - xx, yy + (m.ypad * i), q.toggle[q.val]);
                    break;
                
                case UnknownEnum.Value_9:
                    draw_set_halign(fa_left);
                    maynia_draw_text(xx, yy + (m.ypad * i), q.name);
                    draw_set_halign(fa_right);
                    maynia_draw_text(obj_screensizer.displayWidth - xx, yy + (m.ypad * i), string(round(q.val)));
                    break;
                
                case UnknownEnum.Value_10:
                    draw_set_halign(fa_left);
                    maynia_draw_text(xx, yy + (m.ypad * i), q.name);
                    draw_set_halign(fa_right);
                    maynia_draw_text(obj_screensizer.displayWidth - xx, yy + (m.ypad * i), q.selecting ? "PRESS ANY KEY" : scr_numtokey(q.val));
                    break;
            }
        }
        
        break;
}
