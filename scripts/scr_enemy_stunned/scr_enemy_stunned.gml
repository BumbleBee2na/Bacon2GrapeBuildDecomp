function scr_enemy_stunned()
{
    if (grounded)
        movespeed = approach(movespeed, 0, 1);
    
    hsp = movespeed;
    
    if (scaredtimer <= 0)
    {
        state = UnknownEnum.Value_33;
        sprite_index = spr_walk;
    }
    else
    {
        scaredtimer--;
    }
}
