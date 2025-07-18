if (place_meeting(x, y, obj_player) && dothing == false)
{
    dothing = true;
    sprite_index = spr_secretportal_closing;
    image_index = 0;
    state = UnknownEnum.Value_0;
    ds_list_add(global.saveroom, id);
    obj_player.secretportalID = secretID;
}

if (dothing)
{
    switch (state)
    {
        case UnknownEnum.Value_0:
            with (obj_player)
            {
                x = other.x;
                y = other.y;
                state = UnknownEnum.Value_21;
            }
            
            if (animation_end())
            {
                image_speed = 0;
                
                with (obj_player)
                {
                    targetRoom = other.targetRoom;
                    targetDoor = "NAN";
                }
                
                instance_create_depth(0, 0, depth, obj_fadeout);
                state = UnknownEnum.Value_1;
            }
            
            break;
    }
}
