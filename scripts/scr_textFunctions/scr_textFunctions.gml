function scr_compileIconText(argument0)
{
    var _keyFunc = function(argument0, argument1) constructor
    {
        isKey = argument0;
        value = argument1;
    };
    
    var _inputFind = "";
    var _prioritizeInput = 0;
    
    switch (argument0)
    {
        case "U":
            _inputFind = "Up";
            break;
        
        case "D":
            _inputFind = "Down";
            break;
        
        case "L":
            _inputFind = "Left";
            break;
        
        case "R":
            _inputFind = "Right";
            break;
        
        case "Q":
            _inputFind = "Attack";
            break;
        
        case "J":
            _inputFind = "Jump";
            break;
        
        case "G":
            _inputFind = "Slap";
            break;
        
        case "T":
            _inputFind = "Taunt";
            break;
        
        case "S":
            _inputFind = "Escape";
            break;
    }
    
    var _inputKey = [ds_map_find_value(global.inputMap, string("{0}1_KEY", _inputFind)), ds_map_find_value(global.inputMap, string("{0}1_CONT", _inputFind))];
    var _inputKeyString = chr(_inputKey[_prioritizeInput]);
    var _key = -4;
    
    if (_prioritizeInput == 0)
    {
        switch (_inputKey[0])
        {
            case 37:
                _key = new _keyFunc(true, 6);
                break;
            
            case 40:
                _key = new _keyFunc(true, 4);
                break;
            
            case 38:
                _key = new _keyFunc(true, 3);
                break;
            
            case 39:
                _key = new _keyFunc(true, 5);
                break;
            
            case 32:
                _key = new _keyFunc(true, 2);
                break;
            
            case 17:
                _key = new _keyFunc(true, 1);
                break;
            
            case 27:
                _key = new _keyFunc(true, 7);
                break;
            
            case 16:
                _key = new _keyFunc(true, 0);
                break;
            
            default:
                _key = new _keyFunc(false, _inputKeyString);
                break;
        }
    }
    
    return _key;
}

function maynia_draw_text(argument0, argument1, argument2, argument3 = string_length(argument2))
{
    var alignments = [draw_get_halign(), draw_get_valign()];
    var _font = draw_get_font();
    var _color = draw_get_color();
    var _xx = argument0;
    var _yy = argument1;
    var _cx = 0;
    var _cy = 0;
    var _length = string_length(argument2) + 1;
    var _final_string = "";
    var index = 1;
    var _wave = false;
    draw_set_font(_font);
    
    for (var i = 1; i < _length; i++)
    {
        var _is_special = false;
        var _is_key = false;
        var _let = string_char_at(argument2, i);
        var _final_let = string_char_at(argument2, i);
        var _width = string_width(_let);
        var _waveFinal = 0;
        
        if (_wave == true)
            _waveFinal = irandom_range(-1, 1);
        
        if (string_char_at(argument2, i - 1) == "/" || string_char_at(argument2, i) == "/")
            _is_special = true;
        
        if (string_char_at(argument2, i) == "[" || string_char_at(argument2, i) == "]")
            _is_special = true;
        
        if (string_char_at(argument2, i - 1) == "[" && string_char_at(argument2, i + 1) == "]")
            _is_key = true;
        
        if (!_is_special)
            _final_string += _let;
        
        switch (alignments[0])
        {
            case 0:
                break;
            
            case 1:
                _xx = argument0 - (string_width(argument2) / 2);
                break;
            
            case 2:
                _xx = argument0 - string_width(argument2);
                break;
        }
        
        if (_is_special == false)
        {
            draw_set_halign(fa_left);
            
            if (_is_key)
            {
                var _key = scr_compileIconText(_final_let);
                
                if (_key.isKey == true)
                {
                    draw_sprite(spr_tutorialkeyspecial, _key.value, (_xx + _cx) - 16, _yy + _cy + 16 + _waveFinal);
                }
                else
                {
                    draw_sprite(spr_tutorialkey, 0, (_xx + _cx) - 8, _yy + _cy + 2 + _waveFinal);
                    draw_set_color(c_black);
                    draw_set_font(global.npcfont);
                    draw_text(_xx + _cx, ((_yy + _cy) - 4) + _waveFinal, _key.value);
                }
            }
            else
            {
                draw_text(_xx + _cx, _yy + _cy + _waveFinal, _final_let);
            }
            
            _cx += _width;
            index += 1;
            
            if (index > argument3)
            {
                _cx = 0;
                _cy += string_height("A");
                _final_string = "";
                index = 1;
            }
        }
        else
        {
            switch (_let)
            {
                case "n":
                    _cx = 0;
                    _cy += string_height("A");
                    _final_string = "";
                    index = 1;
                    break;
                
                case "s":
                    _wave = true;
                    break;
            }
        }
        
        draw_set_halign(alignments[0]);
        draw_set_font(_font);
        draw_set_color(_color);
    }
}
