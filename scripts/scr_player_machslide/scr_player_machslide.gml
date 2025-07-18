function scr_player_machslide()
{
    scr_mayniaGetInput();
    hsp = movespeed * xscale;
    move = key_right + key_left;
    movespeed = approach(movespeed, 0, 0.4);
    
    if (!instance_exists(obj_dashcloud) && grounded)
        instance_create_depth(x, y, 5, obj_dashcloud);
    
    if (grounded && animation_end())
    {
        if (sprite_index != spr_player_machslide && sprite_index != spr_player_machslidestart)
        {
            switch (sprite_index)
            {
                case spr_player_machslideboost:
                    sprite_index = spr_player_mach2;
                    image_index = 0;
                    movespeed = 6;
                    xscale *= -1;
                    state = UnknownEnum.Value_2;
                    break;
                
                case spr_player_machslideboost3:
                    sprite_index = spr_player_mach3;
                    image_index = 0;
                    movespeed = 12;
                    xscale *= -1;
                    state = UnknownEnum.Value_3;
                    break;
            }
        }
        else if (movespeed == 0)
        {
            sprite_index = spr_player_idle;
            image_index = 0;
            movespeed = 0;
            state = UnknownEnum.Value_0;
        }
    }
    
    if (animation_end())
    {
        if (sprite_index == spr_player_machslide || sprite_index == spr_player_machslidestart)
        {
            if (sprite_index == spr_player_machslidestart)
                sprite_index = spr_player_machslide;
        }
        else
        {
            image_speed = 0;
        }
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_destrucitbles) && (sprite_index == spr_player_machslidestart || sprite_index == spr_player_machslide))
    {
        sprite_index = spr_player_wallsplat;
        image_index = 0;
        movespeed = 0;
        state = UnknownEnum.Value_11;
    }
    
    bluraft_timer = approach(bluraft_timer, 0, 1);
    
    if (bluraft_timer == 0)
    {
        create_blur_afterimage(sprite_index, image_index, x, y, xscale);
        bluraft_timer = 4;
    }
}
