function scr_player_hauling()
{
    scr_mayniaGetInput();
    hsp = movespeed * xscale;
    move = key_right + key_left;
    steppy = approach(steppy, 0, 0.35);
    
    if (!instance_exists(grabbedID))
    {
        grabbedID = -4;
        state = UnknownEnum.Value_0;
    }
    
    if (move != 0)
    {
        if (sprite_index != spr_player_haulingland || sprite_index != spr_player_haulingfall || sprite_index != spr_player_haulingjump || sprite_index != spr_player_haulingstart)
            sprite_index = spr_player_haulingwalk;
        
        image_speed = movespeed / 15;
        
        if ((floor(image_index) == 0 || floor(image_index) == 4) && steppy <= 0)
        {
            steppy = 2;
            create_particle(spr_cloudeffect, x, y + 42, 1);
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/step");
        }
        
        xscale = move;
        movespeed = approach(movespeed, 7, 0.5);
    }
    else
    {
        if (sprite_index != spr_player_haulingland || sprite_index != spr_player_haulingfall || sprite_index != spr_player_haulingjump || sprite_index != spr_player_haulingstart)
            sprite_index = spr_player_haulingidle;
        
        image_speed = 0.35;
        movespeed = 0;
    }
    
    if (!grounded && sprite_index != spr_player_haulingstart && sprite_index != spr_player_haulingjump)
    {
        sprite_index = spr_player_haulingfall;
        image_index = 0;
    }
    
    if (!jumpstop)
    {
        if (!key_jump && vsp < 0)
        {
            vsp /= 20;
            jumpstop = true;
        }
    }
    
    if (key_jump && grounded)
    {
        sprite_index = spr_player_haulingjump;
        jumpstop = false;
        image_index = 0;
        vsp = -11;
    }
    
    if (grounded && (sprite_index == spr_player_haulingjump || sprite_index == spr_player_haulingland))
    {
        sprite_index = spr_player_haulingland;
        image_index = 0;
    }
    
    if (key_slap2)
    {
        sprite_index = spr_player_finishingblow5;
        image_index = 0;
        state = UnknownEnum.Value_13;
        steppy = 0;
    }
    
    if (key_down && grounded)
    {
        sprite_index = spr_player_crouch;
        image_index = 0;
        state = UnknownEnum.Value_20;
        
        with (grabbedID)
        {
            vsp = -2;
            xscale = -obj_player.xscale;
            sprite_index = spr_stun;
            scaredtimer = 120;
            stunbuffer = 15;
            state = UnknownEnum.Value_31;
            movespeed = other.movespeed;
        }
        
        grabbedID = -4;
    }
}

function scr_player_finishingblow()
{
    scr_mayniaGetInput();
    afterimagetimer = approach(afterimagetimer, 0, 1);
    
    if (afterimagetimer == 0)
    {
        create_afterimage(sprite_index, image_index, x, y, xscale, 0.5);
        afterimagetimer = 6;
    }
    
    image_speed = 0.35;
    hsp = movespeed * xscale;
    move = key_right + key_left;
    steppy = approach(steppy, 0, 0.35);
    
    if (floor(image_index) == 5 && steppy <= 0)
    {
        vsp = -5;
        steppy = 2;
        grabbedID.hitHsp = 30 * other.xscale;
        grabbedID.hitVsp = 0;
        grabbedID.state = UnknownEnum.Value_36;
        grabbedID = -4;
    }
    
    if (animation_end())
        state = UnknownEnum.Value_0;
}
