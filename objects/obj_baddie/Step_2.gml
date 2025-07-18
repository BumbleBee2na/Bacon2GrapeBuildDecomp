if (place_meeting(x, y, obj_player))
{
    with (obj_player)
    {
        baddieID = other.id;
        
        if (instakillmove && baddieID.state != UnknownEnum.Value_34)
        {
            baddieID.hitX = baddieID.x;
            baddieID.hitY = baddieID.y;
            
            if (state == UnknownEnum.Value_3)
                machhitanim = true;
            
            hitX = x;
            hitY = y;
            baddieID.freezeframe = true;
            baddieID.hitstuntimer = 5;
            freezeframe = true;
            hitstuntimer = 5;
            hitstun = true;
            obj_camera.shake = 10;
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/punch");
            baddieID.state = UnknownEnum.Value_34;
            
            if (key_jump)
                vsp = -10;
        }
        
        if (state == UnknownEnum.Value_9)
        {
            sprite_index = spr_player_haulingstart;
            image_index = 0;
            state = UnknownEnum.Value_12;
            baddieID = -4;
            grabbedID = other.id;
            grabbedID.state = UnknownEnum.Value_35;
        }
        
        if (state == UnknownEnum.Value_2 || (state == UnknownEnum.Value_10 && baddieID.stunbuffer <= 0))
        {
            with (baddieID)
            {
                vsp = -5;
                xscale = -obj_player.xscale;
                sprite_index = spr_stun;
                scaredtimer = 120;
                stunbuffer = 15;
                state = UnknownEnum.Value_31;
                movespeed = abs(12 + (other.movespeed / 2)) * other.xscale;
            }
        }
    }
}
