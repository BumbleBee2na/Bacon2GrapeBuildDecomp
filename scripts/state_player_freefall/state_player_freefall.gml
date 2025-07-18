function scr_player_freefallstart()
{
    scr_mayniaGetInput();
    hsp = approach(hsp, 7 * move, 1.5);
    move = key_right + key_left;
    
    if (hsp != 0)
        xscale = sign(hsp);
    
    freefallsmash = 0;
    image_speed = 0.35;
    
    if ((sprite_index == spr_player_bodyslamstart && animation_end()) || vsp >= 0)
    {
        sprite_index = spr_player_bodyslamfall;
        state = UnknownEnum.Value_15;
        freefallsmash = -4;
    }
    
    bluraft_timer = approach(bluraft_timer, 0, 1);
    
    if (bluraft_timer == 0)
    {
        create_blur_afterimage(sprite_index, image_index, x, y, xscale);
        bluraft_timer = 4;
    }
}

function scr_player_freefall()
{
    scr_mayniaGetInput();
    hsp = approach(hsp, 7 * move, 0.5);
    move = key_right + key_left;
    
    if (hsp != 0)
        xscale = sign(hsp);
    
    image_speed = 0.35;
    
    if (vsp < 0)
        freefallsmash = -4;
    
    vsp += 0.5;
    bluraft_timer = approach(bluraft_timer, 0, 1);
    
    if (bluraft_timer == 0)
    {
        create_blur_afterimage(sprite_index, image_index, x, y, xscale);
        bluraft_timer = 4;
    }
    
    if (vsp > 0)
        freefallsmash += 0.7;
    
    if (freefallsmash >= 10)
    {
        afterimagetimer = approach(afterimagetimer, 0, 1);
        
        if (afterimagetimer == 0)
        {
            create_afterimage(sprite_index, image_index, x, y, xscale, 1);
            afterimagetimer = 6;
        }
        
        if (!instance_exists(slameffect))
        {
            with (instance_create_depth(x, y, depth - 1, obj_superslameffect))
            {
                playerid = other.object_index;
                other.slameffect = id;
            }
        }
    }
    
    if (sprite_index == spr_player_bodyslamstart && animation_end())
        sprite_index = spr_player_bodyslamfall;
    
    if (grounded && vsp > 0 && (!place_meeting(x, y + 1, obj_destrucitbles) || (!place_meeting(x, y + 1, obj_metalblock) && vsp > 15)))
    {
        if (place_meeting_slope() && freefallsmash >= 10)
        {
            var slope = instance_place(x, y + 1, obj_slope);
            xscale = -sign(slope.image_xscale);
            movespeed = 12;
            state = UnknownEnum.Value_10;
            sprite_index = spr_player_crouchslip;
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/crouchslide");
        }
        else
        {
            sprite_index = spr_player_bodyslamland;
            image_index = 0;
            vsp = 0;
            hsp = 0;
            state = UnknownEnum.Value_16;
            movespeed = abs(movespeed);
            
            if (freefallsmash > 10)
            {
                obj_camera.shake = 25;
                obj_camera.shake_mag = 15;
            }
            else
            {
                obj_camera.shake = 10;
                obj_camera.shake_mag = 15;
            }
            
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/slam");
        }
    }
}

function scr_player_freefallland()
{
    vsp = 0;
    hsp = 0;
    movespeed = 0;
    image_speed = 0.35;
    
    if (animation_end())
        state = UnknownEnum.Value_0;
}
