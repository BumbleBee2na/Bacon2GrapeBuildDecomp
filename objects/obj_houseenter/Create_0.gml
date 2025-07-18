dirx = 16 * sign(image_xscale);
diry = 0;

if (image_angle == 90)
{
    diry = -16;
    dirx = 0;
}
else if (image_angle == -90)
{
    diry = 16;
    dirx = 0;
}
