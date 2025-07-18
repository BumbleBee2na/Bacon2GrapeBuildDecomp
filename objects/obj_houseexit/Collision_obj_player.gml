if (other.state == UnknownEnum.Value_24)
{
    with (obj_player)
    {
        state = UnknownEnum.Value_1;
        movespeed = abs(hsp);
        y = other.y - 10;
        x = other.x;
        vsp = tubevsp;
    }
    
    fmod_soundeffect_3d(x, y, "event:/Sfx/General/metalbreak");
    obj_camera.shake = 30;
    
    repeat (5)
    {
        with (instance_create_depth(x + 16, y + 16, depth, obj_slapstar))
        {
            hsp = random_range(-10, 10);
            vsp = random_range(-10, 10);
            image_speed = 0.35;
            sprite_index = spr_towerblockdebris;
        }
    }
    
    with (obj_houseturn)
        hit = false;
}
