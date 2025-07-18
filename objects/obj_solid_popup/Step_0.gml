popped = true;

if (popped && possessed)
{
    y = approach(y, ystart, 32);
    
    if (y == ystart)
    {
        possessed = false;
        instance_create_depth(x + (sprite_width / 2), y, 10, obj_tutorialghost_exit);
    }
}
