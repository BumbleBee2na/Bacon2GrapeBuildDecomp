if (buffer == 0)
{
    scr_mayniaGetInput();
    var m = menus[currentmenu];
    var opt = m.options;
    var _length = array_length(opt) - 1;
    var q = opt[selected];
    BGX = wave(-32, 32, 5, 0);
    BGY--;
    
    if (q.type != UnknownEnum.Value_9)
        move = key_left2 + key_right2;
    else
        move = key_left + key_right;
    
    if (move != 0 && q.type != UnknownEnum.Value_7)
    {
        q.val += move;
        q.val = clamp(q.val, 0, q.max);
        q.func();
        
        if (q.type != UnknownEnum.Value_9)
            event_play_oneshot("event:/Sfx/UI/Pause/menuselect");
    }
    
    if (key_down2)
    {
        if (selected < _length)
            selected++;
        
        event_play_oneshot("event:/Sfx/UI/Pause/menumove");
    }
    
    if (key_up2)
    {
        if (selected > 0)
            selected--;
        
        event_play_oneshot("event:/Sfx/UI/Pause/menumove");
    }
    
    if (q.type != UnknownEnum.Value_10 && q.type != UnknownEnum.Value_9)
    {
        if (key_jump2)
        {
            if (q.type != UnknownEnum.Value_7)
            {
                q.val += 1;
                q.val = wrap(q.val, 0, q.max);
            }
            
            q.func();
            event_play_oneshot("event:/Sfx/UI/Pause/menuselect");
        }
    }
    else
    {
        if (key_jump2 && !q.selecting)
        {
            if (q.selecting == false)
                q.selecting = true;
            
            buffer = 6;
        }
        
        if (q.selecting && (keyboard_check_pressed(vk_anykey) && buffer == 0))
        {
            q.selecting = false;
            q.val = keyboard_key;
            q.func();
            event_play_oneshot("event:/Sfx/UI/Pause/menuselect");
        }
        
        if (keyboard_check_pressed(vk_f1) && !q.selecting)
            reset_binds();
    }
    
    if (key_slap2 && q.selecting == false)
    {
        m.backfunc();
        event_play_oneshot("event:/Sfx/UI/Pause/menuback");
    }
    
    if (q.type == UnknownEnum.Value_9)
    {
        if (move != 0)
        {
            q.moving = true;
            
            if (!event_isplaying(slidersnd))
                fmod_event_play(slidersnd);
            
            fmod_global_setParameter("SliderVolume", (q.val / 100) * global.MasterVolume, true);
        }
        else
        {
            q.moving = false;
            
            if (event_isplaying(slidersnd))
                fmod_event_stop(slidersnd, false);
        }
    }
    else if (event_isplaying(slidersnd))
    {
        fmod_event_stop(slidersnd, false);
    }
}

buffer = approach(buffer, 0, 1);
