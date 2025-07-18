if (active)
{
    switch (part)
    {
        case 0:
            with (obj_player)
            {
                x = -200;
                y = obj_doorS.y - 14;
                state = UnknownEnum.Value_21;
                sprite_index = spr_player_idle;
                obj_camera.cam_tar = obj_fakebody;
            }
            
            part++;
            eventtimer = 120;
            break;
        
        case 1:
            eventtimer = approach(eventtimer, 0, 1);
            
            if (eventtimer <= 0)
            {
                part++;
                obj_player.sprite_index = spr_player_move;
            }
            
            break;
        
        case 2:
            with (obj_player)
            {
                x = approach(x, other.playerstart, 8);
                state = UnknownEnum.Value_21;
                sprite_index = spr_player_move;
            }
            
            if (obj_player.x == (other.playerstart - 64))
            {
                instance_destroy();
                
                with (obj_player)
                {
                    state = UnknownEnum.Value_0;
                    sprite_index = spr_player_idle;
                    obj_camera.lock = false;
                    obj_camera.cam_tar = obj_player;
                }
            }
            
            break;
    }
}
