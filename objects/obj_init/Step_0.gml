scr_mayniaGetInput();

if (global.isplaytester == false)
{
    if (key_jump2)
    {
        with (instance_create_depth(x, y, 0, obj_fadeout))
            targetRoom = hub_hallway;
        
        global.lang = "english";
        fmod_event_stop_all(false);
    }
    
    if (key_slap2)
    {
        with (instance_create_depth(x, y, 0, obj_fadeout))
            targetRoom = hub_hallway;
        
        global.lang = "spanish";
        fmod_event_stop_all(false);
    }
    
    if (key_taunt2)
    {
        with (instance_create_depth(x, y, 0, obj_fadeout))
            targetRoom = hub_hallway;
        
        global.lang = "portuguese";
        fmod_event_stop_all(false);
    }
}
