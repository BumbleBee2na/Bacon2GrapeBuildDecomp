var obj = other;

with (obj)
{
    if (baddieID.state == UnknownEnum.Value_33 && other.state != UnknownEnum.Value_23 && other.iframe <= 0)
    {
        with (other)
        {
            vsp = -10;
            movespeed = 0;
            state = UnknownEnum.Value_23;
            hsp = 10 * -xscale;
            global.collect -= 50;
            global.combotime /= 2;
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/hurt");
            iframe = 60;
            
            if (instance_exists(grabbedID))
            {
                with (grabbedID)
                {
                    vsp = -5;
                    xscale = -obj_player.xscale;
                    sprite_index = spr_stun;
                    scaredtimer = 120;
                    stunbuffer = 15;
                    state = UnknownEnum.Value_31;
                    movespeed = abs(6 + (other.movespeed / 2)) * other.xscale;
                }
                
                grabbedID = -4;
            }
        }
    }
}
