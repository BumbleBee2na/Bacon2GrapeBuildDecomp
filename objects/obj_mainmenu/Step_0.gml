scr_mayniaGetInput();

switch (state)
{
    case 0:
        if (key_jump2 && !isActive)
        {
            isActive = true;
            alarm[0] = 10;
            fmod_event_setParameter(obj_music.musicInst, "state", 1, false);
            hectorIndex = 0;
            hectorSprite = spr_hector_wake;
        }
        
        break;
    
    case 1:
        hectorIndex += 0.35;
        
        if (floor(hectorIndex) >= sprite_get_number(hectorSprite))
        {
            switch (hectorSprite)
            {
                case spr_hector_wake:
                    hectorIndex = 0;
                    hectorSprite = spr_hector_frontToLeft;
                    break;
                
                case spr_hector_frontToLeft:
                    hectorIndex = sprite_get_number(hectorSprite) - 1;
                    break;
            }
        }
        
        var move = key_right2 - key_left2;
        
        if (move != 0)
            selected += move;
        
        selected = wrap(selected, 0, 2);
        
        if (key_jump2)
        {
            global.saveFile = selected + 1;
            fmod_event_stop_all(false);
            startSnd = event_play_oneshot("event:/Sfx/UI/Mainmenu/menustart");
            state = 2;
            hectorSprite = spr_hector_wake;
            hectorIndex = 0;
        }
        
        break;
    
    case 2:
        introIndex += 0.35;
        screenY = approach(screenY, 540, 1);
        
        if (!event_isplaying(startSnd) && !event_isstarting(startSnd))
        {
            with (instance_create_depth(x, y, 0, obj_fadeoutSpecial))
                targetRoom = hub_hallway;
        }
        
        if (key_slap2)
        {
            with (instance_create_depth(x, y, 0, obj_fadeoutSpecial))
                targetRoom = hub_hallway;
            
            state = 3;
            fmod_event_stop(startSnd, true);
        }
        
        break;
}
