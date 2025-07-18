musicDetails = ds_map_create();
music = -4;
secretMusic = -4;
currentlyPlaying = music;
isSecret = false;
lock = false;
savedMusicPosition = 0;
panicStart = false;
playingSecret = false;
func = -4;
panicMusic = "event:/Music/General/escape";
flitzani = fmod_createEventInstance("event:/Music/General/flitzani");
pillar = 0;
musicInst = -4;
secretInst = -4;
panicInst = -4;

add_music = function(argument0, argument1, argument2 = function()
{
}) constructor
{
    music = argument0;
    secret = argument1;
    func = argument2;
};

ds_map_add(musicDetails, Mainmenu, new add_music("event:/Music/General/mainmenu", -4));
ds_map_add(musicDetails, hub_1, new add_music("event:/Music/W1/hub", -4));
ds_map_add(musicDetails, hub_hallway, new add_music("event:/Music/W1/hub", -4));
ds_map_add(musicDetails, bottom_1, new add_music("event:/Music/W1/Rock Bottom/bottom", "event:/Music/W1/Rock Bottom/bottomsecret", function()
{
    var s = 0;
    
    switch (room)
    {
        case bottom_shop5:
        case bottom_shop4:
        case bottom_shop3:
        case bottom_shop2:
        case bottom_shop1:
            s = 1;
            break;
    }
    
    fmod_event_setParameter(musicInst, "state", s, false);
}));
ds_map_add(musicDetails, radiation_1, new add_music("event:/Music/W1/Radiator Springs/springs", "event:/Music/W1/Rock Bottom/bottomsecret"));
ds_map_add(musicDetails, boss_smiles, new add_music("event:/Music/W1/VS SMILES/commontrope", -4));
ds_map_add(musicDetails, tutorial_1, new add_music("event:/Music/W1/tutorial", -4));
