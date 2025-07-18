if (place_meeting(x, y, obj_player) && !active)
    active = true;

if (active)
{
    switch (part)
    {
        case -1:
            with (obj_player)
            {
                x = other.x + 16;
                hsp = 0;
                movespeed = 0;
                tubevsp = 20;
                tubehsp = 0;
                state = UnknownEnum.Value_24;
            }
            
            randomtimer = 40;
            part++;
            obj_camera.lock = true;
            break;
        
        case 0:
            randomtimer = approach(randomtimer, 0, 1);
            
            if (randomtimer == 0)
            {
                with (obj_player)
                {
                    targetRoom = warehouse_1;
                    targetDoor = "S";
                    hallway = false;
                    
                    with (instance_create_depth(x, y, 0, obj_fadeout))
                        targetRoom = other.targetRoom;
                }
                
                instance_destroy();
            }
            
            break;
    }
}
