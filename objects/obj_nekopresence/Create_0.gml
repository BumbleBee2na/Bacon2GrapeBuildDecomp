ready = false;
global.isplaytester = true;
alarm[0] = room_speed * 5;

if (!np_initdiscord("1312855017710944439", true, "0"))
    show_error("NekoPresence init fail.", true);
