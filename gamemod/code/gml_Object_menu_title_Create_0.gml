var _file = ds_zero_options("Last File");
min_selection = 1;
if (_file != 0)
{
    if (file_exists(_file))
    {
        min_selection = 0;
    }
}
_dir = 1;
global.rta_stop = 0;
leaving = 0;
selection = min_selection;
selected = 0;
menu_offset = global._screen_height;
fade_in = 150;
intro_offset = 120;
dir = -0.5 + random(1);
dir2 = -0.5 + random(1);
bg_xspeed = 0;
bg_yspeed = 0;
bar_offset = 42;
start = 0;
alarm[1] = 250;
fade_out = 0;
title_scale = 1;
alarm[2] = 90 + irandom(300);
if (variable_global_exists("savedata"))
{
    ds_map_destroy(global.savedata);
}
global.savedata = ds_map_create();
bg_frame = 0;
menu_transitioning = 0;
global.fusion_mode = 0;
global.retro_mode = 0;
// -- MW Changes Start
global.mwcompleted = 0;
// -- MW Changes End
