if (other.state == UnknownEnum.Value_24 && hit == false)
{
    with (obj_player)
    {
        state = UnknownEnum.Value_24;
        tubehsp = 0;
        tubevsp = 0;
        x = other.x;
        y = other.y;
    }
    
    hit = true;
    alarm[0] = 15;
    fmod_soundeffect_3d(x, y, "event:/Sfx/General/metalbreak");
    obj_camera.shake = 30;
    
    repeat (5)
    {
        with (instance_create_depth(x + 16, y + 16, depth, obj_slapstar))
        {
            hsp = random_range(-10, 10);
            vsp = random_range(-10, 10);
            image_speed = 0.35;
            sprite_index = spr_towerblockdebris;
        }
    }
    
    if (chance(0.25))
    {
        with (instance_create_depth(x, y, -10, obj_baddiedead))
        {
            image_xscale = choose(1, -1);
            sprite_index = spr_kibidi_dead;
            hsp = choose(10, 15);
            vsp = choose(-5, -10);
        }
        
        create_particle(spr_poofeffect, x, y, 1);
        create_particle(spr_kungfueffect, x, y, 1);
        instance_create_depth(x, y, -1, obj_slapstar);
        instance_create_depth(x, y, -1, obj_slapstar);
        instance_create_depth(x, y, -1, obj_slapstar);
        fmod_soundeffect_3d(x, y, "event:/Sfx/General/killenemy");
        global.combo += 1;
        global.combotime = 60;
        global.collect += 20;
    }
}
