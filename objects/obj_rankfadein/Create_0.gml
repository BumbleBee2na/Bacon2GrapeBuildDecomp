depth = 1;
fadeAlpha = 0;
part = 0;
obj_player.state = UnknownEnum.Value_21;
obj_camera.lock = true;
instance_destroy(obj_pizzaface);
global.escape = false;
fmod_event_stop_all(true);
shownrank = false;
rankindex = 0;
layer_enable_fx("Effect_1", false);
rankmu = fmod_createEventInstance("event:/Music/General/ranks");
rankmuIndex = 0;
rankspr = spr_rankPLACEHOLDER;
alarm[2] = 180;

if (global.collect >= global.Brank && !global.combodropped)
{
    rankmuIndex = 4;
    rankspr = spr_rank2;
}
else if (global.collect >= global.Brank)
{
    rankmuIndex = 3;
}
else if (global.collect >= global.Grank)
{
    rankmuIndex = 2;
}
else if (global.collect >= global.Lrank)
{
    rankmuIndex = 1;
}
else if (global.collect >= global.Erank)
{
    rankmuIndex = 0;
}
