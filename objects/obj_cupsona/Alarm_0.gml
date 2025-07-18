global.collect += 1;
global.combotime += 1;
global.combotime = clamp(global.combotime, 0, 60);
points -= 1;
var _sprite = asset_get_index(string("spr_collect{0}", irandom_range(1, 5)));
create_collect(_sprite, x, y);

if (points > 0)
    alarm[0] = 1;
