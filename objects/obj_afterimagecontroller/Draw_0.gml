if (!ds_list_empty(afterimages))
{
    for (var i = 0; i < ds_list_size(afterimages); i++)
    {
        var q = ds_list_find_value(afterimages, i);
        
        with (q)
        {
            var _shd = false;
            var _blend = 16777215;
            
            switch (type)
            {
                case UnknownEnum.Value_0:
                    shader_set(shd_fullcolor);
                    var col = [color_get_red(image_blend) / 255, color_get_green(image_blend) / 255, color_get_blue(image_blend) / 255];
                    shader_set_uniform_f_array(other.uniform1, [col[0], col[1], col[2]]);
                    shader_set_uniform_f_array(other.uniform2, [1, 1, 1]);
                    _shd = true;
                    break;
                
                case UnknownEnum.Value_1:
                    pal_swap_set(pal_player, obj_player.pal, false);
                    _blend = image_blend;
                    _shd = true;
                    break;
                
                case UnknownEnum.Value_2:
                    shader_set(shd_fullcolor);
                    shader_set_uniform_f_array(other.uniform1, [0.9725490196078431, 0.47058823529411764, 0.6901960784313725]);
                    shader_set_uniform_f_array(other.uniform2, [0.9098039215686274, 0.3137254901960784, 0.596078431372549]);
                    _shd = true;
                    break;
            }
            
            draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, _blend, image_alpha * alpha);
            
            if (_shd)
                shader_reset();
        }
    }
}
