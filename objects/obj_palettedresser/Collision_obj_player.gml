with (other)
{
    if (grounded && state == UnknownEnum.Value_0 && key_up2)
    {
        pal++;
        pal = wrap(pal, 1, sprite_get_width(pal_player) - 1);
        create_particle(spr_poofeffect, x, y, 1, -1);
    }
}
