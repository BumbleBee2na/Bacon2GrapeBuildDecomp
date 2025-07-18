if (obj_player.sprite_index != spr_player_boogie)
{
    instance_destroy();
    fmod_event_stop(sound, true);
}
