function scr_collision_init()
{
    vsp = 0;
    hsp = 0;
    grav = 0;
    grounded = false;
    coyote_time = 0;
    can_coyote = true;
}

function scr_collision_new()
{
    var o_y = y;
    var distance = 0;
    var maxdist = 32;
    
    while (place_meeting_slope(hsp, 0))
    {
        var slope_inst = scr_slope_get(hsp, 0);
        
        if (sign(hsp) != -slope_inst.image_xscale)
            y--;
    }
    
    if (vsp >= 0 && !place_meeting(x + hsp, y + 1, par_solid) && place_meeting(x + hsp, y + 32, par_solid) && place_meeting_slope())
    {
        var i = 0;
        
        while (!place_meeting(x + hsp, y + 1, par_solid))
        {
            i++;
            y += 1;
            
            if (i > 32)
                break;
        }
    }
    
    x += hsp;
    var _hsp = sign(hsp);
    
    while (place_meeting(x, y, par_solid) && _hsp != 0)
    {
        x -= _hsp;
        hsp = 0;
    }
    
    y += floor(vsp);
    var _vsp = sign(vsp);
    
    while (place_meeting(x, y, par_solid) && _vsp != 0)
    {
        y -= _vsp;
        vsp = 0;
    }
    
    if (place_meeting(x, y, obj_platform))
    {
        if ((o_y - vsp) < instance_place(x, y, obj_platform).bbox_top && vsp > 0)
        {
            while (place_meeting(x, y, obj_platform) && _vsp != 0)
            {
                y -= _vsp;
                vsp = 0;
            }
        }
    }
}

function scr_collision()
{
    var _ground = (place_meeting(x, y + 1, par_solid) && vsp >= 0) || ((place_meeting(x, y + 1, obj_platform) && (bbox_bottom - 1) < instance_place(x, y + 1, obj_platform).y) && vsp >= 0) || (place_meeting_slope(hsp, 0) && vsp >= 0);
    scr_collision_new();
    
    if (_ground == false && can_coyote == true && vsp >= 0)
    {
        coyote_time = 5;
        can_coyote = false;
    }
    
    coyote_time = approach(coyote_time, 0, 1);
    
    if (_ground)
    {
        can_coyote = true;
        coyote_time = 0;
    }
    
    if (coyote_time == 0)
        grounded = _ground;
    
    if (grounded)
        y = floor(y);
    
    if (vsp < 20)
        vsp += grav;
}

function place_meeting_slope(argument0 = 0, argument1 = 1)
{
    return place_meeting(x + argument0, y + argument1, obj_slope);
}

function scr_slope_get(argument0 = 0, argument1 = 1)
{
    return instance_place(x + argument0, y + argument1, obj_slope);
}

function place_meeting_solid(argument0 = 0, argument1 = 1)
{
    return place_meeting(x + argument0, y + argument1, obj_solid);
}
