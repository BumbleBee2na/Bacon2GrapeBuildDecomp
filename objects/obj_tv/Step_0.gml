var roomname = room_get_name(room);
roomname = string_letters(roomname);

if (room == rm_init || room == rank_room || room == hub_hallway || room == hub_1 || room == rm_intro || room == Mainmenu || roomname == "tutorial")
    visible = false;
else
    visible = true;

image_speed = 0.35;
var p = obj_player;
idle = spr_tv_idle;

if (global.combo >= 3)
    idle = spr_tv_combo;

if (global.escape)
    idle = spr_tv_panic;

switch (state)
{
    case UnknownEnum.Value_39:
        switch (sprite_index)
        {
            case spr_tv_panic:
            case spr_tv_combo:
                if (sprite_index != idle)
                    tv_anim(idle);
                
                if (p.state == UnknownEnum.Value_3)
                    tv_anim(spr_tv_exprmach);
                
                break;
            
            case spr_tv_idle:
                if (sprite_index != idle)
                    tv_anim(idle);
                
                idletimer--;
                
                if (idletimer <= 0)
                {
                    image_index = 0;
                    sprite_index = choose(spr_tv_idleanim1, spr_tv_idleanim2);
                    idletimer = random_range(180, 360);
                }
                
                if (p.state == UnknownEnum.Value_3)
                    tv_anim(spr_tv_exprmach);
                
                break;
            
            case spr_tv_idleanim1:
            case spr_tv_idleanim2:
                if (animation_end())
                    sprite_index = spr_tv_idle;
                
                if (p.state == UnknownEnum.Value_3)
                    tv_anim(spr_tv_exprmach);
                
                break;
            
            case spr_tv_exprmach:
                if (p.state != UnknownEnum.Value_3 && p.state != UnknownEnum.Value_4)
                    tv_anim(idle);
                
                if (p.mach4)
                    tv_anim(spr_tv_exprmach4);
                
                break;
            
            case spr_tv_exprmach4:
                if (p.state != UnknownEnum.Value_3 && p.state != UnknownEnum.Value_4)
                    tv_anim(idle);
                
                if (!p.mach4)
                    tv_anim(spr_tv_exprmach);
                
                break;
            
            case spr_tv_collect:
                expressiontimer = approach(expressiontimer, 0, 1);
                
                if (expressiontimer <= 0)
                    tv_anim(idle);
                
                break;
        }
        
        break;
    
    case UnknownEnum.Value_38:
        switchindex = approach(switchindex, sprite_get_number(spr_tv_whitenoise) - 1, 0.35);
        
        if (switchindex >= (sprite_get_number(spr_tv_whitenoise) - 1))
        {
            sprite_index = expressionsprite;
            switchindex = 0;
            state = UnknownEnum.Value_39;
        }
        
        break;
}

switch (combopart)
{
    case 0:
        comboY = approach(comboY, -160, 5) + irandom_range(comboshake, -comboshake);
        combovsp = 0;
        
        if (global.combo > 0)
        {
            combopart++;
            combovsp = 5;
        }
        
        break;
    
    case 1:
        comboY = approach(comboY, 45, combovsp);
        combovsp += 0.5;
        
        if (comboY >= 45)
            combopart++;
        
        break;
    
    case 2:
        comboY = lerp(comboY, 35 + wave(-2, 2, 4, 0), 0.1) + irandom_range(comboshake, -comboshake);
        
        if (global.combo <= 0)
            combopart = 0;
        
        break;
}

combopalindex = approach(combopalindex, !global.combodropped, 0.011904761904761904);
comboX = 633 + wave(-2, 2, 2, 0) + irandom_range(comboshake, -comboshake);
teapos = lerp(teapos, ((60 - global.combotime) / 60) * 50, 0.4);

if (global.combotime < 30)
    comboshake = (8 * (30 - global.combotime)) / 30;
else
    comboshake = 0;

if (global.escape)
{
    if (escapeStart == false)
    {
        escapeStart = true;
        chunkmax = global.fill;
    }
    
    global.fill = approach(global.fill, 0, 1);
    timerpos = approach(timerpos, 0, 1);
}
else
{
    timerpos = 100;
    escapeStart = false;
}
