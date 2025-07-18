if (fadein == true)
{
    fadeAlpha = approach(fadeAlpha, 1, 0.1);
    
    if (fadeAlpha == 1)
        fadein = false;
}
else
{
    fadeAlpha = approach(fadeAlpha, 0, 0.1);
}

timer = approach(timer, 0, 1);

if (timer == 0 && !instance_exists(obj_fadeout))
    instance_create_depth(x, y, -200, obj_fadeout);
