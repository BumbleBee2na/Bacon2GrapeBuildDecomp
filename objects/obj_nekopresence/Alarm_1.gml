np_setpresence_more("", "Bacon2 Himself", false);
var _is_bacon1 = obj_player.pal == 2;
var _state = "Roaming in the hub";

if (global.level != "none")
    _state = global.gameframe_caption_text;

var _icon = _is_bacon1 ? "icon1" : "icon";
var _icon_txt = _is_bacon1 ? "Bacon1 in Nightmare World" : "Bacon2 Himself";
np_setpresence_more("", _icon_txt, false);
np_setpresence(global.isplaytester ? _state : "LEAKED BUILD!!!", "", _icon, "");
alarm[1] = 10;
