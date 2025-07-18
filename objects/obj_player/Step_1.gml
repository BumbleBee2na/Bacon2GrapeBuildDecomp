fmod_listener_setPosition(0, x, y, 0);

if (state == UnknownEnum.Value_2 || state == UnknownEnum.Value_3 || state == UnknownEnum.Value_17 || state == UnknownEnum.Value_18)
{
    fmod_event_setPause(machsnd, false);
    
    if (!event_isplaying(machsnd))
        fmod_event_play(machsnd);
    
    var s = 0;
    
    if (state == UnknownEnum.Value_2 && sprite_index == spr_player_mach1 && grounded)
        s = 0;
    else if ((state == UnknownEnum.Value_2 && sprite_index != spr_player_mach1) || state == UnknownEnum.Value_17 || state == UnknownEnum.Value_18)
        s = 1;
    else if (state == UnknownEnum.Value_3 && sprite_index != spr_player_mach4)
        s = 2;
    else if (sprite_index == spr_player_mach4)
        s = 3;
    
    fmod_event_set3DPosition(machsnd, x, y, 0);
    fmod_event_setParameter(machsnd, "state", s, true);
}
else if (event_isplaying(machsnd))
{
    fmod_event_stop(machsnd, true);
}

if (state == UnknownEnum.Value_7 || state == UnknownEnum.Value_6)
{
    fmod_event_setPause(sjumpsnd, false);
    
    if (!event_isplaying(sjumpsnd))
        fmod_event_play(sjumpsnd);
    
    var s = 0;
    
    if (state == UnknownEnum.Value_7 && fmod_event_getParameter(sjumpsnd, "state") != 1)
        s = 1;
    
    fmod_event_set3DPosition(sjumpsnd, x, y, 0);
    fmod_event_setParameter(sjumpsnd, "state", s, true);
}
else if (event_isplaying(sjumpsnd))
{
    fmod_event_stop(sjumpsnd, true);
}

if (state == UnknownEnum.Value_22)
{
    fmod_event_setPause(spinsnd, false);
    
    if (!event_isplaying(spinsnd))
        fmod_event_play(spinsnd);
    
    fmod_event_set3DPosition(spinsnd, x, y, 0);
}
else
{
    fmod_event_stop(spinsnd, true);
}

if (state == UnknownEnum.Value_15 || state == UnknownEnum.Value_30)
{
    fmod_event_setPause(fallsnd, false);
    
    if (!event_isplaying(fallsnd))
        fmod_event_play(fallsnd);
    
    fmod_event_set3DPosition(fallsnd, x, y, 0);
}
else if (event_isplaying(fallsnd))
{
    fmod_event_stop(fallsnd, true);
}

scr_collide_destructibles();
