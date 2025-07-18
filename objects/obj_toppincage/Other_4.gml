if (ds_list_find_index(global.saveroom, id) != -1)
{
    instance_destroy();
}
else if (!place_meeting(x, y + 1, obj_solid))
{
    while (!place_meeting(x, y + 1, obj_solid))
        y++;
}
