global.rooms = [];

for (var i = 0; room_exists(i); i++)
    global.rooms[i] = room_get_name(i);

function meta_escape()
{
    return 
    {
        arguments: ["bool", "minutes", "seconds"],
        suggestions: [["true", "false"]],
        description: "enables escape sequence"
    };
}

function sh_escape(argument0)
{
    if (argument0[1] == "true")
        global.escape = true;
    else if (argument0[1] == "false")
        global.escape = false;
    else if (!is_bool(argument0[1]))
        global.escape = !global.escape;
    
    global.fill = real((argument0[2] * 60 * 60) + (argument0[3] * 60));
    
    if (global.escape)
    {
        instance_create_depth(x, y, -500, obj_flash);
        instance_create_depth(x, y, -300, obj_sigmasigma);
    }
}

function meta_goto_room()
{
    return 
    {
        arguments: ["room", "door"],
        suggestions: [global.rooms, ["A", "B", "C", "D", "E", "S"]],
        description: "teleports player into specified room."
    };
}

function sh_goto_room(argument0)
{
    with (obj_player)
    {
        targetRoom = asset_get_index(argument0[1]);
        targetDoor = argument0[2];
        hallway = false;
        
        with (instance_create_depth(x, y, 0, obj_fadeout))
            targetRoom = other.targetRoom;
    }
}

function meta_set_combo()
{
    return 
    {
        arguments: ["value"],
        description: "sets your combo"
    };
}

function sh_set_combo(argument0)
{
    var val = real(argument0[1]);
    
    if (!is_string(val))
    {
        global.combo = val;
        global.combotime = 60;
        global.collect += (20 * val);
    }
}

function meta_toggle_collisions()
{
    return 
    {
        arguments: ["bool"],
        suggestions: [["true", "false"]],
        description: "toggles collisions"
    };
}

function sh_toggle_collisions(argument0)
{
    if (argument0[1] == "true")
        global.showcollisions = true;
    else if (argument0[1] == "false")
        global.showcollisions = false;
    else if (!is_bool(argument0[1]))
        global.showcollisions = !global.showcollisions;
}

function meta_toggle_debug()
{
    return 
    {
        arguments: ["bool"],
        suggestions: [["true", "false"]],
        description: "toggles debugging mode"
    };
}

function sh_toggle_debug(argument0)
{
    if (argument0[1] == "true")
        global.debug = true;
    else if (argument0[1] == "false")
        global.debug = false;
    else if (!is_bool(argument0[1]))
        global.debug = !global.debug;
}

function meta_noclip()
{
    return 
    {
        arguments: [],
        suggestions: [],
        description: "toggles noclip"
    };
}

function sh_noclip(argument0)
{
    if (obj_player.state != UnknownEnum.Value_26)
    {
        obj_player.state = UnknownEnum.Value_26;
        obj_player.sprite_index = spr_player_idle;
    }
    else
    {
        obj_player.state = UnknownEnum.Value_0;
        obj_player.sprite_index = spr_player_idle;
    }
}
