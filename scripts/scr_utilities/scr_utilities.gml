function save_level()
{
    ini_open("saveData1.ini");
    ini_write_real(global.level, "score", global.collect);
    var rankindex = 0;
    
    if (global.collect >= global.Brank && !global.combodropped)
        rankindex = 5;
    else if (global.collect >= global.Brank)
        rankindex = 4;
    else if (global.collect >= global.Grank)
        rankindex = 3;
    else if (global.collect >= global.Lrank)
        rankindex = 2;
    else if (global.collect >= global.Erank)
        rankindex = 1;
    
    ini_write_real(global.level, "rank", rankindex);
    ini_close();
}

function animation_end()
{
    return floor(image_index) >= (image_number - 1);
}

function escape_background(argument0, argument1)
{
    var layers = layer_get_all();
    
    for (var i = 0; i < array_length(layers); i++)
    {
        var lay = layers[i];
        var layer_name = layer_get_name(lay);
        var ID = layer_get_id(layer_name);
        var BGID = layer_background_get_id(ID);
        var BGSPR = layer_background_get_sprite(BGID);
        
        if (BGSPR == argument0 && global.escape)
            layer_background_sprite(BGID, argument1);
        else if (BGSPR == argument1 && !global.escape)
            layer_background_sprite(BGID, argument0);
    }
}

function tile_delete(argument0, argument1)
{
    var layers = layer_get_all();
    
    for (var i = 0; i < array_length(layers); i++)
    {
        var lay = layers[i];
        var layer_name = layer_get_name(lay);
        
        if (layer_name != "Tiles_bg")
        {
            var ID = layer_get_id(layer_name);
            var tilemapID = layer_tilemap_get_id(ID);
            var tiledata = tilemap_get_at_pixel(tilemapID, argument0, argument1);
            tile_set_empty(tiledata);
            tilemap_set_at_pixel(tilemapID, 0, argument0, argument1);
        }
    }
}

function in_camera(argument0 = bbox_left, argument1 = bbox_right, argument2 = bbox_bottom, argument3 = bbox_top)
{
    var camx = camera_get_view_x(view_camera[0]);
    var camy = camera_get_view_y(view_camera[0]);
    var camw = camera_get_view_width(view_camera[0]);
    var camh = camera_get_view_height(view_camera[0]);
    return argument0 < (camx + camw) && argument1 > camx && argument3 < (camy + camh) && argument2 > camy;
}

function quick_save(argument0, argument1, argument2)
{
    ini_open("options.ini");
    ini_write_real(argument0, argument1, argument2);
    ini_close();
}

function slope_rotation()
{
    var _angle = 0;
    
    if (place_meeting_slope(x, y + 1))
    {
        var _obj = instance_place(x, y + 1, obj_slope);
        
        if (abs(_obj.image_yscale) < abs(_obj.image_xscale))
            _angle = 10 * _obj.image_xscale;
        else
            _angle = 45 * sign(_obj.image_xscale);
    }
    
    angle = lerp(angle, _angle, 0.5);
}

function slope_momentum(argument0 = 0.2, argument1 = 0.1)
{
    if (place_meeting_slope())
    {
        var _obj = scr_slope_get();
        
        if (instance_exists(_obj))
        {
            if (sign(_obj.image_xscale) != xscale)
                movespeed += argument0;
            else
                movespeed -= argument1;
        }
    }
}

function scr_transfotip(argument0)
{
    if (instance_exists(obj_transfotext))
        instance_destroy();
    
    instance_create_depth(x, y, -500, obj_transfotext).text = argument0;
}

function npc_tobutton(argument0)
{
    return string("[c_white][spr_buttonfont]{0}[c_black][spr_npcfont]", scr_numtokey(argument0));
}
