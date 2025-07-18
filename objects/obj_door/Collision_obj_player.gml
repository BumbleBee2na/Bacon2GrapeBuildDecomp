if (other.grounded && other.key_up && other.state != UnknownEnum.Value_14 && other.state != UnknownEnum.Value_8)
{
    with (obj_player)
    {
        targetRoom = other.targetRoom;
        targetDoor = other.targetDoor;
        hallway = false;
        
        with (instance_create_depth(x, y, 0, obj_fadeout))
            targetRoom = other.targetRoom;
        
        movespeed = 0;
        vsp = 0;
        hsp = 0;
        state = UnknownEnum.Value_14;
        sprite_index = spr_player_lookdoor;
        image_index = 0;
    }
}
