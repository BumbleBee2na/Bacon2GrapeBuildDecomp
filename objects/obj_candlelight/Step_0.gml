if (active)
    image_index = 0;
else
    image_index = 1;

respawntime = approach(respawntime, 0, 1);

if (respawntime <= 0 && !active)
{
    active = true;
    respawntime = -4;
}
