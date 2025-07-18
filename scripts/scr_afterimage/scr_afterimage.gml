function create_afterimage(argument0, argument1, argument2, argument3, argument4, argument5 = 1)
{
    var aft = 
    {
        sprite_index: argument0,
        image_index: argument1,
        x: argument2,
        y: argument3,
        image_xscale: argument4,
        image_blend: choose(8512228, 14990225, 45056),
        alarm: [15, 5, -2],
        type: UnknownEnum.Value_0,
        alpha: argument5,
        image_alpha: 1
    };
    ds_list_add(obj_afterimagecontroller.afterimages, aft);
    return aft;
}

function create_blur_afterimage(argument0, argument1, argument2, argument3, argument4)
{
    var aft = 
    {
        sprite_index: argument0,
        image_index: argument1,
        x: argument2,
        y: argument3,
        image_xscale: argument4,
        image_blend: c_white,
        alarm: [15, 5, -2],
        type: UnknownEnum.Value_1,
        alpha: 0.8,
        image_alpha: 1
    };
    ds_list_add(obj_afterimagecontroller.afterimages, aft);
    return aft;
}

function create_attack_afterimage(argument0, argument1, argument2, argument3, argument4)
{
    var aft = 
    {
        sprite_index: argument0,
        image_index: argument1,
        x: argument2,
        y: argument3,
        image_xscale: argument4,
        image_blend: c_white,
        alarm: [15, 5, -2],
        type: UnknownEnum.Value_2,
        alpha: 0.8,
        image_alpha: 1
    };
    ds_list_add(obj_afterimagecontroller.afterimages, aft);
    return aft;
}
