if (global.level != "none")
{
    audio_stop_all();
    instance_activate_all();
    player_reset();
    obj_player.visible = true;
    obj_player.movespeed = 0;
    obj_player.hsp = 0;
    obj_player.vsp = 0;
    room_goto(obj_player.hubgotoroom);
    obj_player.x = obj_player.hubgotox;
    obj_player.y = obj_player.hubgotoy;
    obj_player.targetDoor = "HUB";
    global.level = "none";
    obj_camera.lock = false;
    active = 0;
    instance_destroy();
}
