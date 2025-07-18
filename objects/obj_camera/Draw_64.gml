var hudxx = 144 + irandom_range(collectshake, -collectshake);
var hudyy = 79 + irandom_range(collectshake, -collectshake);

if (!global.hide_hud)
{
    if (!ds_list_empty(collectables))
    {
        for (var i = 0; i < ds_list_size(collectables); i++)
        {
            var q = ds_list_find_value(collectables, i);
            
            with (q)
                draw_sprite_ext(sprite_index, 4, x, y, 1, 1, 0, c_white, 1);
        }
    }
    
    draw_sprite(spr_safescore, 0, hudxx, hudyy + 32);
    draw_text_scribble(((hudxx + 32) - 16) + 4, (hudyy + 30) - 5, "[c_white][fa_center][font_collecthud]" + string(collectEntire));
    var rankindex = 0;
    
    if (collectEntire >= global.Brank && !global.combodropped)
        rankindex = 5;
    else if (collectEntire >= global.Brank)
        rankindex = 4;
    else if (collectEntire >= global.Grank)
        rankindex = 3;
    else if (collectEntire >= global.Lrank)
        rankindex = 2;
    else if (collectEntire >= global.Erank)
        rankindex = 1;
    
    if (previousRank != rankindex)
    {
        previousRank = rankindex;
        rankScale = 2;
    }
    
    draw_sprite_ext(spr_rankBubble_grape, rankindex, hudxx + 128, hudyy, rankScale, rankScale, 0, c_white, 1);
    var perc = 0;
    
    switch (rankindex)
    {
        case 4:
            perc = 1;
            break;
        
        case 3:
            perc = (collectEntire - global.Grank) / (global.Brank - global.Grank);
            break;
        
        case 2:
            perc = (collectEntire - global.Lrank) / (global.Grank - global.Lrank);
            break;
        
        case 1:
            perc = (collectEntire - global.Erank) / (global.Lrank - global.Erank);
            break;
        
        default:
            perc = collectEntire / global.Erank;
            break;
    }
    
    var amt = sprite_get_height(spr_rankbubble_fill) * perc;
    var top = sprite_get_height(spr_rankbubble_fill) - amt;
    var xo = sprite_get_xoffset(spr_rankbubble_fill);
    var yo = sprite_get_yoffset(spr_rankbubble_fill);
}

var variables = [obj_player.x, obj_player.y, obj_player.statename, global.combodropped, string("BUILD DATE: {0}", date_time_string(45650.00873381892)), string("SECRET PORTAL ID: {0}", obj_player.secretportalID)];
var xx = 64;
var yy = (obj_screensizer.displayHeight / 2) - (30 * array_length(variables));

if (global.debug)
{
    for (var i = 0; i < array_length(variables); i++)
    {
        draw_text_scribble(xx, yy, "[fa_left][spr_creditsfont][c_white]" + string(variables[i]));
        yy += 30;
    }
}
