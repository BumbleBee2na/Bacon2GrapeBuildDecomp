with (obj_player)
{
    state = UnknownEnum.Value_29;
    sprite_index = spr_player_outofpizza1;
    image_index = 0;
    vsp = -15;
    
    if (movespeed < 12)
        movespeed = 12;
    
    fmod_soundeffect_3d(x, y, "event:/Sfx/Player/slip");
}

instance_destroy();
