function scr_player_banana()
{
    hsp = movespeed * xscale;
    
    if (place_meeting(x + xscale, y, obj_solid))
    {
        xscale *= -1;
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/slipbump");
    }
    
    if (grounded)
    {
        if (sprite_index != spr_player_outofpizza4 && sprite_index != spr_player_outofpizza3)
        {
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/slipend");
            sprite_index = spr_player_outofpizza3;
            vsp = -5;
            image_index = 0;
        }
        else
        {
            movespeed = approach(movespeed, 0, 0.5);
            
            if (movespeed == 0 && animation_end())
                state = UnknownEnum.Value_0;
        }
    }
    
    if (animation_end())
    {
        switch (sprite_index)
        {
            case spr_player_outofpizza1:
                sprite_index = spr_player_outofpizza2;
                break;
            
            case spr_player_outofpizza3:
                sprite_index = spr_player_outofpizza4;
                break;
        }
    }
}
