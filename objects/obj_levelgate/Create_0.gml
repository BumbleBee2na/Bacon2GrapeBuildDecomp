image_speed = 0;
depth = 30;
gateinfo = ds_list_create();

function create_gate_layer(argument0, argument1, argument2, argument3, argument4, argument5, argument6 = false)
{
    var q = 
    {
        sprite_index: argument0,
        image_index: argument1,
        bgx: argument2,
        bgy: argument3,
        hsp: argument4,
        vsp: argument5,
        parallax: argument6
    };
    ds_list_add(gateinfo, q);
    return q;
}

create_gate_layer(spr_gate_entranceBG, 2, 0, 0, 0.25, 0);
create_gate_layer(spr_gate_entranceBG, 1, 0, 0, 0.35, 0);
create_gate_layer(spr_gate_entranceBG, 0, 0, 0, 0.45, 0);
bgalpha = 1;
visibleradius = 250;
leveltext = "Rock Bottom";
level = "rockB";
targetRoom = bottom_1;
textalpha = 0;
drawing = 0;
titlecardMusic = "event:/Music/W1/Rock Bottom/bottomtitle";
titlecardIndex = 0;
