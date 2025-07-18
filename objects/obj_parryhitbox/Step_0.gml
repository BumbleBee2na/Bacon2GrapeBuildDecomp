if (obj_player.state != UnknownEnum.Value_5)
    instance_destroy();

image_xscale = obj_player.xscale;

if (place_meeting(x, y, obj_baddiehurtbox))
{
    with (instance_place(x, y, obj_baddiehurtbox))
        instance_destroy(baddieID);
    
    with (obj_player)
    {
        state = UnknownEnum.Value_25;
        sprite_index = spr_player_pary;
        image_index = 0;
        movespeed = -6;
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/parry");
        fmod_soundeffect_3d(x, y, "event:/Sfx/Player/punch");
        flash = true;
        iframe = 60;
    }
    
    obj_camera.shake = 10;
    obj_camera.shake_mag = 15;
}
