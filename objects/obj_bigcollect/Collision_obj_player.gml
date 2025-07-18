global.collect += 100;
global.combotime = 60;
create_collect(sprite_index, x, y);
ds_list_add(global.saveroom, id);
instance_destroy();
fmod_soundeffect_3d(x, y, "event:/Sfx/General/bigcollect");
fmod_soundeffect_3d(x, y, "event:/Sfx/Player/yeag");
instance_create_depth(x + 16, y, -200, obj_smallnumber).val = "100";

with (obj_tv)
    tv_anim(spr_tv_collect, 120);
