global.skip_intro = 0;
global.hint_on = 0;
global.hint_time = 0;
global.endings_array = [];
global.user_debug = 0;
alarm[2] = 5;
depth = -9999;
global.look_around = 0;
global.player_volume = 1;
global.now_playing = -4;
global.up_next = -4;
global.fanfare = -4;
global.fanfare_over = -4;
global.cap = 0;
global.cap_frame = 0;
global.recording = 0;
sam_fanfare = 0;
event_user(3);
if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}
global.enemies = ds_map_create();
global.crates = ds_map_create();
global.fusion_mode = 0;
global.retro_mode = 0;
global.SCRIBBLE_COLORIZE_SPRITES = false;
global.INPUT_2D_XY_AXIS_BIAS = 0.3125;
global.mouse_on = 0;
_mouse_x = 160;
_mouse_y = 120;
global.screen_shake_x = 0;
global.screen_shake_y = 0;
global.HUD_size = 16;
global.block = [par_solid];
global._screen_width = 320;
global._screen_height = 240;
global.elevator_time = 520;
display_set_gui_size(global._screen_width, global._screen_height);
global.resetme = 0;
global.damage_number_queue = [];
global.prime_exo_beams = [0, 1, 2, 3];
global.locally_elevating = 0;
global.saving = 0;
global.total_rooms = 335;
global.total_scans = 123;
bgm_loop_points();
music_volume_init();
global.fuck = 0;
if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}
room_goto_next();
if (variable_global_exists("savedata"))
{
    ds_map_destroy(global.savedata);
}
global.savedata = ds_map_create();
global.options = ds_map_create();
global.extras = ds_map_create();
global.filename = "Samus A.NUT";
global.snap_to_door = 0;
global.ramspeed = 2;
global.loaded = 0;
global.camera_busy = 0;
alarm[1] = 2;
global.door_start_x = 0;
global.door_start_y = 0;
global.door_halign = 0;
global.are_you_sure = 0;
global.are_you_sure_text = "";
global.old_room = tst_Basic_Test_0;
global.scan_x = 0;
global.scan_y = 0;
global.scan_visor = 0;
global.thermal_visor = 0;
global.xray_visor = 0;
event_user(1);
event_user(5);
global.area_name = "";
global.current_menu = 0;
global.fanfare_obselete = 0;
global.spr_screen = spr_nothing;
global.door_taken = 0;
global.map_room_x = 0;
global.map_room_y = 0;
global.map_color = 221695;
global.map_element_color = 1030655;
global.map_exit_dir = -1;
global.area = 0;
global.wave_orientation = 1;
global.logbook_category = 0;
global.boss = 0;
global.cutscene = 0;
global.arrival_x = 0;
global.arrival_y = 0;
global.last_room_name = "";
controls();
event_user(0);
global.chapel_of_the_elders_gate_key = "Null";
random_set_seed(420);
global.unique_tile_list = [];
repeat (41000)
{
    array_push(global.unique_tile_list, irandom(20));
}
repeat (131313)
{
    array_push(global.unique_tile_list, 0);
}
repeat (9)
{
    global.unique_tile_list = array_shuffle(global.unique_tile_list);
}
randomize();
global.prime_exo_beams = array_shuffle(global.prime_exo_beams);
// -- MW Changes Start
global.seedreceived = 0;
global.mwcompleted = 0;
global.mwLocations = ds_map_create();
spawn(obj_MWConnector);
// -- MW Changes End
