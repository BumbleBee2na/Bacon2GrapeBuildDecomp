if (place_meeting(x, y, obj_player) && global.escape)
{
    with (obj_player)
    {
        if (key_up2)
        {
            vsp = 0;
            state = UnknownEnum.Value_14;
            sprite_index = spr_player_lookdoor;
            image_index = 0;
            instance_create_depth(0, 0, 1, obj_rankfadein);
            
            with (instance_create_depth(0, 0, -10, obj_combotitle))
            {
                index = floor(other.combo / 5) - 1;
                combopoint = obj_player.combopoint;
                lost = true;
            }
            
            save_level();
        }
    }
}

if (global.escape)
    image_index = 1;
