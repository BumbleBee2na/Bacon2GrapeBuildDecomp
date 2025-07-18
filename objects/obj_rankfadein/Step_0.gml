fadeAlpha = approach(fadeAlpha, 1, 0.1);

with (obj_player)
{
    image_speed = 0.35;
    var targetx = obj_screensizer.displayWidth / 2;
    var targety = obj_screensizer.displayHeight / 2;
    var point = point_direction(targetx, targety, obj_player.x, obj_player.y);
    x += lengthdir_x(1, point);
    y += lengthdir_y(1, point);
    
    if (animation_end())
        image_speed = 0;
}

alarm[2] = approach(alarm[2], 0, 1);

switch (part)
{
    case 0:
        if (fadeAlpha == 1)
        {
            fmod_event_setPause(rankmu, false);
            
            if (!event_isplaying(rankmu))
                fmod_event_play(rankmu);
            
            fmod_event_setParameter(rankmu, "state", rankmuIndex, true);
            shownrank = false;
            alarm[2] = 300;
            part++;
            room = rank_room;
            obj_player.x -= camera_get_view_x(view_camera[0]);
            obj_player.y -= camera_get_view_y(view_camera[0]);
        }
        
        break;
    
    case 1:
        if (!shownrank && alarm[2] == 0 && event_isplaying(rankmu))
        {
            shownrank = true;
            rankindex = 0;
            obj_player.visible = false;
            alarm[2] = 120;
        }
        else
        {
            rankindex += 0.35;
            rankindex = clamp(rankindex, 0, sprite_get_number(rankspr) - 1);
            
            if (!event_isplaying(rankmu) && !event_isstarting(rankmu))
                event_user(0);
        }
        
        break;
}
