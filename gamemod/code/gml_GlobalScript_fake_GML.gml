function var_exists(arg0)
{
    if (variable_instance_exists(id, arg0))
    {
        return true;
    }
    else
    {
        return false;
    }
}

function bitvar(arg0, arg1 = 0, arg2 = id)
{
    if (!variable_instance_exists(arg2, arg0))
    {
        variable_instance_set(arg2, arg0, arg1);
    }
}

function butt(arg0, arg1 = 0)
{
    static _system = __InputSystem();
    
    if (is_string(arg0))
    {
        var _def = variable_struct_get(_system.__verbExportNameDict, arg0);
        if (_def == undefined)
        {
            return "";
        }
        arg0 = _def.__verbIndex;
    }
    if (false && gamepad_is_connected(0) && (instance_exists(submenu_controls) || !InputPlayerUsingGamepad(arg1)))
    {
        var _binding = InputBindingGet(true, arg0, 0, arg1);
        if (arg0 == UnknownEnum.Value_28)
        {
            _binding = 32777;
        }
        if (arg0 == UnknownEnum.Value_27)
        {
            _binding = 32778;
        }
        return InputIconGetDirect(_binding, true, InputDeviceGetGamepadType(0));
    }
    return InputIconGet(arg0, 0, arg1);
}

function soft_reset()
{
    instance_activate_all();
    global.boss = 0;
    global.cutscene = 0;
    with (par_player)
    {
        persistent = 0;
    }
    with (obj_teleporter)
    {
        persistent = 0;
    }
    with (obj_new_hint)
    {
        persistent = 0;
    }
    with (obj_new_scan)
    {
        persistent = 0;
    }
    with (obj_message_box_double)
    {
        persistent = 0;
    }
    with (obj_map_system)
    {
        persistent = 0;
    }
    with (obj_background_manager)
    {
        persistent = 0;
    }
    with (obj_hint_system)
    {
        persistent = 0;
    }
    with (obj_death_transition)
    {
        persistent = 0;
    }
    with (obj_door_transition)
    {
        persistent = 0;
    }
    with (obj_game)
    {
        persistent = 0;
    }
    with (obj_camera)
    {
        persistent = 0;
    }
    with (obj_HUD)
    {
        persistent = 0;
    }
    with (par_menu)
    {
        persistent = 0;
    }
    with (obj_scan_system)
    {
        persistent = 0;
    }
    with (__InputUpdateController)
    {
        persistent = 1;
    }
    with (obj_escape_frigate_spawner)
    {
        persistent = 1;
    }
    with (obj_escape_impact_spawner)
    {
        persistent = 1;
    }
    instance_destroy(obj_samus_new_suit);
    instance_destroy(obj_new_hint_NEW);
    cleanse_memory();
    audio_stop_all();
    global.now_playing = -4;
    global.up_next = -4;
    room_goto(rm_Title);
}

function approach(arg0, arg1, arg2)
{
    return lerp(arg0, arg1, arg2 / 60);
}

function deactivate()
{
    instance_deactivate_all(true);
    instance_activate_object(always_active);
    instance_activate_object(system);
    instance_activate_object(par_menu);
    instance_activate_object(par_submenu);
    instance_activate_object(par_subsubmenu);
    instance_activate_object(__InputUpdateController);
    // -- MW Changes Start
    // make sure connector is active
    instance_activate_object(obj_MWConnector);
    // -- MW Changes End
}

function view_data()
{
    if (!instance_exists(obj_camera))
    {
        global.xview = camera_get_view_x(view_camera[0]);
        global.yview = camera_get_view_y(view_camera[0]);
    }
    else
    {
        global.xview = obj_camera.cam_x;
        global.yview = obj_camera.cam_y;
    }
    global.wview = global._screen_width;
    global.hview = global._screen_height - global.HUD_size;
    global.window_scale = surface_get_width(application_surface) / global.wview;
    global.play_hview = global.hview;
}

function surface_clear()
{
    draw_clear_alpha(c_black, 0);
}

function surface_black()
{
    draw_clear_alpha(c_black, 255);
    draw_rectangle_color(0, 0, global._screen_width, global._screen_height, c_black, c_black, c_black, c_black, false);
}

function closest_player_x()
{
    mom = id;
    if (instance_number(parPlayer) > 0)
    {
        with (instance_nearest(x, y, parPlayer))
        {
            other.mom = id;
        }
        with (instance_furthest(x, y, parPlayer))
        {
            other.dad = id;
        }
    }
    if (instance_number(mom) > 0)
    {
        return mom.x;
    }
    else
    {
        return 420;
    }
}

function closest_player_y()
{
    mom = id;
    if (instance_number(parPlayer) > 0)
    {
        with (instance_nearest(x, y, parPlayer))
        {
            other.mom = id;
        }
        with (instance_furthest(x, y, parPlayer))
        {
            other.dad = id;
        }
    }
    with (all)
    {
        if (variable_instance_exists(id, "mom") && instance_number(mom) == 0)
        {
            mom = parPlayer;
        }
    }
    if (instance_number(mom) > 0)
    {
        return mom.y;
    }
    else
    {
        return 420;
    }
}

function in_view(arg0 = sprite_get_width(sprite_index) / 2)
{
    pass = 0;
    cam = 0;
    _xview = camera_get_view_x(view_camera[cam]);
    _yview = camera_get_view_y(view_camera[cam]);
    _wview = camera_get_view_width(view_camera[cam]);
    _hview = camera_get_view_height(view_camera[cam]);
    if (x > (_xview - arg0) && x < (_xview + _wview + arg0) && y > (_yview - arg0) && y < (_yview + _hview + arg0))
    {
        pass += 1;
    }
    if (pass > 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

function bitroom_goto(arg0)
{
    room_goto(arg0);
}

function frame_count()
{
    return sprite_get_number(sprite_index) - 1;
}

function sprite_set(arg0, arg1 = 1, arg2 = -1)
{
    sprite_index = arg0;
    image_speed = arg1;
    if (arg2 != -1)
    {
        image_index = arg2;
    }
}

function quick_sprite(arg0, arg1 = 1)
{
    if (sprite_index != arg0)
    {
        image_index = 0;
    }
    sprite_index = arg0;
    image_speed = arg1;
}

function instance_create(arg0, arg1, arg2, arg3 = {})
{
    arg3.mom = id;
    if (!variable_instance_exists(id, "player"))
    {
        arg3.player = 0;
    }
    else
    {
        arg3.player = player;
    }
    instance_create_layer(arg0, arg1, "Instances", arg2, arg3);
}

function spawn(arg0)
{
    instance_create(x, y, arg0);
}

function destroy_tile()
{
    var layer_id = layer_tilemap_get_id(layer_get_id("fg_tiles"));
    tilemap_set_at_pixel(layer_id, 0, x, y);
}

function cursor_selection(arg0, arg1, arg2, arg3)
{
    static _system = __InputSystem();
    
    var _up = arg1;
    var _down = arg2;
    if (is_string(_up))
    {
        var _defU = variable_struct_get(_system.__verbExportNameDict, _up);
        if (_defU != undefined)
        {
            _up = _defU.__verbIndex;
        }
    }
    if (is_string(_down))
    {
        var _defD = variable_struct_get(_system.__verbExportNameDict, _down);
        if (_defD != undefined)
        {
            _down = _defD.__verbIndex;
        }
    }
    boob = menu_opposing_delta(_up, _down);
    variable_instance_set(id, arg0, variable_instance_get(id, arg0) + boob);
    if (variable_instance_get(id, arg0) > arg3)
    {
        variable_instance_set(id, arg0, 0);
    }
    if (variable_instance_get(id, arg0) < 0)
    {
        variable_instance_set(id, arg0, arg3);
    }
}

function door(arg0)
{
    dest = arg0;
}

function delete_spr_screen()
{
    if (sprite_exists(global.spr_screen) && global.spr_screen != spr_nothing)
    {
        sprite_delete(global.spr_screen);
    }
    global.spr_screen = spr_nothing;
}

function make_spr_screen()
{
    if (instance_exists(obj_camera))
    {
        delete_spr_screen();
        global.spr_screen = sprite_create_from_surface(obj_camera.view_surf, 0, 0, surface_get_width(obj_camera.view_surf), surface_get_height(obj_camera.view_surf), false, false, 0, 0);
    }
}

function draw_spr_screen(arg0 = 16777215, arg1 = 0, arg2 = 16)
{
    if (sprite_exists(global.spr_screen))
    {
        draw_sprite_ext(global.spr_screen, 0, arg1, arg2, 1, 1, 0, arg0, 1);
    }
}

function application_surface_set_size(arg0 = global._screen_width, arg1 = global._screen_height)
{
    if (surface_get_width(application_surface) != arg0 || surface_get_height(application_surface) != arg1)
    {
        surface_resize(application_surface, round(abs(arg0)), round(abs(arg1)));
    }
}

function screen_shake(arg0 = 2, arg1 = 0.9)
{
    var _shake = instance_create_depth(0, 0, 0, obj_earthquake);
    _shake.shake_x = arg0;
    _shake.shake_y = arg0;
    _shake.soften = arg1;
}

function screen_shake_ext(arg0 = 2, arg1 = 2, arg2 = 0.9)
{
    var _shake = instance_create_depth(0, 0, 0, obj_earthquake);
    _shake.shake_x = arg0;
    _shake.shake_y = arg1;
    _shake.soften = arg2;
}

enum UnknownEnum
{
    Value_27 = 27,
    Value_28
}
