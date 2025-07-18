gamepad_check_any = function(argument0)
{
    for (var i = 32769; i < 32788; i++)
    {
        if (gamepad_button_check(argument0, i))
            return true;
    }
};

device_exists = function(argument0)
{
    var _exists = false;
    
    for (var i = 0; i < array_length(controllers); i++)
    {
        if (controllers[i].controllerID == argument0)
        {
            _exists = true;
            break;
        }
    }
    
    return _exists;
};

add_controller = function(argument0, argument1) constructor
{
    player = argument0;
    controllerID = argument1;
};

players = [0];
controllers = [];

repeat (gamepad_get_device_count())
    array_push(controllers, new add_controller(-4, -4));

checking_for_player = 0;
