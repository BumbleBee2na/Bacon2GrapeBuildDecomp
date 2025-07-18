if (global.escape)
{
    if (panicStart == false)
    {
        fmod_event_setPause(musicInst, true);
        panicInst = event_play_oneshot(panicMusic);
        fmod_event_setPause(panicInst, false);
        panicStart = true;
    }
    else if (fmod_event_getPause(musicInst) != true && !isSecret)
    {
        fmod_event_setPause(musicInst, true);
        fmod_event_setPause(panicInst, false);
    }
    
    if (event_isplaying(flitzani))
        fmod_event_stop(flitzani, false);
    
    if (global.lap)
        fmod_event_setParameter(panicInst, "state", 2, true);
}
else
{
    panicStart = false;
    
    if (event_isplaying(panicInst))
    {
        fmod_event_stop(panicInst);
        panicInst = -4;
    }
}

if (instance_exists(obj_cupheadpillar))
{
    if (!event_isplaying(flitzani))
        flitzani = event_play_oneshot(flitzani);
    
    fmod_event_setPause(flitzani, false);
    var _cam;
    
    with (obj_cupheadpillar)
        _cam = in_camera();
    
    pillar = approach(pillar, _cam, 0.016666666666666666);
    fmod_event_setParameter(flitzani, "flitzani", pillar, true);
}
else
{
    if (event_isplaying(flitzani))
        fmod_event_stop(flitzani, false);
    
    pillar = 0;
}

if (func != -4)
    func();

if (isSecret)
{
    if (playingSecret == false)
    {
        if (!global.escape)
            savedMusicPosition = fmod_event_getTimelinePosition(musicInst);
        else
            savedMusicPosition = fmod_event_getTimelinePosition(panicInst);
        
        var _length = savedMusicPosition / fmod_getEventLength(fmod_event_getEventPath(secretInst));
        var _pos = _length * fmod_getEventLength(fmod_event_getEventPath(secretInst));
        fmod_event_setTimelinePosition(secretInst, _pos);
        
        if (event_isplaying(musicInst))
            fmod_event_setPause(musicInst, true);
        
        if (event_isplaying(panicInst))
            fmod_event_setPause(panicInst, true);
        
        fmod_event_setPause(secretInst, false);
        playingSecret = true;
    }
}

if (!isSecret)
{
    if (playingSecret == true)
    {
        if (!global.escape)
        {
            savedMusicPosition = fmod_event_getTimelinePosition(musicInst);
            var _length = savedMusicPosition / fmod_getEventLength(fmod_event_getEventPath(musicInst));
            var _pos = _length * fmod_getEventLength(fmod_event_getEventPath(musicInst));
            fmod_event_setTimelinePosition(musicInst, _pos);
            fmod_event_setPause(musicInst, false);
        }
        else
        {
            savedMusicPosition = fmod_event_getTimelinePosition(panicInst);
            var _length = savedMusicPosition / fmod_getEventLength(fmod_event_getEventPath(panicInst));
            var _pos = _length * fmod_getEventLength(fmod_event_getEventPath(panicInst));
            fmod_event_setTimelinePosition(panicInst, _pos);
            fmod_event_setPause(panicInst, false);
        }
        
        fmod_event_setPause(secretInst, true);
        playingSecret = false;
    }
}
