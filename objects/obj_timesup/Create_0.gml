part = 0;
obj_player.state = UnknownEnum.Value_21;
obj_camera.lock = true;
instance_destroy(obj_pizzaface);
global.escape = false;
parttimer = 300;
fakevsp = 0;
fakehsp = 0;
fmod_event_stop_all(true);
