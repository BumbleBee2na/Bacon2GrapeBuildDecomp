function scr_player_wallclimb()
{
    scr_mayniaGetInput();
    hsp = 0;
    vsp = (state == UnknownEnum.Value_18) ? wallspeed : -wallspeed;
    move = key_right + key_left;
    image_speed = 0.6;
    
    if (move == xscale)
        wallspeed = approach(wallspeed, 24, 0.1);
    
    if (!key_attack)
    {
        state = UnknownEnum.Value_1;
        movespeed = 0;
        vsp = 0;
        sprite_index = spr_player_fall;
    }
    
    if (!place_meeting(x + (32 * xscale), y, obj_solid) || (state == UnknownEnum.Value_18 && grounded))
    {
        if (state == UnknownEnum.Value_18)
            xscale *= -1;
        
        if (wallspeed >= 12)
        {
            state = UnknownEnum.Value_3;
            movespeed = wallspeed;
            sprite_index = spr_player_mach3;
            vsp = 0;
        }
        else
        {
            state = UnknownEnum.Value_2;
            movespeed = wallspeed;
            sprite_index = spr_player_mach2;
            vsp = 0;
        }
    }
    
    if (key_jump2)
    {
        jumpstop = false;
        vsp = -14;
        xscale *= -1;
        movespeed = 0;
        sprite_index = spr_player_grabspinny;
        image_index = 0;
        state = UnknownEnum.Value_22;
        create_particle(spr_bounceeffect, x, y, 1);
    }
    
    if (place_meeting(x, y - 1, obj_solid) && !place_meeting(x, y - 1, obj_destrucitbles))
    {
        sprite_index = spr_player_bodyslamland;
        image_index = 0;
        vsp = 0;
        hsp = 0;
        state = UnknownEnum.Value_16;
        movespeed = abs(movespeed);
    }
}
