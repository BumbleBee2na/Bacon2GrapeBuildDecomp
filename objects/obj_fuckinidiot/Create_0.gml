depth = -200;
image_speed = 0;
image_index = choose(0, 1, 2);
part = 0;
timer = 90;
alpha = 0;
fmod_event_setParameter(event_play_oneshot("event:/Sfx/UI/Oops!/switch"), "state", 0, true);
