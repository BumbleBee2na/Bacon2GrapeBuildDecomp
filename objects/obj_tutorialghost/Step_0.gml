if (distance_to_object(obj_player) <= 160)
    state = 1;

if (state == 1)
{
    var point = point_direction(x, y, targetsolid.x, targetsolid.y);
    x += lengthdir_x(32 + movespeed, point);
    y += lengthdir_y(32 + movespeed, point);
    movespeed += 0.1;
    
    if (distance_to_object(targetsolid) <= 32)
    {
        instance_destroy();
        targetsolid.possessed = true;
    }
}
