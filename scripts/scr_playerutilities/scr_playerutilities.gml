function do_taunt()
{
    if (key_taunt2)
    {
        tauntsavedState = state;
        tauntsavedSprite = sprite_index;
        tauntsavedIndex = image_index;
        tauntsavedSpeed = image_speed;
        tauntsavedMovespeed = movespeed;
        tauntsavedVsp = vsp;
        hsp = 0;
        vsp = 0;
        state = UnknownEnum.Value_5;
        tauntTimer = 20;
        
        if (supertaunt && key_up)
        {
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/supertaunt");
            image_speed = 0.35;
            sprite_index = spr_player_supertaunt1;
            image_index = 0;
            supertaunt = false;
        }
        else
        {
            fmod_soundeffect_3d(x, y, "event:/Sfx/Player/taunt");
            image_speed = 0;
            sprite_index = spr_player_taunt;
            image_index = random_range(0, image_number);
            tauntTimer = 20;
        }
        
        instance_create_depth(x, y, depth, obj_parryhitbox);
        instance_create_depth(x, y, depth + 1, obj_taunteffect);
    }
}

function do_grab()
{
    if (key_slap2 && !key_up)
    {
        create_particle(spr_dustjump, x, y, xscale);
        
        if (!grounded)
            sprite_index = spr_player_suplexgrabjumpstart;
        else
            sprite_index = spr_player_suplexdash;
        
        image_index = 0;
        state = UnknownEnum.Value_9;
        
        if (movespeed < 8)
            movespeed = 8;
        
        fmod_event_play(grabsnd);
        fmod_event_set3DPosition(grabsnd, x, y, 0);
        fmod_event_setPause(grabsnd, false);
        grav = 0.5;
    }
    else if (key_slap2 && key_up)
    {
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/uppercut");
        create_particle(spr_highjump, x, y, 1);
        flash = true;
        sprite_index = spr_player_uppercut;
        image_index = 0;
        state = UnknownEnum.Value_19;
        
        if (grounded)
            vsp = -14;
        else
            vsp = -9;
    }
}

function player_reset()
{
    with (obj_player)
    {
        global.collect = 0;
        global.toppincount = 0;
        ds_list_clear(global.saveroom);
        ds_list_clear(global.escaperoom);
        ds_list_clear(global.followerlist);
        image_alpha = 1;
        global.escape = false;
        global.lap = false;
        global.combo = 0;
        global.combotime = 60;
        global.combodropped = false;
        global.fill = 100;
        obj_camera.lock = false;
        secretportalID = -4;
        combo = 0;
        hitX = x;
        hitY = y;
        hitstuntimer = 0;
        hitstun = false;
        instakillmove = false;
        tauntsavedState = 0;
        tauntsavedSprite = 0;
        tauntsavedIndex = 0;
        tauntsavedMovespeed = 0;
        tauntsavedVsp = 0;
        tauntsavedSpeed = 0;
        tauntTimer = 0;
        targetRoom = -4;
        targetDoor = "A";
        hallway = false;
        hallwaydirection = 1;
        baddieID = -4;
        grabbedID = -4;
        SjumpVsp = 0;
        c = 0;
        afterimagetimer = 0;
        crouchsliptimer = 0;
        flash = false;
        steppy = 0;
        combo = 0;
    }
}

function scr_playerstate()
{
    var _state = undefined;
    
    switch (state)
    {
        case UnknownEnum.Value_0:
            _state = scr_player_normal;
            break;
        
        case UnknownEnum.Value_1:
            _state = scr_player_jump;
            break;
        
        case UnknownEnum.Value_2:
            _state = scr_player_mach2;
            break;
        
        case UnknownEnum.Value_3:
            _state = scr_player_mach3;
            break;
        
        case UnknownEnum.Value_4:
            _state = scr_player_machslide;
            break;
        
        case UnknownEnum.Value_5:
            _state = scr_player_taunt;
            break;
        
        case UnknownEnum.Value_6:
            _state = scr_player_Sjumpprep;
            break;
        
        case UnknownEnum.Value_7:
            _state = scr_player_Sjump;
            break;
        
        case UnknownEnum.Value_8:
            _state = scr_player_walkfront;
            break;
        
        case UnknownEnum.Value_9:
            _state = scr_player_grab;
            break;
        
        case UnknownEnum.Value_10:
            _state = scr_player_tumble;
            break;
        
        case UnknownEnum.Value_11:
            _state = scr_player_wallsplat;
            break;
        
        case UnknownEnum.Value_12:
            _state = scr_player_hauling;
            break;
        
        case UnknownEnum.Value_13:
            _state = scr_player_finishingblow;
            break;
        
        case UnknownEnum.Value_14:
            _state = scr_player_enterdoor;
            break;
        
        case UnknownEnum.Value_15:
            _state = scr_player_freefall;
            break;
        
        case UnknownEnum.Value_30:
            _state = scr_player_freefallstart;
            break;
        
        case UnknownEnum.Value_16:
            _state = scr_player_freefallland;
            break;
        
        case UnknownEnum.Value_18:
        case UnknownEnum.Value_17:
            _state = scr_player_wallclimb;
            break;
        
        case UnknownEnum.Value_19:
            _state = scr_player_punch;
            break;
        
        case UnknownEnum.Value_20:
            _state = scr_player_crouch;
            break;
        
        case UnknownEnum.Value_21:
            _state = scr_player_actor;
            break;
        
        case UnknownEnum.Value_22:
            _state = scr_player_wallkick;
            break;
        
        case UnknownEnum.Value_23:
            _state = scr_player_hurt;
            break;
        
        case UnknownEnum.Value_24:
            _state = scr_player_tube;
            break;
        
        case UnknownEnum.Value_25:
            _state = scr_player_parry;
            break;
        
        case UnknownEnum.Value_26:
            _state = scr_player_noclip;
            break;
        
        case UnknownEnum.Value_27:
            _state = scr_player_spincancel;
            break;
        
        case UnknownEnum.Value_28:
            _state = scr_player_spinend;
            break;
        
        case UnknownEnum.Value_29:
            _state = scr_player_banana;
            break;
    }
    
    if (_state != undefined)
    {
        _state();
        var _s = string_split(script_get_name(_state), "_", false, 2);
        var _name = string("states.{0}", _s[array_length(_s) - 1]);
        statename = _name;
    }
    else
    {
        statename = "states.undefined";
    }
}

function scr_player_noclip()
{
    scr_mayniaGetInput();
    var spd = key_attack ? 20 : 10;
    var move = key_right + key_left;
    var move2 = key_down - key_up;
    y += (move2 * spd);
    x += (move * spd);
    hsp = 0;
    vsp = 0;
    
    if (key_jump2)
        state = UnknownEnum.Value_0;
}

function scr_player_actor()
{
    hsp = 0;
    vsp = 0;
    movespeed = 0;
}

function scr_player_tube()
{
    x += tubehsp;
    y += tubevsp;
    vsp = 0;
    hsp = 0;
}
