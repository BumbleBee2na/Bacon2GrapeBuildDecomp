if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id);
    fmod_soundeffect_3d(x, y, "event:/Sfx/General/breakblock");
    global.collect += 100;
    instance_create_depth(x + 16, y, -200, obj_smallnumber).val = "100";
    
    repeat (8)
    {
        with (instance_create_depth(x + 16, y + 16, depth, obj_slapstar))
        {
            hsp = random_range(-10, 10);
            image_speed = 0.35;
            sprite_index = spr_towerblockdebris;
        }
    }
}
