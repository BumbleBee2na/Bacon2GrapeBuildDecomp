var ev_type = ds_map_find_value(async_load, "event_type");

if (ev_type == "DiscordReady")
{
    var USER_ID = ds_map_find_value(async_load, "user_id");
    
    if (USER_ID == 874057002408636457 || USER_ID == 388319315100827661 || USER_ID == 475215883766202378 || USER_ID == 987156435228045323 || USER_ID == 958084660083183647 || USER_ID == 733824535614193765 || USER_ID == 851541866696015914 || USER_ID == 1071539423260450916 || USER_ID == 879988930357895209 || USER_ID == 741850471651868737 || USER_ID == 576022783482396682 || USER_ID == 777332145852907550 || USER_ID == 1094795737830797312 || USER_ID == 1272986798083281087 || USER_ID == 531478904746147840 || USER_ID == 736268533767602226 || USER_ID == 776638065363255328 || USER_ID == 738067132444573716 || USER_ID == 589975725143097362)
        global.isplaytester = false;
    else
        global.isplaytester = true;
    
    global.discord_initialized = true;
    ready = true;
    show_debug_message("date: " + string(date_current_datetime()));
    np_setpresence_timestamps(date_current_datetime(), 0, false);
    np_setpresence_more("", "Bacon2 Himself", false);
    np_setpresence_buttons(0, "Discord", "https://discord.com/invite/Ukvhe3Yqsw");
    var _state = "Roaming in the hub";
    
    if (global.level != "none")
        _state = global.gameframe_caption_text;
    
    np_setpresence(global.isplaytester ? _state : "LEAKED BUILD!!!", "", "icon", "");
    global.disc_att = [sprite_add(np_get_avatar_url(ds_map_find_value(async_load, "user_id"), ds_map_find_value(async_load, "avatar")), 1, false, false, 0, 0), ds_map_find_value(async_load, "user_id")];
    alarm[1] = 1;
}
