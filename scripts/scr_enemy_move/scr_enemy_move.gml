function scr_enemy_move()
{
    hsp = movespeed * xscale;
    movespeed = 1;
    
    if (place_meeting(x + xscale, y, obj_solid) || place_meeting(x + xscale, y, obj_hallway) || (x + hsp) > (room_width + 50) || (x + hsp) < -50 || (!(place_meeting(x + (xscale * 15), y + 31, par_solid) || place_meeting(x + (xscale * 15), y + 31, obj_platform)) && grounded))
        xscale *= -1;
    
    if (point_distance(x, 0, obj_player.x, 0) <= 320 && point_distance(0, y, 0, obj_player.y) <= 160 && obj_player.state == UnknownEnum.Value_3)
    {
        vsp = -5;
        
        if (obj_player.x != x)
            xscale = sign(obj_player.x - x);
        
        sprite_index = spr_scared;
        scaredtimer = 120;
        state = UnknownEnum.Value_32;
    }
}
