function scr_player_grab()
{
    scr_mayniaGetInput();
    hsp = movespeed * xscale;
    move = key_right + key_left;
    image_speed = 0.35;
    
    if (movespeed < 10)
        movespeed = approach(movespeed, 10, 1);
    
    if (animation_end() && sprite_index == spr_player_suplexgrabjumpstart)
        sprite_index = spr_player_suplexgrabjump;
    
    if (!grounded && sprite_index == spr_player_suplexdash)
        sprite_index = spr_player_suplexgrabjumpstart;
    
    if ((animation_end() && sprite_index == spr_player_suplexdash) || ((sprite_index == spr_player_suplexgrabjump || sprite_index == spr_player_suplexgrabjumpstart) && grounded))
    {
        if (key_attack)
        {
            sprite_index = spr_player_mach2;
            image_index = 0;
            state = UnknownEnum.Value_2;
        }
        else
        {
            sprite_index = spr_player_idle;
            image_index = 0;
            state = UnknownEnum.Value_0;
        }
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_destrucitbles) && grounded)
    {
        sprite_index = spr_player_wallsplat;
        image_index = 0;
        movespeed = 0;
        state = UnknownEnum.Value_11;
        fmod_event_stop(grabsnd, true);
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/bump");
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_destrucitbles) && !grounded)
    {
        wallspeed = movespeed;
        state = UnknownEnum.Value_17;
        sprite_index = spr_player_climbwall;
        fmod_event_stop(grabsnd, true);
    }
    
    if (move != 0 && move != xscale)
    {
        movespeed = 2;
        state = UnknownEnum.Value_1;
        sprite_index = spr_player_fall;
        fmod_event_stop(grabsnd, true);
    }
    
    if (!jumpstop)
    {
        if (!key_jump && vsp < 0)
        {
            vsp /= 20;
            jumpstop = true;
        }
    }
    
    if (key_down2 && grounded)
    {
        crouchsliptimer = 25;
        flash = true;
        movespeed = 12;
        state = UnknownEnum.Value_10;
        sprite_index = spr_player_crouchslip;
        fmod_event_stop(grabsnd, true);
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/crouchslide");
    }
    
    if (key_jump2)
    {
        jumpstop = false;
        vsp = -12;
        sprite_index = spr_player_longjump;
        image_index = 0;
        state = UnknownEnum.Value_2;
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/jump");
        create_particle(spr_dustjump, x, y, 1);
        fmod_event_stop(grabsnd, true);
    }
    
    bluraft_timer = approach(bluraft_timer, 0, 1);
    
    if (bluraft_timer == 0)
    {
        create_blur_afterimage(sprite_index, image_index, x, y, xscale);
        bluraft_timer = 4;
    }
}
