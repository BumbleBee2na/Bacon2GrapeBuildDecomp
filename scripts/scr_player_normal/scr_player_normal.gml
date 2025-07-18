function scr_player_normal()
{
    scr_mayniaGetInput();
    hsp = movespeed * xscale;
    move = key_right + key_left;
    
    if (animation_end())
    {
        switch (sprite_index)
        {
            case spr_player_land:
                idletimer = 60 * irandom_range(3, 5);
                sprite_index = spr_player_idle;
                image_index = 0;
                break;
            
            case spr_player_land2:
                idletimer = 60 * irandom_range(3, 5);
                sprite_index = spr_player_move;
                image_index = 0;
                break;
            
            case spr_player_idledance:
                idletimer = 60 * irandom_range(3, 5);
                sprite_index = spr_player_idle;
                image_index = 0;
                break;
        }
    }
    
    steppy = approach(steppy, 0, 0.35);
    
    if (move != 0)
    {
        idletimer = 60 * irandom_range(3, 5);
        
        if (sprite_index != spr_player_land2 && sprite_index != spr_player_boogie)
            sprite_index = spr_player_move;
        
        if (sprite_index != spr_player_boogie)
            image_speed = movespeed / 15;
        
        if ((floor(image_index) == 3 || floor(image_index) == 8) && steppy <= 0 && sprite_index == spr_player_move)
        {
            steppy = 2;
            create_particle(spr_cloudeffect, x, y + 42, 1);
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/step");
        }
        
        xscale = move;
        movespeed = approach(movespeed, 7, 0.5);
    }
    else
    {
        if (sprite_index != spr_player_land && sprite_index != spr_player_land2 && sprite_index != spr_player_boogie && sprite_index != spr_player_idledance)
        {
            if (global.escape)
                sprite_index = spr_player_panic;
            else
                sprite_index = spr_player_idle;
        }
        
        if (sprite_index != spr_player_boogie)
            image_speed = 0.35;
        
        movespeed = 0;
        idletimer = approach(idletimer, 0, 1);
        
        if (idletimer == 0 && sprite_index != spr_player_boogie)
        {
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/yeag");
            idletimer = 60 * irandom_range(3, 5);
            sprite_index = spr_player_idledance;
            image_index = 0;
        }
    }
    
    if (!grounded)
    {
        state = UnknownEnum.Value_1;
        sprite_index = spr_player_fall;
    }
    
    if (key_taunt && sprite_index != spr_player_boogie)
    {
        sprite_index = spr_player_boogie;
    }
    else if (!key_taunt && sprite_index == spr_player_boogie)
    {
        sprite_index = spr_player_idle;
        image_index = 0;
    }
    
    if (sprite_index == spr_player_boogie)
    {
        boogieTimer = approach(boogieTimer, 0, 1);
        image_speed = (boogieTimer == 0) ? 0.5 : 0.35;
        
        if (boogieTimer == 0)
        {
            if (!instance_exists(obj_boombox))
            {
                instance_create_depth(x, y, 5, obj_boombox);
                create_particle(spr_poofeffect, x, y, 1, -2);
            }
            
            bluraft_timer = approach(bluraft_timer, 0, 1);
            
            if (bluraft_timer == 0)
            {
                create_blur_afterimage(sprite_index, image_index, x, y, xscale);
                bluraft_timer = 4;
            }
        }
    }
    else
    {
        boogieTimer = 78;
    }
    
    if (key_jump2 && grounded)
    {
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/jump");
        create_particle(spr_highjump, x, y, 1);
        state = UnknownEnum.Value_1;
        sprite_index = spr_player_jump;
        jumpstop = false;
        image_index = 0;
        vsp = -11;
    }
    
    if (key_down && grounded)
    {
        sprite_index = spr_player_crouch;
        image_index = 0;
        state = UnknownEnum.Value_20;
    }
    
    if (key_attack && grounded)
    {
        sprite_index = spr_player_mach1;
        image_index = 0;
        state = UnknownEnum.Value_2;
        
        if (movespeed < 6)
            movespeed = 6;
    }
    
    do_taunt();
    do_grab();
}
