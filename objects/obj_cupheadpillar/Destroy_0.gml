if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create_depth(x, y, -10, obj_baddiedead))
    {
        image_xscale = other.image_xscale;
        sprite_index = spr_cuphead_dead;
    }
    
    fmod_soundeffect_3d(x, y, "event:/Sfx/General/cupdead");
    ds_list_add(global.saveroom, id);
    instance_create_depth(x, y, -500, obj_flash);
    instance_create_depth(x, y, -300, obj_sigmasigma);
    global.combo += 1;
    global.combotime = 60;
    global.escape = true;
    global.fill = 12600;
}
