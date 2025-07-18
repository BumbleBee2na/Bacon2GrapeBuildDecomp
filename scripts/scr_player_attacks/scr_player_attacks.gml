function scr_player_punch()
{
    scr_mayniaGetInput();
    image_speed = 0.35;
    hsp = approach(hsp, movespeed, 0.7);
    move = key_right + key_left;
    
    if (move != 0)
        movespeed = 6 * move;
    else
        movespeed = 0;
    
    if (animation_end())
        image_index = image_number - 1;
    
    if (grounded)
    {
        state = UnknownEnum.Value_0;
        sprite_index = spr_player_land;
        image_index = 0;
        movespeed = abs(movespeed);
    }
    
    if (vsp < 0)
    {
        afterimagetimer = approach(afterimagetimer, 0, 1);
        
        if (afterimagetimer == 0)
        {
            create_afterimage(sprite_index, image_index, x, y, xscale);
            afterimagetimer = 6;
        }
    }
}

function scr_player_wallkick()
{
    scr_mayniaGetInput();
    sprite_index = spr_player_grabspinny;
    image_speed = 0.5;
    hsp = approach(hsp, movespeed * move, 1);
    move = key_right + key_left;
    
    if (move != 0)
    {
        if (movespeed < 13)
            movespeed = 9;
    }
    else
    {
        movespeed = 0;
    }
    
    if (!jumpstop)
    {
        if (!key_jump && vsp < 0)
        {
            vsp /= 20;
            jumpstop = true;
        }
    }
    
    if (grounded)
    {
        if (key_attack)
        {
            state = UnknownEnum.Value_3;
            
            if (movespeed < 13)
                movespeed = 13;
            
            sprite_index = spr_player_grabspinnyland;
            image_index = 0;
        }
        else
        {
            movespeed = abs(hsp);
            create_particle(spr_land, x, y, 1);
            
            if (move != 0)
                sprite_index = spr_player_land2;
            else
                sprite_index = spr_player_land;
            
            image_index = 0;
            state = UnknownEnum.Value_0;
        }
        
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/airland");
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/bump");
        
        if (move != 0)
            xscale = move;
    }
    
    afterimagetimer = approach(afterimagetimer, 0, 1);
    
    if (afterimagetimer == 0)
    {
        create_attack_afterimage(sprite_index, image_index, x, y, xscale);
        afterimagetimer = 3;
    }
    
    if (key_slap2)
    {
        sprite_index = spr_player_spincancel;
        image_index = 0;
        state = UnknownEnum.Value_27;
        vsp = -2;
        
        if (movespeed < 12)
            movespeed = 12;
        
        if (move != 0)
            xscale = move;
    }
    
    if (key_down2 && vsp < 14)
        vsp = 14;
}

function scr_player_spinend()
{
}

function scr_player_spincancel()
{
    scr_mayniaGetInput();
    image_speed = 0.35;
    move = key_right + key_left;
    hsp = movespeed * xscale;
    afterimagetimer = approach(afterimagetimer, 0, 1);
    vsp += 0.5;
    
    if (afterimagetimer == 0)
    {
        create_attack_afterimage(sprite_index, image_index, x, y, xscale);
        afterimagetimer = 4;
    }
    
    if (place_meeting(x + sign(hsp), y, obj_solid))
    {
        jumpstop = true;
        vsp = -14;
        movespeed = 0;
        sprite_index = spr_player_grabspinny;
        image_index = 0;
        state = UnknownEnum.Value_22;
        create_particle(spr_bounceeffect, x, y, 1);
    }
    
    if (grounded)
    {
        state = UnknownEnum.Value_3;
        
        if (movespeed < 13)
            movespeed = 13;
        
        sprite_index = spr_player_grabspinnyland;
        image_index = 0;
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/airland");
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/bump");
        
        if (move != 0)
            xscale = move;
    }
    
    if (animation_end() && sprite_index == spr_player_spincancel)
        sprite_index = spr_player_spincancelloop;
}
