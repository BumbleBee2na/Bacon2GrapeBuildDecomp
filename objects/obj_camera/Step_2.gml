if (lock == false)
{
    var camx = (cam_tar.x - (camera_get_view_width(view_camera[0]) / 2)) + xoffset + irandom_range(escapeshake, -escapeshake);
    var camy = (cam_tar.y - 55 - (camera_get_view_height(view_camera[0]) / 2)) + irandom_range(escapeshake, -escapeshake);
    camx = clamp(camx, 0, room_width - camera_get_view_width(view_camera[0]));
    camy = clamp(camy, 0, room_height - camera_get_view_height(view_camera[0]));
    camera_set_view_pos(view_camera[0], camx + irandom_range(shake, -shake), camy + irandom_range(shake, -shake));
}

var roomname = room_get_name(room);
roomname = string_letters(roomname);

if (room == rm_init || room == rank_room || room == hub_hallway || room == hub_1 || room == rm_intro || room == Mainmenu || roomname == "tutorial")
    visible = false;
else
    visible = true;

shake_mag = approach(shake_mag, 0, 1);

if (shake_mag == 0)
    shake = 0;

if (cam_tar == obj_player)
{
    var extend = cam_tar.xscale * clamp(cam_tar.movespeed / 4, 0, 24) * 100;
    var accel = 0.5;
    
    if ((extend < 0 && xoffset > 0) || (extend > 0 && xoffset < 0))
        accel = 4;
    
    if (cam_tar.state == UnknownEnum.Value_2 || cam_tar.state == UnknownEnum.Value_3 || (cam_tar.state == UnknownEnum.Value_9 && cam_tar.movespeed > 12) || (cam_tar.state == UnknownEnum.Value_10 && cam_tar.movespeed > 12) || (cam_tar.state == UnknownEnum.Value_22 && cam_tar.movespeed > 12))
        xoffset = approach(xoffset, extend, accel);
    else
        xoffset = approach(xoffset, 0, 6);
}

collectshake = approach(collectshake, 0, 1);

if (global.escape)
    escapeshake = 1;
else
    escapeshake = 0;

if (!ds_list_empty(collectables))
{
    for (var i = 0; i < ds_list_size(collectables); i++)
    {
        var q = ds_list_find_value(collectables, i);
        
        with (q)
        {
            var targetxx = 144;
            var targetyy = 79;
            var point = point_direction(x, y, targetxx, targetyy);
            hsp = lengthdir_x(25, point);
            vsp = lengthdir_y(25, point);
            x += hsp;
            y += vsp;
            
            if (point_distance(x, y, targetxx, targetyy) <= 25)
            {
                with (other)
                {
                    collectshake = 10;
                    q = undefined;
                    ds_list_delete(collectables, i);
                    i--;
                }
            }
        }
    }
}

global.Grank = global.Brank / 2;
global.Lrank = global.Grank / 2;
global.Erank = global.Lrank / 2;
rankScale = approach(rankScale, 1, 0.2);
collectEntire = global.collect + obj_player.combopoint;
