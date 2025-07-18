scr_mayniaGetInput();
var accel = active ? 0.05 : 0.2;
border1pos[0] = lerp(border1pos[0], active ? 0 : -256, accel);
border2pos[0] = lerp(border2pos[0], active ? 0 : 288, accel);
border1pos[1] = lerp(border1pos[1], active ? 0 : 128, accel);
border2pos[1] = lerp(border2pos[1], active ? 0 : -160, accel);
backalpha = approach(backalpha, active ? 0.5 : 0, 0.01);
borderindex += 0.35;

if (key_start2 && !active)
{
    audio_pause_all();
    active = true;
    screensprite = sprite_create_from_surface(application_surface, 0, 0, surface_get_width(application_surface), surface_get_height(application_surface), false, false, 0, 0);
    var surface = surface_create(obj_screensizer.displayWidth, obj_screensizer.displayHeight);
    
    if (surface_exists(surface))
    {
        surface_set_target(surface);
        
        with (obj_camera)
        {
            if (visible)
                event_perform(ev_draw, ev_gui);
        }
        
        with (obj_fadeout)
        {
            if (visible)
                event_perform(ev_draw, ev_gui);
        }
        
        with (obj_combotitle)
        {
            if (visible)
                event_perform(ev_draw, ev_gui);
        }
        
        with (obj_tv)
        {
            if (visible)
                event_perform(ev_draw, ev_gui);
        }
        
        with (obj_sigmasigma)
        {
            if (visible)
                event_perform(ev_draw, ev_gui);
        }
        
        surface_reset_target();
        guisprite = sprite_create_from_surface(surface, 0, 0, obj_screensizer.displayWidth, obj_screensizer.displayHeight, false, false, 0, 0);
        surface_free(surface);
    }
    
    instance_deactivate_all(true);
    instance_activate_object(obj_inputcontroller);
    instance_activate_object(obj_screensizer);
    instance_activate_object(obj_shell);
    instance_activate_object(obj_fmod);
    fmod_event_setPause_all(true);
    
    if (!event_isplaying(pausemu))
        fmod_event_play(pausemu);
    
    fmod_event_setPause(pausemu, false);
}

if (active == 1 && !instance_exists(obj_option))
{
    if (mouse_check_button_pressed(mb_left))
        create_snooze_aft(irandom_range(0, sprite_get_number(spr_pause_zs)), mouse_x, mouse_y - 80);
    
    if (key_down2)
    {
        if (selected < (ds_list_size(options) - 1))
            selected++;
        else
            selected = 0;
        
        event_play_oneshot("event:/Sfx/UI/Pause/menumove");
    }
    
    if (key_up2)
    {
        if (selected > 0)
            selected--;
        else
            selected = ds_list_size(options) - 1;
        
        event_play_oneshot("event:/Sfx/UI/Pause/menumove");
    }
    
    if (key_jump2)
    {
        if (!ds_list_empty(options))
        {
            for (var i = 0; i < ds_list_size(options); i++)
            {
                var q = ds_list_find_value(options, i);
                
                if (is_struct(q))
                {
                    if (selected == i)
                        q.func();
                    
                    event_play_oneshot("event:/Sfx/UI/Pause/menuselect");
                }
            }
        }
    }
}

fmod_global_setParameter("SfxVolume", global.SfxVolume, true);

if (instance_exists(obj_cupheadpillar) && !active)
    fmod_global_setParameter("MusicVolume", (global.MusicVolume * 1) - obj_music.pillar, true);
else
    fmod_global_setParameter("MusicVolume", global.MusicVolume, true);

fmod_global_setParameter("MasterVolume", global.MasterVolume, true);
