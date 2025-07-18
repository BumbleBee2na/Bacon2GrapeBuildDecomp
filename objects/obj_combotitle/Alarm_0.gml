if (lost)
{
    repeat (combopoint / 25)
    {
        global.collect += 25;
        var _sprite = asset_get_index(string("spr_collect{0}", irandom_range(1, 5)));
        create_collect(_sprite, drawx + irandom_range(-50, 50), drawy + irandom_range(-50, 50), true);
    }
    
    combopoint = 0;
}
