var _door = asset_get_index("obj_door" + targetDoor);

if (is_string(targetDoor))
{
    _door = asset_get_index("obj_door" + targetDoor);
    
    if (instance_exists(_door))
    {
        if (hallway != 2)
        {
            var pad = hallway ? (192 * hallwaydirection) : 16;
            x = _door.x + pad;
            y = _door.y - 14;
        }
        else
        {
            x = _door.x + 16 + savedpos;
            y = _door.y - (192 * hallwaydirection);
            vsp = savedspd;
        }
    }
}

if (place_meeting(x, y, obj_exitgate) || place_meeting(x, y, obj_levelgate) || place_meeting(x, y, obj_door))
{
    state = UnknownEnum.Value_8;
    c = 0;
    image_index = 0;
    sprite_index = spr_player_walkfront;
}

if (instance_exists(obj_pizzaface))
{
    with (obj_pizzaface)
    {
        x = obj_player.x;
        y = obj_player.y;
        image_alpha = 0;
    }
}

roomstartx = x;
roomstarty = y;
hallway = false;

with (obj_followplayer)
{
    ds_queue_clear(followqueue);
    gx = obj_player.x;
    gy = obj_player.y;
    x = gx;
    y = gy;
}
