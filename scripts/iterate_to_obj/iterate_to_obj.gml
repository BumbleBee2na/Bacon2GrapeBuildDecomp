function iterate_to_obj(argument0, argument1, argument2 = par_solid, argument3 = 1)
{
    var o_x = x;
    var o_y = y;
    var iteration = 0;
    
    repeat (argument3)
    {
        x += argument0;
        y += argument1;
        
        if (place_meeting(x, y, argument2))
            break;
        else
            iteration++;
    }
    
    x = o_x;
    y = o_y;
    return iteration;
}
