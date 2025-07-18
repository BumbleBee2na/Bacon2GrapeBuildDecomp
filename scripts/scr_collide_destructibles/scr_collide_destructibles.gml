function scr_collide_destructibles()
{
    with (obj_destrucitbles)
    {
        with (obj_player)
        {
            if (state == UnknownEnum.Value_1)
            {
                if (vsp < 0)
                {
                    if (place_meeting(x, y + vsp, other))
                    {
                        instance_destroy(other);
                        vsp = 0;
                    }
                }
            }
            
            if (state == UnknownEnum.Value_9 || state == UnknownEnum.Value_13 || state == UnknownEnum.Value_2 || state == UnknownEnum.Value_3 || state == UnknownEnum.Value_10 || state == UnknownEnum.Value_22 || state == UnknownEnum.Value_27 || state == UnknownEnum.Value_4)
            {
                if (place_meeting(x + (hsp * 2), y - 1, other))
                    instance_destroy(other);
            }
            else if (state == UnknownEnum.Value_22 || state == UnknownEnum.Value_17 || state == UnknownEnum.Value_19 || state == UnknownEnum.Value_7 || state == UnknownEnum.Value_15)
            {
                if (place_meeting(x, y + (vsp * 2), other))
                    instance_destroy(other);
            }
            
            if (state == UnknownEnum.Value_10)
            {
                if (place_meeting(x + (hsp * 2), y + (vsp * 2), other))
                    instance_destroy(other);
            }
        }
    }
}
