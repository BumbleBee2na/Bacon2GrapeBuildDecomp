with (obj_player)
{
    if (state == UnknownEnum.Value_3 || (state == UnknownEnum.Value_15 && freefallsmash >= 12))
    {
        var mach = y;
        var _x = x + (hsp * 2);
        
        if (state == UnknownEnum.Value_15)
        {
            mach = y + vsp;
            _x = x;
        }
        
        if (place_meeting(_x, mach, other))
        {
            with (instance_place(_x, mach, other))
                instance_destroy();
            
            if (state == UnknownEnum.Value_15)
            {
                sprite_index = spr_player_bodyslamland;
                image_index = 0;
                vsp = 0;
                hsp = 0;
                state = UnknownEnum.Value_16;
                movespeed = abs(movespeed);
            }
        }
    }
}
