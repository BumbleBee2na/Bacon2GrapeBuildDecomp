switch (scene)
{
    case 0:
        switch (scene_state)
        {
            case -1:
                logo_prop = instance_create_depth(obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight / 2, -10, obj_introprop);
                logo_prop.sprite_index = spr_introasset_logos1;
                logo_prop.image_xscale = 2;
                logo_prop.image_yscale = 2;
                logo_prop.image_alpha = 0;
                logo_prop.spin_multi = 1;
                scene_state = 0;
                scene_timer = 60;
                break;
            
            case 0:
                scene_timer--;
                
                if (scene_timer <= 0)
                {
                    scene_state = 1;
                    scene_timer = 60;
                }
                
                break;
            
            case 1:
                scene_timer--;
                logo_prop.image_xscale = approach(logo_prop.image_xscale, 1, 0.1);
                logo_prop.image_yscale = approach(logo_prop.image_yscale, 1, 0.1);
                logo_prop.image_alpha = approach(logo_prop.image_alpha, 1, 0.1);
                
                if (scene_timer <= 0 || logo_prop.image_xscale == 1)
                {
                    scene_state = 2;
                    scene_timer = 90;
                    logo_prop.image_xscale = 0.9;
                    logo_prop.image_yscale = 0.9;
                    logo_prop.image_alpha = 1;
                }
                
                break;
            
            case 2:
                scene_timer--;
                logo_prop.image_xscale = lerp(logo_prop.image_xscale, 1, 0.1);
                logo_prop.image_yscale = lerp(logo_prop.image_yscale, 1, 0.1);
                
                if (scene_timer <= 0)
                {
                    scene_state = 3;
                    scene_timer = 120;
                }
                
                break;
            
            case 3:
                scene_timer--;
                logo_prop.y -= 1;
                logo_prop.image_alpha = approach(logo_prop.image_alpha, 0, 1/30);
                logo_prop.image_xscale = approach(logo_prop.image_xscale, 0, 1/30);
                logo_prop.image_yscale = approach(logo_prop.image_yscale, 0, 1/30);
                logo_prop.spin_multi += 0.4;
                logo_prop.image_angle += 5 * logo_prop.spin_multi;
                
                if (logo_prop.image_alpha == 0)
                {
                    instance_destroy(logo_prop);
                    scene = 1;
                    scene_state = -1;
                    scene_timer = 0;
                }
                
                break;
        }
        
        break;
    
    case 1:
        switch (scene_state)
        {
            case -1:
                logo_prop = instance_create_depth(obj_screensizer.displayWidth / 2, obj_screensizer.displayHeight / 2, -10, obj_introprop);
                logo_prop.sprite_index = spr_introasset_logos2;
                logo_prop.image_xscale = 1;
                logo_prop.image_yscale = 1;
                logo_prop.image_alpha = 0;
                logo_prop.vsp = 0;
                scene_state = 0;
                scene_timer = 120;
                break;
            
            case 0:
                scene_timer--;
                logo_prop.image_alpha = approach(logo_prop.image_alpha, 1, 0.1);
                
                if (scene_timer <= 0)
                {
                    scene_state = 1;
                    scene_timer = 120;
                    logo_prop.vsp = -20;
                }
                
                break;
            
            case 1:
                scene_timer--;
                logo_prop.y += logo_prop.vsp;
                logo_prop.vsp += 1;
                
                if (scene_timer <= 0)
                {
                    instance_destroy();
                    
                    with (obj_player)
                    {
                        targetRoom = Mainmenu;
                        targetDoor = "A";
                        hallway = false;
                        
                        with (instance_create_depth(x, y, 0, obj_fadeout))
                            targetRoom = other.targetRoom;
                        
                        movespeed = 0;
                        vsp = 0;
                        hsp = 0;
                        state = UnknownEnum.Value_14;
                        sprite_index = spr_player_lookdoor;
                    }
                }
                
                break;
        }
}
