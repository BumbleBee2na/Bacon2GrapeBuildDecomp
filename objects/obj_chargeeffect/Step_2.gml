if (playerid == obj_player)
{
    if (playerid.state != UnknownEnum.Value_3)
        instance_destroy();
    
    x = playerid.x + (10 * image_xscale);
    y = playerid.y;
    image_xscale = playerid.xscale;
    image_angle = playerid.angle;
}
