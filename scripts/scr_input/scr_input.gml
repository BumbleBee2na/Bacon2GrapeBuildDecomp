function scr_mayniaInput(argument0 = "options.ini")
{
    ini_open(argument0);
    global.inputMap = ds_map_create();
    var _players = [1];
    var _inputTypes = ["KEY", "CONT"];
    var _inputsName = ["Left", "Down", "Up", "Right", "Jump", "Attack", "Slap", "Taunt", "Escape"];
    var _inputsVal = [];
    _inputsVal[0][0] = [37, 40, 38, 39, 90, 16, 88, 67, 27];
    _inputsVal[0][1] = [32783, 32782, 32781, 32784, 32769, 32773, 32771, 32772, 32778];
    
    for (var c = 0; c < array_length(_inputTypes); c++)
    {
        for (var i = 0; i < array_length(_players); i++)
        {
            for (var q = 0; q < array_length(_inputsName); q++)
                ds_map_add(global.inputMap, string("{0}{1}_{2}", _inputsName[q], _players[i], _inputTypes[c]), ini_read_real(string("Input{0}_{1}", _players[i], _inputTypes[c]), string("{0}", _inputsName[q]), _inputsVal[i][c][q]));
        }
    }
    
    ini_close();
}

function gamepad_axis_value_first(argument0, argument1, argument2)
{
    var hit = 0;
    
    if (gamepad_axis_value(argument0, argument1) >= argument2)
        hit++;
    
    if (gamepad_axis_value(argument0, argument1) == 0)
        hit = 0;
    
    if (hit <= 1)
        return hit;
}

function scr_mayniaInputCheck(argument0, argument1 = false, argument2 = 1)
{
    if (obj_shell.isOpen == false)
    {
        var _return = keyboard_check(ds_map_find_value(global.inputMap, string("{0}{1}_KEY", argument0, argument2)));
        
        if (argument1)
            _return = keyboard_check_pressed(ds_map_find_value(global.inputMap, string("{0}{1}_KEY", argument0, argument2)));
        
        var _returnKey = _return;
        var _returnFinal = _returnKey;
        var _return2 = gamepad_button_check(obj_inputcontroller.controllers[argument2 - 1].controllerID, ds_map_find_value(global.inputMap, string("{0}{1}_CONT", argument0, argument2)));
        
        if (argument1)
            _return2 = gamepad_button_check_pressed(obj_inputcontroller.controllers[argument2 - 1].controllerID, ds_map_find_value(global.inputMap, string("{0}{1}_CONT", argument0, argument2)));
        
        var _returnCont = _return2;
        _returnFinal = _returnKey || _returnCont;
        var _returnAxis = false;
        
        if (argument0 == "Left" || argument0 == "Right")
            _returnAxis = argument1 ? ((argument0 == "Left") ? gamepad_axis_value_first(obj_inputcontroller.controllers[argument2 - 1].controllerID, 32785, -0.2) : gamepad_axis_value_first(obj_inputcontroller.controllers[argument2 - 1].controllerID, 32785, 0.2)) : ((argument0 == "Left") ? (gamepad_axis_value(obj_inputcontroller.controllers[argument2 - 1].controllerID, gp_axislh) < -0.2) : (gamepad_axis_value(obj_inputcontroller.controllers[argument2 - 1].controllerID, gp_axislh) > 0.2));
        else if (argument0 == "Up" || argument0 == "Down")
            _returnAxis = argument1 ? ((argument0 == "Up") ? gamepad_axis_value_first(obj_inputcontroller.controllers[argument2 - 1].controllerID, 32786, -0.5) : gamepad_axis_value_first(obj_inputcontroller.controllers[argument2 - 1].controllerID, 32786, 0.5)) : ((argument0 == "Up") ? (gamepad_axis_value(obj_inputcontroller.controllers[argument2 - 1].controllerID, gp_axislv) < -0.5) : (gamepad_axis_value(obj_inputcontroller.controllers[argument2 - 1].controllerID, gp_axislv) > 0.5));
        
        return _returnFinal || _returnAxis;
    }
    else
    {
        return false;
    }
}

function scr_mayniaGetInput(argument0 = 1)
{
    key_left = -scr_mayniaInputCheck("Left", false, argument0);
    key_left2 = -scr_mayniaInputCheck("Left", true, argument0);
    key_right = scr_mayniaInputCheck("Right", false, argument0);
    key_right2 = scr_mayniaInputCheck("Right", true, argument0);
    key_down = scr_mayniaInputCheck("Down", false, argument0);
    key_down2 = scr_mayniaInputCheck("Down", true, argument0);
    key_up = scr_mayniaInputCheck("Up", false, argument0);
    key_up2 = scr_mayniaInputCheck("Up", true, argument0);
    key_slap = scr_mayniaInputCheck("Slap", false, argument0);
    key_slap2 = scr_mayniaInputCheck("Slap", true, argument0);
    key_jump = scr_mayniaInputCheck("Jump", false, argument0);
    key_jump2 = scr_mayniaInputCheck("Jump", true, argument0);
    key_attack = scr_mayniaInputCheck("Attack", false, argument0);
    key_attack2 = scr_mayniaInputCheck("Attack", true, argument0);
    key_taunt = scr_mayniaInputCheck("Taunt", false, argument0);
    key_taunt2 = scr_mayniaInputCheck("Taunt", true, argument0);
    key_start = scr_mayniaInputCheck("Escape", false, argument0);
    key_start2 = scr_mayniaInputCheck("Escape", true, argument0);
}

function scr_getkeys_string(argument0)
{
    var _char = ord(argument0);
    
    switch (argument0)
    {
        case 37:
            _char = "LEFT";
            break;
        
        case 39:
            _char = "RIGHT";
            break;
        
        case 38:
            _char = "UP";
            break;
        
        case 40:
            _char = "DOWN";
            break;
        
        case 16:
            _char = "SHIFT";
            break;
        
        case 32:
            _char = "SPACE";
            break;
        
        case 17:
            _char = "CONTROL";
            break;
        
        case 27:
            _char = "ESCAPE";
            break;
    }
    
    return _char;
}

function scr_getkeys(argument0)
{
    var _char = ord(argument0);
    
    switch (argument0)
    {
        case 37:
            _char = "←";
            break;
        
        case 39:
            _char = "→";
            break;
        
        case 38:
            _char = "↑";
            break;
        
        case 40:
            _char = "↓";
            break;
        
        case 16:
            _char = "⇧";
            break;
        
        case 32:
            _char = "␣";
            break;
        
        case 17:
            _char = "¢";
            break;
        
        case 27:
            _char = "⎋";
            break;
    }
    
    return _char;
}

function scr_numtokey(argument0)
{
    var _realkey = 0;
    var actualkey = chr(argument0);
    
    switch (argument0)
    {
        case 38:
        case 37:
        case 27:
        case 16:
        case 32:
        case 39:
        case 40:
            _realkey = scr_getkeys(argument0);
            break;
        
        case 163:
            _realkey = "¢";
            break;
        
        case 222:
            _realkey = "'";
            break;
        
        case 186:
            _realkey = ":";
            break;
        
        case 190:
            _realkey = ".";
            break;
        
        case 188:
            _realkey = ",";
            break;
    }
    
    if (_realkey == 0)
        actualkey = chr(argument0);
    else
        actualkey = _realkey;
    
    return actualkey;
}
