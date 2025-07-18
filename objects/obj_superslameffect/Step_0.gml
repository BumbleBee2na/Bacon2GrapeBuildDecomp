if (playerid == obj_player)
{
    if (playerid.state != UnknownEnum.Value_15)
        instance_destroy();
    
    x = playerid.x;
    y = playerid.y;
    image_xscale = playerid.xscale;
    image_angle = playerid.angle;
}
