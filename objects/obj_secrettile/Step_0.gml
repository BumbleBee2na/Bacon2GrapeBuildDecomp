alpha = approach(alpha, 1 - place_meeting(x, y, obj_player), 0.1);
active = place_meeting(x, y, obj_player);
var layers = layer_get_all();

for (var i = 0; i < array_length(layers); i++)
{
    var lay = layers[i];
    var layer_name = layer_get_name(lay);
    
    if (layer_name == "Tiles_secret" && active)
    {
        var ID = layer_get_id(layer_name);
        layer_script_begin(ID, secret_tile_start);
        layer_script_end(ID, secret_tile_end);
    }
}
