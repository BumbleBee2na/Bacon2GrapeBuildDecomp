function scr_player_mach3()
{
    scr_mayniaGetInput();
    hsp = movespeed * xscale;
    move = key_right + key_left;
    
    if (animation_end())
    {
        switch (sprite_index)
        {
            case spr_player_mach3jump:
                sprite_index = spr_player_mach3;
                image_index = 0;
                break;
            
            case spr_player_mach3hit:
                sprite_index = spr_player_mach3;
                image_index = 0;
                break;
            
            case spr_player_rollgetup:
                sprite_index = spr_player_mach3;
                image_index = 0;
                break;
            
            case spr_player_grabspinnyland:
                sprite_index = spr_player_mach3;
                image_index = 0;
                break;
        }
    }
    
    if (move == xscale)
    {
        if (movespeed < 20)
            movespeed += (mach4 ? 0.1 : 0.025);
    }
    else
    {
        movespeed = approach(movespeed, 12, 0.1);
    }
    
    if (!instance_exists(obj_dashcloud) && grounded)
    {
        with (instance_create_depth(x, y, 5, obj_dashcloud))
            sprite_index = spr_superdashcloud;
    }
    
    if (!instance_exists(obj_dashcloud2) && grounded & mach4)
    {
        with (instance_create_depth(x, y, 5, obj_dashcloud2))
            sprite_index = spr_crazyrunothereffect;
    }
    
    if (mach4)
    {
        if (flame == 0)
        {
            create_particle(spr_flamecloud, x, y, 1);
            flame = 10;
        }
        
        flame = approach(flame, 0, 1);
    }
    
    slope_momentum(0.1, 0.2);
    
    if (movespeed >= 16)
        mach4 = true;
    else
        mach4 = false;
    
    if (mach4 && sprite_index != spr_player_mach4)
    {
        flash = true;
        sprite_index = spr_player_mach4;
    }
    
    if (!mach4 && sprite_index == spr_player_mach4)
    {
        flash = true;
        sprite_index = spr_player_mach3;
    }
    
    if (!jumpstop)
    {
        if (!key_jump && vsp < 0)
        {
            vsp /= 20;
            jumpstop = true;
        }
    }
    
    if (machhitanim && sprite_index != spr_player_mach3hit)
    {
        sprite_index = spr_player_mach3hit;
        image_index = 0;
        machhitanim = false;
    }
    
    if (!key_attack && grounded)
    {
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/machend");
        sprite_index = spr_player_machslidestart;
        image_index = 0;
        image_speed = 0.35;
        state = UnknownEnum.Value_4;
    }
    
    image_speed = mach4 ? 0.6 : 0.4;
    
    if ((key_jump2 || jump_buffer > 0) && grounded)
    {
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/jump");
        sprite_index = spr_player_mach3jump;
        jumpstop = false;
        image_index = 0;
        vsp = -11;
    }
    
    if (move != 0 && move != xscale && grounded)
    {
        movespeed = 12;
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/machturn");
        sprite_index = spr_player_machslideboost3;
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
    
    if (key_up && grounded && !place_meeting(x, y - 32, obj_solid))
    {
        sprite_index = spr_player_superjumpprep;
        image_index = 0;
        state = UnknownEnum.Value_6;
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid) && !place_meeting(x + sign(hsp), y, obj_destrucitbles) && !place_meeting(x, y + 1, obj_slope) && grounded && !place_meeting(x + sign(hsp), y, obj_metalblock))
    {
        vsp = -5;
        hsp = -5 * xscale;
        obj_camera.shake = 15;
        obj_camera.shake_mag = 15;
        sprite_index = spr_player_mach3hitwall;
        image_index = 0;
        movespeed = 0;
        state = UnknownEnum.Value_11;
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/slam");
    }
    
    afterimagetimer = approach(afterimagetimer, 0, 1);
    
    if (afterimagetimer == 0)
    {
        create_afterimage(sprite_index, image_index, x, y, xscale, abs(movespeed) / 14);
        afterimagetimer = 6;
    }
    
    if ((place_meeting(x + sign(hsp), y, obj_solid) && !grounded) || (place_meeting_slope(0, 4) && place_meeting(x + sign(hsp), y - 4, obj_solid)))
    {
        wallspeed = movespeed;
        state = UnknownEnum.Value_17;
        sprite_index = spr_player_climbwall;
    }
}
