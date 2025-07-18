var xx = camera_get_view_x(view_camera[view_current]);
var yy = camera_get_view_y(view_camera[view_current]);

if (dark)
{
    if (surface_exists(darksurf))
    {
        surface_set_target(darksurf);
        draw_clear_alpha(c_black, 0);
        draw_set_color(c_black);
        draw_set_alpha(0.85);
        draw_rectangle(0, 0, displayWidth + 32, displayHeight + 32, false);
        gpu_set_blendmode(bm_subtract);
        draw_set_color(c_white);
        
        if (instance_exists(obj_butterfollower))
        {
            with (obj_butterfollower)
            {
                var num1 = (obj_butterfollower.flame / 60) * 250;
                var num2 = (obj_butterfollower.flame / 60) * 300;
                draw_set_alpha(1);
                draw_circle((x - xx) + irandom_range(-1, 1), ((y - yy) + irandom_range(-1, 1)) - 20, num1, false);
                draw_set_alpha(0.4);
                draw_circle((x - xx) + irandom_range(-1, 1), ((y - yy) + irandom_range(-1, 1)) - 20, num2, false);
            }
        }
        
        if (instance_exists(obj_candlelight))
        {
            with (obj_candlelight)
            {
                if (active)
                {
                    draw_set_alpha(1);
                    draw_circle((x - xx) + irandom_range(-1, 1), (y - yy) + irandom_range(-1, 1), 100, false);
                    draw_set_alpha(0.4);
                    draw_circle((x - xx) + irandom_range(-1, 1), (y - yy) + irandom_range(-1, 1), 150, false);
                }
            }
        }
        
        gpu_set_blendmode(bm_normal);
        draw_set_alpha(1);
        surface_reset_target();
        draw_surface(darksurf, xx, yy);
    }
    else
    {
        darksurf = surface_create(displayWidth + 32, displayHeight + 32);
    }
}
