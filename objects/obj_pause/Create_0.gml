scr_mayniaInput();
active = false;
selected = 0;
screensprite = -4;
guisprite = -4;
border1pos = [-256, 128];
border2pos = [288, -160];
borderindex = 0;
backalpha = 0;
options = ds_list_create();
snoozes = ds_list_create();
snoozes_aft = ds_list_create();
pausemu = fmod_createEventInstance("event:/Music/General/pause");

function create_option(argument0, argument1)
{
    var _opt = 
    {
        option: argument0,
        func: argument1
    };
    ds_list_add(options, _opt);
    return _opt;
}

function create_snooze()
{
    var _sn = 
    {
        image_index: irandom_range(0, sprite_get_number(spr_pause_zs)),
        x: random_range(200, 760),
        y: 570,
        image_alpha: 1,
        aft_timer: 10
    };
    ds_list_add(snoozes, _sn);
    return _sn;
}

function create_snooze_aft(argument0, argument1, argument2)
{
    var _sn = 
    {
        image_index: argument0,
        x: argument1,
        y: argument2,
        vsp: -1,
        image_alpha: 0.4
    };
    ds_list_add(snoozes_aft, _sn);
    return _sn;
}

function update_snooze()
{
    if (!ds_list_empty(snoozes_aft))
    {
        for (var i = 0; i < ds_list_size(snoozes_aft); i++)
        {
            var q = ds_list_find_value(snoozes_aft, i);
            
            if (is_struct(q))
            {
                q.vsp += 0.1;
                q.image_alpha -= 0.01;
                q.y += q.vsp;
                
                if (q.image_alpha <= 0)
                {
                    ds_list_delete(snoozes_aft, i);
                    i--;
                }
                
                draw_sprite_ext(spr_pause_zs, q.image_index, q.x, q.y, 1, 1, 0, c_white, q.image_alpha);
            }
        }
    }
    
    if (!ds_list_empty(snoozes))
    {
        for (var i = 0; i < ds_list_size(snoozes); i++)
        {
            var q = ds_list_find_value(snoozes, i);
            
            if (is_struct(q))
            {
                q.y -= 1;
                q.image_index += 1/30;
                
                if (q.y < 270)
                    q.image_alpha -= 0.01;
                
                q.aft_timer--;
                
                if (q.aft_timer <= 0)
                {
                    create_snooze_aft(q.image_index, q.x, q.y);
                    q.aft_timer = 20;
                }
                
                if (q.image_alpha <= 0)
                {
                    ds_list_delete(snoozes, i);
                    i--;
                }
                
                draw_sprite_ext(spr_pause_zs, q.image_index, q.x, q.y, 1, 1, 0, c_white, q.image_alpha);
            }
        }
    }
}

create_option("RESUME", function()
{
    instance_activate_all();
    fmod_event_setPause_all(false);
    fmod_event_stop(pausemu, true);
    fmod_update();
    
    with (obj_music)
    {
        if (!isSecret)
        {
            fmod_event_setPause(secretInst, true);
        }
        else
        {
            fmod_event_setPause(musicInst, true);
            fmod_event_setPause(panicInst, true);
        }
    }
    
    active = 0;
});
create_option("RESTART", function()
{
    if (global.leveltorestart != -4)
    {
        instance_activate_all();
        player_reset();
        
        if (instance_exists(obj_pizzaface))
            instance_destroy(obj_pizzaface);
        
        obj_player.movespeed = 0;
        obj_player.hsp = 0;
        obj_player.vsp = 0;
        fmod_event_stop_all(true);
        obj_music.music = -4;
        obj_music.isSecret = false;
        obj_music.savedMusicPosition = 0;
        room = global.leveltorestart;
        active = 0;
    }
});
create_option("OPTIONS", function()
{
    instance_create_depth(0, 0, depth - 1, obj_option);
});
create_option("EXIT LEVEL", function()
{
    if (global.level != "none")
    {
        instance_activate_all();
        player_reset();
        
        if (instance_exists(obj_pizzaface))
            instance_destroy(obj_pizzaface);
        
        global.leveltorestart = -4;
        obj_player.movespeed = 0;
        obj_player.hsp = 0;
        obj_player.vsp = 0;
        fmod_event_stop_all(true);
        obj_music.music = -4;
        obj_music.isSecret = false;
        obj_music.savedMusicPosition = 0;
        room = obj_player.hubgotoroom;
        obj_player.x = obj_player.hubgotox;
        obj_player.y = obj_player.hubgotoy + 14;
        obj_player.targetDoor = "HUB";
        global.level = "none";
        obj_music.lock = false;
        active = 0;
    }
    else
    {
        fmod_event_stop_all(true);
        instance_activate_all();
        player_reset();
        
        if (instance_exists(obj_pizzaface))
            instance_destroy(obj_pizzaface);
        
        obj_player.movespeed = 0;
        obj_player.hsp = 0;
        obj_player.vsp = 0;
        obj_player.state = UnknownEnum.Value_0;
        room = Mainmenu;
        global.level = "none";
        active = 0;
    }
});
alarm[0] = 60;
