if (!ds_list_empty(afterimages))
{
    for (var i = 0; i < ds_list_size(afterimages); i++)
    {
        var q = ds_list_find_value(afterimages, i);
        
        with (q)
        {
            switch (type)
            {
                case UnknownEnum.Value_0:
                    for (var r = 0; r < array_length(alarm); r++)
                    {
                        if (alarm[r] >= 0)
                            alarm[r]--;
                    }
                    
                    if (alarm[1] == 0)
                    {
                        image_alpha = 0;
                        alarm[2] = 2;
                    }
                    
                    if (alarm[2] == 0)
                    {
                        image_alpha = 1;
                        alarm[2] = 2;
                    }
                    
                    if (alarm[0] == 0)
                    {
                        with (other)
                        {
                            q = undefined;
                            ds_list_delete(afterimages, i);
                            i--;
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_1:
                    image_alpha -= 0.15;
                    
                    if (image_alpha <= 0)
                    {
                        with (other)
                        {
                            q = undefined;
                            ds_list_delete(afterimages, i);
                            i--;
                        }
                    }
                    
                    break;
                
                case UnknownEnum.Value_2:
                    image_alpha -= 0.05;
                    
                    if (image_alpha <= 0)
                    {
                        with (other)
                        {
                            q = undefined;
                            ds_list_delete(afterimages, i);
                            i--;
                        }
                    }
                    
                    break;
            }
        }
    }
}
