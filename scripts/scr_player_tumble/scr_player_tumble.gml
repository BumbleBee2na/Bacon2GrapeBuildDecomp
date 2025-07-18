function scr_player_tumble()
{
    scr_mayniaGetInput();
    hsp = movespeed * xscale;
    move = key_right + key_left;
    
    if (sprite_index == spr_player_machroll)
        image_speed = abs(movespeed) / 15;
    else
        image_speed = 0.4;
    
    if (sprite_index == spr_player_dive && grounded)
        sprite_index = spr_player_machroll;
    
    if (sprite_index == spr_player_dive)
    {
        vsp = 16;
        
        if (key_jump2 && !grounded)
        {
            vsp = -5;
            sprite_index = spr_player_bodyslamstart;
            image_index = 0;
            state = UnknownEnum.Value_30;
        }
    }
    
    if (sprite_index == spr_player_machroll)
    {
        if (key_jump2)
        {
            jumpstop = false;
            sprite_index = spr_player_grabspinny;
            image_index = 0;
            state = UnknownEnum.Value_22;
            vsp = -15;
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/jump");
            create_particle(spr_bounceeffect, x, y, 1);
            fmod_event_stop(grabsnd, true);
        }
    }
    
    if (sprite_index == spr_player_crouchslip)
    {
        crouchsliptimer = approach(crouchsliptimer, 0, 1);
        
        if (!key_down && grounded && !place_meeting(x, y - 32, obj_solid) && crouchsliptimer <= 0)
        {
            sprite_index = spr_player_rollgetup;
            image_index = 0;
            state = (movespeed >= 12) ? UnknownEnum.Value_3 : UnknownEnum.Value_2;
        }
    }
    
    if (!grounded && (sprite_index == spr_player_machroll || sprite_index == spr_player_crouchslip) && sprite_index != spr_player_dive)
    {
        sprite_index = spr_player_dive;
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/crouchslide");
    }
    
    if (sprite_index == spr_player_dive)
        vsp = 16;
    
    if (!key_down && grounded && !place_meeting(x, y - 32, obj_solid) && sprite_index != spr_player_crouchslip)
    {
        sprite_index = spr_player_rollgetup;
        image_index = 0;
        state = (movespeed >= 12) ? UnknownEnum.Value_3 : UnknownEnum.Value_2;
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_destrucitbles))
    {
        if (grounded)
        {
            sprite_index = spr_player_wallsplat;
            image_index = 0;
            movespeed = 0;
            state = UnknownEnum.Value_11;
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/bump");
        }
        else
        {
            xscale *= -1;
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/bump");
            create_particle(spr_bounceeffect, x, y, 1);
        }
    }
    
    bluraft_timer = approach(bluraft_timer, 0, 1);
    
    if (bluraft_timer == 0)
    {
        create_blur_afterimage(sprite_index, image_index, x, y, xscale);
        bluraft_timer = 4;
    }
}
