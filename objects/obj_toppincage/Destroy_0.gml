if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id);
    instance_create_depth(x, y, 5, content);
    fmod_soundeffect_3d(x, y, "event:/Sfx/General/toppinget");
    fmod_soundeffect_3d(x, y, "event:/Sfx/Player/yeag");
    global.combotime = 60;
    
    with (obj_tv)
        tv_anim(spr_tv_collect, 120);
}
