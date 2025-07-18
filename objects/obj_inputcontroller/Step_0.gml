for (var i = 0; i < array_length(players); i++)
{
    for (var p = 0; p < gamepad_get_device_count(); p++)
    {
        if (gamepad_is_connected(p) && gamepad_check_any(p))
        {
            if (!device_exists(p) && controllers[players[i]].player == -4)
            {
                controllers[players[i]].controllerID = p;
                controllers[players[i]].player = i;
            }
        }
    }
}
