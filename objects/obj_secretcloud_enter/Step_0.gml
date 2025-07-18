switch (state)
{
    case UnknownEnum.Value_0:
        if (animation_end() && obj_player.state == UnknownEnum.Value_21)
        {
            with (obj_player)
            {
                sprite_index = spr_player_bodyslamfall;
                state = UnknownEnum.Value_15;
                vsp = 10;
                freefallsmash = 5;
            }
            
            state = UnknownEnum.Value_1;
            sprite_index = spr_secretportal_tired;
        }
        
        break;
    
    case UnknownEnum.Value_1:
        leavetimer = approach(leavetimer, 0, 1);
        
        if (leavetimer == 0)
            instance_destroy();
        
        break;
}
