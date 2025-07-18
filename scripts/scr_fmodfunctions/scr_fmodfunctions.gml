function fmod_soundeffect_3d(argument0, argument1, argument2)
{
    var snd = event_play_oneshot(argument2);
    fmod_event_set3DPosition(snd, argument0, argument1, 0);
    return snd;
}
