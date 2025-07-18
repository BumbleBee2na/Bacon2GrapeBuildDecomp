function scr_player_taunt()
{
    hsp = 0;
    vsp = 0;
    
    if (sprite_index != spr_player_supertaunt1)
    {
        image_speed = 0;
        tauntTimer--;
        
        if (tauntTimer <= 0)
        {
            state = tauntsavedState;
            sprite_index = tauntsavedSprite;
            image_index = tauntsavedIndex;
            image_speed = tauntsavedSpeed;
            movespeed = tauntsavedMovespeed;
            vsp = tauntsavedVsp;
        }
    }
    else
    {
        image_speed = 0.35;
        
        if (animation_end())
        {
            state = tauntsavedState;
            sprite_index = tauntsavedSprite;
            image_index = tauntsavedIndex;
            image_speed = tauntsavedSpeed;
            movespeed = tauntsavedMovespeed;
            vsp = tauntsavedVsp;
            
            with (obj_baddie)
            {
                if (in_camera())
                    instance_destroy();
            }
        }
    }
}
