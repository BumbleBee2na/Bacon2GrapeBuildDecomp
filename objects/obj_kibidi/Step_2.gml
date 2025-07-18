scr_collision();

if (vsp >= 10)
    vsp += grav;

if (hitstuntimer <= 0)
{
    image_speed = 0.35;
    event_inherited();
    stunbuffer = approach(stunbuffer, 0, 1);
    
    switch (state)
    {
        case UnknownEnum.Value_36:
            scr_enemy_thrown();
            break;
        
        case UnknownEnum.Value_35:
            scr_enemy_grabbed();
            break;
        
        case UnknownEnum.Value_33:
            scr_enemy_move();
            break;
        
        case UnknownEnum.Value_32:
            scr_enemy_scared();
            break;
        
        case UnknownEnum.Value_31:
            scr_enemy_stunned();
            break;
        
        case UnknownEnum.Value_34:
            scr_enemy_hit();
            break;
    }
}
else if (hitstuntimer > 0)
{
    image_speed = 0;
    x = hitX + irandom_range(-1, 1);
    y = hitY + irandom_range(-1, 1);
    hitstuntimer--;
}
else if (hitstuntimer <= 0)
{
    x = hitX;
    y = hitY;
}
