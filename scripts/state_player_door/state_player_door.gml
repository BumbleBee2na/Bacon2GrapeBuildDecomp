function scr_player_enterdoor()
{
    scr_mayniaGetInput();
    image_speed = 0.35;
    hsp = 0;
    vsp = 0;
    
    if (animation_end())
        image_index = image_number - 1;
}

function scr_player_walkfront()
{
    scr_mayniaGetInput();
    image_speed = 0.35;
    hsp = 0;
    vsp = 0;
    c = approach(c, 255, 10);
    image_blend = make_colour_hsv(0, 0, c);
    
    if (animation_end())
    {
        if (sprite_index == spr_player_walkfront)
        {
            if (place_meeting(x, y, obj_exitgate))
            {
                sprite_index = spr_player_timesup;
                image_index = 0;
                xscale = 1;
                
                with (obj_exitgate)
                {
                    ds_list_add(global.saveroom, id);
                    image_index = 0;
                    obj_camera.shake = 15;
                    obj_camera.shake_mag = 15;
                    fmod_soundeffect_3d(x, y, "event:/Sfx/General/gateslam");
                }
            }
            else
            {
                state = UnknownEnum.Value_0;
                sprite_index = spr_player_idle;
                image_index = 0;
            }
        }
        else
        {
            state = UnknownEnum.Value_0;
            sprite_index = spr_player_idle;
            image_index = 0;
        }
    }
}
