if (other.key_up2 && other.state == UnknownEnum.Value_0 && other.grounded)
{
    with (other)
    {
        global.level = other.level;
        global.leveltorestart = other.targetRoom;
        targetRoom = other.targetRoom;
        hubgotoroom = room;
        hubgotox = x;
        hubgotoy = y;
        targetDoor = "A";
        movespeed = 0;
        vsp = 0;
        hsp = 0;
        state = UnknownEnum.Value_14;
        ds_list_clear(global.saveroom);
        sprite_index = spr_player_entergate;
        image_index = 0;
        fmod_event_stop_all(false);
    }
}

if (other.sprite_index == spr_player_entergate && other.state == UnknownEnum.Value_14 && other.image_index == (other.image_number - 1) && !instance_exists(obj_titlecards))
{
    var _t = instance_create_depth(x, y, -150, obj_titlecards);
    _t.index = titlecardIndex;
    event_play_oneshot(titlecardMusic);
}
