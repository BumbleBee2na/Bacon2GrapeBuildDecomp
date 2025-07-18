var txt = text;
var index = 48;

for (var i = 0; i < string_length_scribble(txt); i++)
{
    index += 32;
    
    if ((index % 850) == 0)
    {
        index = 48;
        borderTargetpos -= 100;
        borderscaleYmult += 0.9;
    }
}

if (!place_meeting(x, y + 1, obj_solid))
{
    while (!place_meeting(x, y + 1, obj_solid))
        y++;
}

surf = -4;
clip = -4;
borderY = borderTargetpos;
