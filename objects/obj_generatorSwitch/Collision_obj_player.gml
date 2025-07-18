if (activeBuffer <= 0)
{
    with (obj_generator)
        active = !active;
    
    activeBuffer = 100;
}
