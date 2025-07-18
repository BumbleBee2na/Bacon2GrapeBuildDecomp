if (sprite_index != spr_intro)
{
    event_inherited();
    
    if (ogx != x)
    {
        sprite_index = spr_walk;
        ogx = x;
    }
    else
    {
        sprite_index = spr_idle;
    }
}
else if (animation_end())
{
    sprite_index = spr_idle;
}

flame -= 0.2;
flame = clamp(flame, 0, 60);
