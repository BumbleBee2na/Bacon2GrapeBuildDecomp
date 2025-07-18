exception_unhandled_handler(function(argument0)
{
    fmod_event_setPause_all(true);
    fmod_event_stop_all(true);
    fmod_update();
    audio_play_sound(crash, 3, false);
    
    if (file_exists("crash.png"))
        file_delete("crash.png");
    
    surface_save(application_surface, "crash.png");
    
    if (file_exists("crash.txt"))
        file_delete("crash.txt");
    
    var _f = file_text_open_write("crash.txt");
    file_text_write_string(_f, string(argument0.longMessage));
    file_text_close(_f);
    show_message(string("BACON2 HAS CRASHED!\nIn short: {0}\nPlease report crash.txt aswell as crash.png ASAP!!", string(argument0.message)));
    return 0;
});
