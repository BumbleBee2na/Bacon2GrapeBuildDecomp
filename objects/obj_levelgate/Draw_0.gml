var x1 = sprite_get_xoffset(sprite_index);
var y1 = sprite_get_yoffset(sprite_index);
draw_sprite(sprite_index, 1, x, y);
var _bgyoffset = sprite_get_yoffset(spr_gate_entranceBG) + sprite_get_height(sprite_index);
var _surf = -4;
var _clip = -4;

if (!surface_exists(_surf))
    _surf = surface_create(sprite_get_width(sprite_index), sprite_get_height(sprite_index));

surface_set_target(_surf);

if (!ds_list_empty(gateinfo))
{
    for (var i = 0; i < ds_list_size(gateinfo); i++)
    {
        var q = ds_list_find_value(gateinfo, i);
        
        if (is_struct(q))
        {
            if (q.parallax == false)
            {
                q.bgy += q.vsp;
                q.bgx += q.hsp;
            }
            else
            {
                q.bgx = (obj_screensizer.displayWidth - (camera_get_view_x(view_camera[0]) * 0.05)) + (obj_screensizer.displayWidth / 5);
                q.bgy = (obj_screensizer.displayHeight - (camera_get_view_y(view_camera[0]) * 0.05) - (obj_screensizer.displayHeight / 2)) + 8;
            }
            
            draw_sprite_tiled(q.sprite_index, q.image_index, q.bgx, _bgyoffset + q.bgy);
        }
    }
}

surface_reset_target();

if (!surface_exists(_clip))
    _clip = surface_create(sprite_get_width(sprite_index), sprite_get_height(sprite_index));

surface_set_target(_clip);
draw_set_alpha(1);
draw_clear(c_white);
gpu_set_blendmode(bm_subtract);
draw_sprite(sprite_index, 1, x1, y1);
surface_reset_target();
surface_set_target(_surf);
draw_surface(_clip, 0, 0);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_set_alpha(bgalpha);
draw_surface(_surf, x - x1, y - y1);
draw_set_alpha(1);
draw_self();
surface_free(_surf);
surface_free(_clip);
ini_open("saveData1.ini");

if (drawing)
{
    draw_sprite(spr_rankbubble, ini_read_real(level, "rank", 0), x, y - 150);
    draw_set_font(global.smallfont);
    draw_set_halign(fa_center);
    draw_text(x, (y - 150) + 16, ini_read_real(level, "score", 0));
}

ini_close();
