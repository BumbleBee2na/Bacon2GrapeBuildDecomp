if (ds_list_find_index(global.saveroom, id) != -1)
{
    instance_destroy();
    
    if (obj_player.secretportalID == secretID)
        instance_create_depth(x, y, depth, obj_secretcloud_enter);
    
    obj_player.secretportalID = -4;
}
