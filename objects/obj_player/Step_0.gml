if (state != UnknownEnum.Value_24)
    scr_collision();

if (vsp >= 20)
    vsp += 0.5;

if (flash == true && alarm[0] <= 0)
    alarm[0] = 0.15 * room_speed;

depth = 0;

if (!hitstun)
{
    scr_playerstate();
    
    if (state != UnknownEnum.Value_23)
        iframe = approach(iframe, 0, 1);
    
    if (y > (room_height + 500) && !instance_exists(obj_fuckinidiot) && state != UnknownEnum.Value_24)
        instance_create_depth(0, 0, 0, obj_fuckinidiot);
    
    if (state == UnknownEnum.Value_3 || state == UnknownEnum.Value_7 || state == UnknownEnum.Value_15 || state == UnknownEnum.Value_19 || state == UnknownEnum.Value_22 || state == UnknownEnum.Value_27)
        instakillmove = true;
    else
        instakillmove = false;
    
    if (state == UnknownEnum.Value_6 || state == UnknownEnum.Value_10 || state == UnknownEnum.Value_20)
        mask_index = spr_crouchmask;
    else
        mask_index = spr_player_mask;
    
    if (global.combo > 0 && !instance_exists(obj_fuckinidiot))
        global.combotime = approach(global.combotime, 0, 0.15);
    
    if ((global.combo % 5) == 0 && combo != global.combo)
    {
        combo = global.combo;
        instance_create_depth(0, 0, -10, obj_combotitle);
    }
    
    if ((global.combo % 10) == 0 && supertaunt == false)
        supertaunt = true;
    
    if (global.combotime == 0)
    {
        combo = global.combo;
        global.combo = 0;
        
        if (combo != global.combo && room != rank_room)
        {
            global.combodropped = true;
            
            with (instance_create_depth(0, 0, -10, obj_combotitle))
            {
                index = floor(other.combo / 5) - 1;
                combopoint = obj_player.combopoint;
                lost = true;
            }
            
            combo = global.combo;
            combopoint = 0;
        }
    }
    
    if (!instance_exists(chargeffect) && state == UnknownEnum.Value_3)
    {
        chargeffect = instance_create_depth(x, y, 1, obj_chargeeffect);
        
        with (chargeffect)
            playerid = obj_player;
    }
    
    if (!instance_exists(lineseffect) && (state == UnknownEnum.Value_3 || state == UnknownEnum.Value_2))
    {
        lineseffect = instance_create_depth(x, y, 1, obj_speedlines);
        
        with (lineseffect)
            playerid = obj_player;
    }
    
    jump_buffer = approach(jump_buffer, 0, 1);
}
else
{
    scr_mayniaGetInput();
    
    if (key_jump)
        jump_buffer = 2;
    
    if (hitstuntimer > 0)
    {
        image_speed = 0;
        
        if (!instance_exists(obj_fadeout))
        {
            x = hitX + irandom_range(-4, 4);
            y = hitY + irandom_range(-4, 4);
        }
        
        hitstuntimer--;
    }
    else if (hitstuntimer <= 0)
    {
        hitstun = false;
        
        if (!instance_exists(obj_fadeout))
        {
            x = hitX;
            y = hitY;
        }
    }
}
