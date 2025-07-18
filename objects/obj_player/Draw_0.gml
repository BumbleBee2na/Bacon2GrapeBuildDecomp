pal_swap_set(pal_player, pal, false);
var a = 1;

if (iframe > 0)
    a = 0.5;

draw_sprite_ext(sprite_index, image_index, x, y, xscale, 1, angle, image_blend, a);
shader_reset();

if (flash)
{
    shader_set(shd_flash);
    draw_sprite_ext(sprite_index, image_index, x, y, xscale, 1, angle, image_blend, 1);
    shader_reset();
}
