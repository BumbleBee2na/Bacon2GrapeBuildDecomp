function scr_player_parry()
{
    grav = 0.5;
    scr_mayniaGetInput();
    image_speed = 0.35;
    hsp = movespeed * xscale;
    movespeed = approach(movespeed, 0, 0.5);
    
    if (animation_end())
    {
        state = UnknownEnum.Value_0;
        sprite_index = spr_player_idle;
        image_index = 0;
    }
}
