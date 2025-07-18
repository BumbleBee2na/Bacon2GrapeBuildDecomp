if (image_alpha == 1)
{
    global.collect += 10;
    global.combotime += 10;
    global.combotime = clamp(global.combotime, 0, 60);
    create_collect(sprite_index, x, y);
    ds_list_add(global.escaperoom, id);
    fmod_soundeffect_3d(x, y, "event:/Sfx/General/escapecollect");
    instance_destroy();
    instance_create_depth(x + 16, y, -200, obj_smallnumber).val = "10";
}
