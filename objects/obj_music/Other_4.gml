if (ds_map_exists(musicDetails, room))
{
    var _map = ds_map_find_value(musicDetails, room);
    
    if (_map.music != music)
    {
        if (musicInst != -4)
            fmod_event_stop(musicInst, false);
        
        if (secretInst != -4)
            fmod_event_stop(secretInst, false);
        
        music = _map.music;
        musicInst = event_play_oneshot(_map.music);
        secretInst = event_play_oneshot(_map.secret);
        fmod_event_setPause(secretInst, true);
        func = _map.func;
    }
}
