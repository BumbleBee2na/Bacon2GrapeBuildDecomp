if (playerid == obj_player)
{
    if (playerid.state != UnknownEnum.Value_3 && playerid.state != UnknownEnum.Value_2)
        instance_destroy();
    
    x = playerid.x;
    y = playerid.y;
    image_xscale = playerid.xscale;
    image_angle = playerid.angle;
}
