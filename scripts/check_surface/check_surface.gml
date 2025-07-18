function check_surface(argument0, argument1, argument2)
{
    if (!surface_exists(argument0))
        argument0 = surface_create(argument1, argument2);
    
    return argument0;
}
