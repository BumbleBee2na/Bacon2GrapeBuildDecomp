if (animation_end() && sprite_index == spr_cupsona1_trans)
    sprite_index = spr_cupsona1_end;

if (points == 0 && active && state == 0)
    state = 1;

if (state == 1)
{
    sprite_index = spr_cupsona1_idle;
    y -= 12;
    image_alpha -= 0.04;
    
    if (image_alpha <= 0)
        instance_destroy();
}
