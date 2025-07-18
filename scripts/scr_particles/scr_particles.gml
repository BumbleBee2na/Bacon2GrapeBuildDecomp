function create_particle(argument0, argument1, argument2, argument3, argument4 = 1)
{
    var par = 
    {
        sprite_index: argument0,
        image_index: 0,
        x: argument1,
        y: argument2,
        image_xscale: argument3,
        depth: argument4
    };
    ds_list_add(obj_particlecontroller.particles, par);
    return par;
}

function create_collect(argument0, argument1, argument2, argument3 = false)
{
    if (argument3 == false)
    {
        argument1 -= camera_get_view_x(view_camera[0]);
        argument2 -= camera_get_view_y(view_camera[0]);
    }
    
    var par = 
    {
        sprite_index: argument0,
        x: argument1,
        y: argument2,
        hsp: 0,
        vsp: 0
    };
    ds_list_add(obj_camera.collectables, par);
    return par;
}
