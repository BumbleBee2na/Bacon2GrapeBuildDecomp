state = UnknownEnum.Value_39;
expressiontimer = 0;
switchstate = 0;
switchtimer = 0;
drawingalpha = 1;
idletimer = 300;
expressionsprite = spr_tv_idle;
idle = 0;
sprite_index = spr_tv_idle;
comboX = 832;
comboY = -64;
combovsp = 0;
combopart = 0;
teapos = 0;
comboshake = 0;
combopalindex = 0;
switchindex = 0;
bg_surf = surface_create(137, 117);
bg_x = 0;
timerpos = 100;
escapeStart = false;
chunkmax = 0;

tv_anim = function(argument0, argument1 = 0)
{
    switchindex = 0;
    state = UnknownEnum.Value_38;
    expressionsprite = argument0;
    expressiontimer = argument1;
};
