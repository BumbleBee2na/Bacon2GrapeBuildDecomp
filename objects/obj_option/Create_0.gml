scr_mayniaInput();
buffer = 0;
menus = [];
currentmenu = 0;
selected = 0;
move = 0;
backgrounds = [[0, 1], [1, 0], [2, 0], [4, 0], [3, 0]];
BGX = wave(-32, 32, 5, 0);
BGY = 0;
slidersnd = fmod_createEventInstance("event:/Sfx/UI/Pause/slider");

function goto_menu(argument0)
{
    for (var i = 0; i < array_length(menus); i++)
    {
        var m = menus[i];
        
        if (m.menuid == argument0)
            currentmenu = i;
    }
    
    selected = 0;
}

function create_menu(argument0, argument1, argument2, argument3)
{
    var _opt = 
    {
        menuid: argument0,
        anchor: argument1,
        ypad: argument2,
        options: [],
        backfunc: argument3
    };
    return _opt;
}

function add_option_press(argument0, argument1, argument2)
{
    var q = 
    {
        name: argument1,
        func: argument2,
        type: UnknownEnum.Value_7,
        selecting: false
    };
    array_push(argument0.options, q);
    return q;
}

function add_option_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6 = ["OFF", "ON"])
{
    var q = 
    {
        name: argument2,
        func: argument3,
        val: argument4,
        toggle: argument6,
        type: argument1,
        max: argument5,
        moving: false,
        selecting: false
    };
    array_push(argument0.options, q);
    return q;
}

var category = create_menu(UnknownEnum.Value_0, UnknownEnum.Value_5, 48, function()
{
    instance_destroy();
});
add_option_press(category, "AUDIO", function()
{
    goto_menu(UnknownEnum.Value_1);
});
add_option_press(category, "VIDEO", function()
{
    goto_menu(UnknownEnum.Value_2);
});
add_option_press(category, "CONTROLS", function()
{
    goto_menu(UnknownEnum.Value_3);
});
add_option_press(category, "GAME", function()
{
    goto_menu(UnknownEnum.Value_4);
});
array_push(menus, category);
var AUDIO = create_menu(UnknownEnum.Value_1, UnknownEnum.Value_6, 48, function()
{
    goto_menu(UnknownEnum.Value_0);
});
add_option_press(AUDIO, "BACK", function()
{
    goto_menu(UnknownEnum.Value_0);
});
add_option_ext(AUDIO, UnknownEnum.Value_9, "MASTER", function()
{
    var m = menus[currentmenu];
    var opt = m.options;
    var q = opt[selected];
    global.MasterVolume = q.val / 100;
    q.val = global.MasterVolume * 100;
    quick_save("General", "Master", global.MasterVolume);
}, global.MasterVolume * 100, 100);
add_option_ext(AUDIO, UnknownEnum.Value_9, "MUSIC", function()
{
    var m = menus[currentmenu];
    var opt = m.options;
    var q = opt[selected];
    global.MusicVolume = q.val / 100;
    q.val = global.MusicVolume * 100;
    quick_save("General", "Music", global.MusicVolume);
}, global.MusicVolume * 100, 100);
add_option_ext(AUDIO, UnknownEnum.Value_9, "SFX", function()
{
    var m = menus[currentmenu];
    var opt = m.options;
    var q = opt[selected];
    global.SfxVolume = q.val / 100;
    q.val = global.SfxVolume * 100;
    quick_save("General", "Sfx", global.SfxVolume);
}, global.SfxVolume * 100, 100);
array_push(menus, AUDIO);
var VIDEO = create_menu(UnknownEnum.Value_2, UnknownEnum.Value_6, 48, function()
{
    goto_menu(UnknownEnum.Value_0);
});
add_option_press(VIDEO, "BACK", function()
{
    goto_menu(UnknownEnum.Value_0);
});
add_option_ext(VIDEO, UnknownEnum.Value_8, "FULLSCREEN", function()
{
    var m = menus[currentmenu];
    var opt = m.options;
    var q = opt[selected];
    global.Fullscreen = q.val;
    window_set_fullscreen(global.Fullscreen);
    q.val = global.Fullscreen;
    quick_save("General", "Fullscreen", global.Fullscreen);
}, global.Fullscreen, 1);
add_option_ext(VIDEO, UnknownEnum.Value_8, "RESOLUTION", function()
{
    var m = menus[currentmenu];
    var opt = m.options;
    var q = opt[selected];
    var res = [[960, 540], [1280, 720]];
    window_set_size(res[q.val][0], res[q.val][1]);
    window_center();
}, 1, 1, ["960 X 540", "1280 X 720"]);
add_option_ext(VIDEO, UnknownEnum.Value_8, "VSYNC", function()
{
    var m = menus[currentmenu];
    var opt = m.options;
    var q = opt[selected];
    global.Vsync = q.val;
    display_reset(0, global.Vsync);
    q.val = global.Vsync;
    quick_save("General", "Vsync", global.Vsync);
}, global.Vsync, 1);
add_option_ext(VIDEO, UnknownEnum.Value_8, "HIDE HUD", function()
{
    var m = menus[currentmenu];
    var opt = m.options;
    var q = opt[selected];
    global.hide_hud = q.val;
    q.val = global.hide_hud;
    quick_save("Visual", "hud", global.hide_hud);
}, global.hide_hud, 1);
array_push(menus, VIDEO);
var CONTROLS = create_menu(UnknownEnum.Value_3, UnknownEnum.Value_6, 48, function()
{
    goto_menu(UnknownEnum.Value_0);
});
add_option_press(CONTROLS, "BACK", function()
{
    goto_menu(UnknownEnum.Value_0);
});
array_push(menus, CONTROLS);
var GAME = create_menu(UnknownEnum.Value_4, UnknownEnum.Value_6, 48, function()
{
    goto_menu(UnknownEnum.Value_0);
});
add_option_press(GAME, "BACK", function()
{
    goto_menu(UnknownEnum.Value_0);
});
add_option_ext(GAME, UnknownEnum.Value_8, "LANGUAGE", function()
{
    var m = menus[currentmenu];
    var opt = m.options;
    var q = opt[selected];
    var lang = ["english", "spanish", "portuguese"];
    global.lang = lang[q.val];
    q.val = q.val;
}, 0, 2, ["ENGLISH", "SPANISH", "PORTUGUESE"]);
array_push(menus, GAME);

reset_binds = function()
{
    ini_open("options.ini");
    global.key_left = [ini_write_real("Keyboard", "Left", 37), ini_write_real("Controller", "Left", 32783)];
    global.key_up = [ini_write_real("Keyboard", "Up", 38), ini_write_real("Controller", "Up", 32781)];
    global.key_down = [ini_write_real("Keyboard", "Down", 40), ini_write_real("Controller", "Down", 32782)];
    global.key_right = [ini_write_real("Keyboard", "Right", 39), ini_write_real("Controller", "Right", 32784)];
    global.key_jump = [ini_write_real("Keyboard", "Jump", 90), ini_write_real("Controller", "Jump", 32769)];
    global.key_attack = [ini_write_real("Keyboard", "Attack", 16), ini_write_real("Controller", "Attack", 32771)];
    global.key_slap = [ini_write_real("Keyboard", "Slap", 88), ini_write_real("Controller", "Slap", 32772)];
    global.key_taunt = [ini_write_real("Keyboard", "Taunt", 67), ini_write_real("Controller", "Taunt", 32770)];
    global.key_start = [ini_write_real("Keyboard", "Start", 27), ini_write_real("Controller", "Start", 32778)];
    ini_close();
};
