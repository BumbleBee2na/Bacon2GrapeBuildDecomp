image_speed = 0.35;
state = UnknownEnum.Value_0;
leavetimer = 180;
obj_music.isSecret = !obj_music.isSecret;

if (obj_player.state == UnknownEnum.Value_21)
{
    obj_player.x = x;
    obj_player.y = y;
    obj_player.sprite_index = spr_player_bodyslamfall;
}

depth = 10;
