function approach(argument0, argument1, argument2)
{
    if (argument0 < argument1)
        return min(argument0 + argument2, argument1);
    else
        return max(argument0 - argument2, argument1);
}

function wrap()
{
    var value = floor(argument0);
    var _min = floor(min(argument1, argument2));
    var _max = floor(max(argument1, argument2));
    var range = (_max - _min) + 1;
    return ((((value - _min) % range) + range) % range) + _min;
}

function wave(argument0, argument1, argument2, argument3)
{
    var a4 = (argument1 - argument0) * 0.5;
    return argument0 + a4 + (sin((((current_time * 0.001) + (argument2 * argument3)) / argument2) * (2 * pi)) * a4);
}

function chance(argument0)
{
    return argument0 > random(1);
}
