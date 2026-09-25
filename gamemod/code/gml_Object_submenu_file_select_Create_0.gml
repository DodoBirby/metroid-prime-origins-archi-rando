global.fusion_mode = 0;
global.retro_mode = 0;
prompt_text = "";
menu_text = "";
menu_offset = -global._screen_height;
selection = 0;
leaving = 0;
dir = 1;
dir2 = 1;
bg_xspeed = 0;
bg_yspeed = 0;
counter = 0;
fade_out = 0;
mappu = ds_map_create();
selected = 0;
newish = 0;
canceled = 0;
can_delete = 0;
choice_made = 0;
submenu = 0;
sub_selection = 0;
choice_text = "[fnt_Logbook][c_white][fa_left][fa_top]";
current_file_state = 0;
map0 = ds_map_create();
map1 = ds_map_create();
map2 = ds_map_create();
map3 = ds_map_create();
map4 = ds_map_create();
map5 = ds_map_create();
map6 = ds_map_create();
map7 = ds_map_create();
if (file_exists(prefix + " A.NUT"))
{
    map0 = bitload(prefix + " A.NUT");
}
if (file_exists(prefix + " B.NUT"))
{
    map1 = bitload(prefix + " B.NUT");
}
if (file_exists(prefix + " C.NUT"))
{
    map2 = bitload(prefix + " C.NUT");
}
if (file_exists(prefix + " D.NUT"))
{
    map3 = bitload(prefix + " D.NUT");
}
if (file_exists(prefix + " E.NUT"))
{
    map4 = bitload(prefix + " E.NUT");
}
if (file_exists(prefix + " F.NUT"))
{
    map5 = bitload(prefix + " F.NUT");
}
if (file_exists(prefix + " G.NUT"))
{
    map6 = bitload(prefix + " G.NUT");
}
if (file_exists(prefix + " H.NUT"))
{
    map7 = bitload(prefix + " H.NUT");
}

// -- MW Changes Start: hide saves that are not part of the current multiworld
function mw_save_is_hidden(save_map)
{
    if (global.localSeed
        || !instance_exists(obj_MWConnector)
        || !obj_MWConnector.receivedSeedFromClient
        || ds_map_find_value(save_map, "New Game") == undefined)
    {
        return false;
    }
    return ds_map_find_value(save_map, "MWOnlineSchema") != 1
        || ds_map_find_value(save_map, "MWAPSeed") != obj_MWConnector.nativeSeedName
        || ds_map_find_value(save_map, "MWAPTeam") != obj_MWConnector.nativeTeamNumber
        || ds_map_find_value(save_map, "MWAPPlayer") != obj_MWConnector.nativePlayerNumber;
}

function refresh_mw_save_visibility()
{
    hidden0 = mw_save_is_hidden(map0);
    hidden1 = mw_save_is_hidden(map1);
    hidden2 = mw_save_is_hidden(map2);
    hidden3 = mw_save_is_hidden(map3);
    hidden4 = mw_save_is_hidden(map4);
    hidden5 = mw_save_is_hidden(map5);
    hidden6 = mw_save_is_hidden(map6);
    hidden7 = mw_save_is_hidden(map7);
}
// -- MW Changes End

function read_maps()
{
    cursor0 = ds_zero_map(map0, "Varia Suit") + ds_zero_map(map0, "Gravity Suit") + ds_zero_map(map0, "Phazon Suit");
    tanks0 = ds_zero_map(map0, "Energy Tanks Max");
    missiles0 = ds_zero_map(map0, "Missiles");
    missilesmax0 = ds_zero_map(map0, "Missiles Max");
    pbombs0 = ds_zero_map(map0, "Power Bombs");
    pbombsmax0 = ds_zero_map(map0, "Power Bombs Max");
    area0 = ds_map_find_value(map0, "Save Area");
    secs0 = ds_zero_map(map0, "Seconds");
    mins0 = ds_zero_map(map0, "Minutes");
    hours0 = ds_zero_map(map0, "Hours");
    classic0 = ds_zero_map(map0, "Classic Mode");
    clear0 = ds_zero_map(map0, "Clear Game");
    plus0 = ds_zero_map(map0, "New Game+");
    cursor1 = ds_zero_map(map1, "Varia Suit") + ds_zero_map(map1, "Gravity Suit") + ds_zero_map(map1, "Phazon Suit");
    tanks1 = ds_zero_map(map1, "Energy Tanks Max");
    missiles1 = ds_zero_map(map1, "Missiles");
    missilesmax1 = ds_zero_map(map1, "Missiles Max");
    pbombs1 = ds_zero_map(map1, "Power Bombs");
    pbombsmax1 = ds_zero_map(map1, "Power Bombs Max");
    area1 = ds_map_find_value(map1, "Save Area");
    secs1 = ds_zero_map(map1, "Seconds");
    mins1 = ds_zero_map(map1, "Minutes");
    hours1 = ds_zero_map(map1, "Hours");
    classic1 = ds_zero_map(map1, "Classic Mode");
    clear1 = ds_zero_map(map1, "Clear Game");
    plus1 = ds_zero_map(map1, "New Game+");
    cursor2 = ds_zero_map(map2, "Varia Suit") + ds_zero_map(map2, "Gravity Suit") + ds_zero_map(map2, "Phazon Suit");
    tanks2 = ds_zero_map(map2, "Energy Tanks Max");
    missiles2 = ds_zero_map(map2, "Missiles");
    missilesmax2 = ds_zero_map(map2, "Missiles Max");
    pbombs2 = ds_zero_map(map2, "Power Bombs");
    pbombsmax2 = ds_zero_map(map2, "Power Bombs Max");
    area2 = ds_map_find_value(map2, "Save Area");
    secs2 = ds_zero_map(map2, "Seconds");
    mins2 = ds_zero_map(map2, "Minutes");
    hours2 = ds_zero_map(map2, "Hours");
    classic2 = ds_zero_map(map2, "Classic Mode");
    clear2 = ds_zero_map(map2, "Clear Game");
    plus2 = ds_zero_map(map2, "New Game+");
    cursor3 = ds_zero_map(map3, "Varia Suit") + ds_zero_map(map3, "Gravity Suit") + ds_zero_map(map3, "Phazon Suit");
    tanks3 = ds_zero_map(map3, "Energy Tanks Max");
    missiles3 = ds_zero_map(map3, "Missiles");
    missilesmax3 = ds_zero_map(map3, "Missiles Max");
    pbombs3 = ds_zero_map(map3, "Power Bombs");
    pbombsmax3 = ds_zero_map(map3, "Power Bombs Max");
    area3 = ds_map_find_value(map3, "Save Area");
    secs3 = ds_zero_map(map3, "Seconds");
    mins3 = ds_zero_map(map3, "Minutes");
    hours3 = ds_zero_map(map3, "Hours");
    classic3 = ds_zero_map(map3, "Classic Mode");
    clear3 = ds_zero_map(map3, "Clear Game");
    plus3 = ds_zero_map(map3, "New Game+");
    cursor4 = ds_zero_map(map4, "Varia Suit") + ds_zero_map(map4, "Gravity Suit") + ds_zero_map(map4, "Phazon Suit");
    tanks4 = ds_zero_map(map4, "Energy Tanks Max");
    missiles4 = ds_zero_map(map4, "Missiles");
    missilesmax4 = ds_zero_map(map4, "Missiles Max");
    pbombs4 = ds_zero_map(map4, "Power Bombs");
    pbombsmax4 = ds_zero_map(map4, "Power Bombs Max");
    area4 = ds_map_find_value(map4, "Save Area");
    secs4 = ds_zero_map(map4, "Seconds");
    mins4 = ds_zero_map(map4, "Minutes");
    hours4 = ds_zero_map(map4, "Hours");
    classic4 = ds_zero_map(map4, "Classic Mode");
    clear4 = ds_zero_map(map4, "Clear Game");
    plus4 = ds_zero_map(map4, "New Game+");
    cursor5 = ds_zero_map(map5, "Varia Suit") + ds_zero_map(map5, "Gravity Suit") + ds_zero_map(map5, "Phazon Suit");
    tanks5 = ds_zero_map(map5, "Energy Tanks Max");
    missiles5 = ds_zero_map(map5, "Missiles");
    missilesmax5 = ds_zero_map(map5, "Missiles Max");
    pbombs5 = ds_zero_map(map5, "Power Bombs");
    pbombsmax5 = ds_zero_map(map5, "Power Bombs Max");
    area5 = ds_map_find_value(map5, "Save Area");
    secs5 = ds_zero_map(map5, "Seconds");
    mins5 = ds_zero_map(map5, "Minutes");
    hours5 = ds_zero_map(map5, "Hours");
    classic5 = ds_zero_map(map5, "Classic Mode");
    clear5 = ds_zero_map(map5, "Clear Game");
    plus5 = ds_zero_map(map5, "New Game+");
    cursor6 = ds_zero_map(map6, "Varia Suit") + ds_zero_map(map6, "Gravity Suit") + ds_zero_map(map6, "Phazon Suit");
    tanks6 = ds_zero_map(map6, "Energy Tanks Max");
    missiles6 = ds_zero_map(map6, "Missiles");
    missilesmax6 = ds_zero_map(map6, "Missiles Max");
    pbombs6 = ds_zero_map(map6, "Power Bombs");
    pbombsmax6 = ds_zero_map(map6, "Power Bombs Max");
    area6 = ds_map_find_value(map6, "Save Area");
    secs6 = ds_zero_map(map6, "Seconds");
    mins6 = ds_zero_map(map6, "Minutes");
    hours6 = ds_zero_map(map6, "Hours");
    classic6 = ds_zero_map(map6, "Classic Mode");
    clear6 = ds_zero_map(map6, "Clear Game");
    plus6 = ds_zero_map(map6, "New Game+");
    cursor7 = ds_zero_map(map7, "Varia Suit") + ds_zero_map(map7, "Gravity Suit") + ds_zero_map(map7, "Phazon Suit");
    tanks7 = ds_zero_map(map7, "Energy Tanks Max");
    missiles7 = ds_zero_map(map7, "Missiles");
    missilesmax7 = ds_zero_map(map7, "Missiles Max");
    pbombs7 = ds_zero_map(map7, "Power Bombs");
    pbombsmax7 = ds_zero_map(map7, "Power Bombs Max");
    area7 = ds_map_find_value(map7, "Save Area");
    secs7 = ds_zero_map(map7, "Seconds");
    mins7 = ds_zero_map(map7, "Minutes");
    hours7 = ds_zero_map(map7, "Hours");
    classic7 = ds_zero_map(map7, "Classic Mode");
    clear7 = ds_zero_map(map7, "Clear Game");
    plus7 = ds_zero_map(map7, "New Game+");
}

// -- MW Changes Start
refresh_mw_save_visibility();
// -- MW Changes End
read_maps();
global.SCRIBBLE_COLORIZE_SPRITES = true;
new_game_plus = 0;
