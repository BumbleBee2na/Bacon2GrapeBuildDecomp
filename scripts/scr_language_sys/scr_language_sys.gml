function lang_start()
{
    global.lang = "english";
    global.lang_map = ds_map_create();
    var file = file_find_first("languages/*.txt", 0);
    
    while (file != "")
    {
        lang_add(string_trim(file, [".txt"]), "languages/" + file);
        file = file_find_next();
    }
}

function get_file_content_string(argument0, argument1 = false)
{
    var file = file_text_open_read(argument0);
    var str = "";
    var incommented = false;
    
    while (!file_text_eof(file))
    {
        var l = file_text_readln(file);
        
        if (argument1)
        {
            if (string_starts_with("//", l))
                continue;
            
            if (string_starts_with("/*", l))
                incommented = true;
            
            if (string_ends_with("*/", l))
            {
                incommented = false;
                continue;
            }
        }
        
        if (!incommented)
            str += (string_trim(l) + "\n");
    }
    
    return str;
}

function lang_add(argument0, argument1)
{
    var str = get_file_content_string(argument1, true);
    var lines = string_split(str, "\n");
    ds_map_set(global.lang_map, argument0, ds_map_create());
    
    for (var i = 0; i < array_length(lines); i++)
    {
        var line = lines[i];
        
        if (string_length(line) > 0)
        {
            var parts = string_split(line, "=", false, 1);
            
            if (array_length(parts) == 2)
            {
                var key = string_trim(parts[0], [" "]);
                var value = string_trim(parts[1], [" "]);
                
                switch (value)
                {
                    case "true":
                        value = true;
                        break;
                    
                    case "false":
                        value = false;
                        break;
                    
                    case "undefined":
                        value = undefined;
                        break;
                    
                    case "noone":
                        value = -4;
                        break;
                    
                    case "-4":
                        value = -4;
                        break;
                }
                
                if (string_digits(value) != "" && string_letters(value) == "")
                    value = real(value);
                
                ds_map_set(ds_map_find_value(global.lang_map, argument0), key, value);
            }
        }
    }
}

function lang_get_value(argument0)
{
    var lang_str = ds_map_find_value(ds_map_find_value(global.lang_map, global.lang), argument0);
    return (lang_str == undefined) ? argument0 : lang_str;
}

function get_lang_sprite(argument0)
{
    var sprite = -4;
    var exten = ["png", "gif"];
    var dir = string("languages/sprites/{0}", lang_get_value("language"));
    
    for (var i = 0; i < array_length(exten); i++)
    {
        var file = string("{0}/{1}.{2}", dir, argument0, exten[i]);
        
        if (file_exists(file))
        {
            sprite = sprite_add(file, -1, false, false, 0, 0);
            break;
        }
    }
    
    return sprite;
}

function draw_sprite_lang(argument0, argument1, argument2, argument3)
{
    draw_sprite(get_lang_sprite(argument0), argument1, argument2, argument3);
}
