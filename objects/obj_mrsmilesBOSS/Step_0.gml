scr_collision();

switch (state)
{
    case UnknownEnum.Value_0:
        hsp = movespeed * xscale;
        
        if (grounded)
            movespeed = approach(movespeed, 0, 1);
        
        break;
    
    case UnknownEnum.Value_34:
        hittimer--;
        
        if (grounded)
        {
            vsp = -5;
            movespeed = approach(movespeed, 0, 3.75);
        }
        
        hsp = movespeed * xscale;
        
        if (place_meeting(x + sign(hsp), y, obj_solid))
            xscale *= -1;
        
        if (hittimer <= 0)
            state = UnknownEnum.Value_0;
        
        break;
}

if (place_meeting(x, y, obj_player))
{
    with (obj_player)
    {
        baddieID = other.id;
        
        if (instakillmove && baddieID.state != UnknownEnum.Value_34)
        {
            if (state == UnknownEnum.Value_3)
                machhitanim = true;
            
            hitX = x;
            hitY = y;
            freezeframe = true;
            hitstuntimer = 5;
            hitstun = true;
            obj_camera.shake = 10;
            obj_camera.shake_mag = 15;
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/punch");
            baddieID.state = UnknownEnum.Value_34;
            
            if (key_jump)
                vsp = -10;
            
            with (baddieID)
            {
                movespeed = 15 * obj_player.xscale;
                vsp = -5;
                hittimer = 60;
                create_particle(spr_poofeffect, x, y, 1);
                create_particle(spr_kungfueffect, x, y, 1);
                instance_create_depth(x, y, -1, obj_slapstar);
                instance_create_depth(x, y, -1, obj_slapstar);
                instance_create_depth(x, y, -1, obj_slapstar);
            }
        }
    }
}
