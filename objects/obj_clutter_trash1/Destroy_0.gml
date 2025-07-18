if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id);
    var obj = instance_create_depth(x, y, -10, obj_baddiedead);
    obj.sprite_index = sprite_index;
    
    if (obj_player.x != x)
        obj.image_xscale = sign(obj_player.x - x);
    
    obj.hsp = obj_player.movespeed;
    fmod_soundeffect_3d(x, y, "event:/Sfx/General/trashhit");
    global.combotime += 10;
    global.combotime = clamp(global.combotime, 0, 60);
}
