function scr_player_mach2()
{
    scr_mayniaGetInput();
    hsp = movespeed * xscale;
    move = key_right + key_left;
    
    if (animation_end())
    {
        switch (sprite_index)
        {
            case spr_player_mach1:
                sprite_index = spr_player_mach2;
                image_index = 0;
                break;
            
            case spr_player_secondjump:
                sprite_index = spr_player_secondjumpfall;
                image_index = 0;
                break;
            
            case spr_player_longjump:
                image_index = image_number - 3;
                break;
            
            case spr_player_rollgetup:
                sprite_index = spr_player_mach2;
                image_index = 0;
                break;
        }
    }
    
    if (sprite_index == spr_player_longjump)
        image_speed = 0.4;
    else
        image_speed = abs(movespeed) / 16;
    
    if (grounded)
        movespeed += 0.1;
    
    if (!instance_exists(obj_dashcloud) && grounded)
        instance_create_depth(x, y, 5, obj_dashcloud);
    
    slope_momentum(0.1, 0.2);
    
    if (!jumpstop)
    {
        if (!key_jump && vsp < 0)
        {
            vsp /= 30;
            jumpstop = true;
        }
    }
    
    if ((sprite_index == spr_player_secondjump || sprite_index == spr_player_secondjumpfall || sprite_index == spr_player_longjump) && grounded)
        sprite_index = spr_player_mach2;
    
    if (key_jump2 && grounded)
    {
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/jump");
        sprite_index = spr_player_secondjump;
        image_index = 0;
        vsp = -11;
        jumpstop = false;
    }
    
    if (!grounded && sprite_index != spr_player_secondjump && sprite_index != spr_player_secondjumpfall && sprite_index != spr_player_longjump)
    {
        sprite_index = spr_player_secondjump;
        jumpstop = false;
        image_index = 0;
    }
    
    if (movespeed >= 12 && sprite_index != spr_player_longjump)
    {
        flash = true;
        sprite_index = spr_player_mach3;
        image_index = 0;
        image_speed = 0.4;
        state = UnknownEnum.Value_3;
    }
    
    if (!key_attack && grounded)
    {
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/machend");
        sprite_index = spr_player_machslidestart;
        image_index = 0;
        image_speed = 0.35;
        state = UnknownEnum.Value_4;
    }
    
    if (key_down)
    {
        sprite_index = spr_player_machroll;
        image_index = 0;
        image_speed = 0.35;
        state = UnknownEnum.Value_10;
    }
    
    do_taunt();
    do_grab();
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x, y + 1, obj_slope) && !place_meeting(x + sign(hsp), y, obj_destrucitbles) && grounded)
    {
        sprite_index = spr_player_wallsplat;
        image_index = 0;
        movespeed = 0;
        state = UnknownEnum.Value_11;
    }
    
    if (move != 0 && move != xscale && grounded)
    {
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/machturn");
        sprite_index = spr_player_machslideboost;
        image_index = 0;
        image_speed = 0.35;
        state = UnknownEnum.Value_4;
    }
    
    afterimagetimer = approach(afterimagetimer, 0, 1);
    
    if (afterimagetimer == 0)
    {
        create_afterimage(sprite_index, image_index, x, y, xscale, abs(movespeed) / 14);
        afterimagetimer = 6;
    }
    
    if ((place_meeting(x + sign(hsp), y, obj_solid) && !grounded) || (place_meeting_slope(0, 2) && place_meeting(x + sign(hsp), y - 4, obj_solid)))
    {
        wallspeed = movespeed;
        state = UnknownEnum.Value_17;
        sprite_index = spr_player_climbwall;
    }
}
