if (!active)
{
    active = true;
    alarm[0] = 2;
    sprite_index = spr_cupsona1_trans;
    image_index = 0;
    fmod_soundeffect_3d(x, y, "event:/Sfx/General/bigcollect");
    fmod_soundeffect_3d(x, y, "event:/Sfx/Player/yeag");
}
