if (instance_exists(par_subsubmenu))
{
    exit;
}
if (global.key_cancel)
{
    bitsound(sndPauseReject);
    sub_selection = 0;
    if (submenu == 1)
    {
        submenu = 0;
    }
    else
    {
        leaving = 1;
        canceled = 1;
    }
    exit;
}
mappu = variable_instance_get(id, "map" + string(selection));
newish = ds_map_find_value(mappu, "New Game");
if (fade_out > 0)
{
    fade_out += 1;
}
if (fade_out > 70)
{
    fade_out = 0;
}
if (!leaving)
{
    menu_offset = lerp(menu_offset, 0 - ((selection > 3) * 48), 0.1);
}
if (leaving)
{
    menu_offset = lerp(menu_offset, global._screen_height, 0.1);
    if (menu_offset > (global._screen_height - 32))
    {
        instance_destroy();
    }
    exit;
}
if (abs(menu_offset) < 0.2)
{
    menu_offset = 0;
}
if (menu_offset > 32)
{
    exit;
}
if (selection == 0)
{
    global.filename = prefix + " A.NUT";
}
if (selection == 1)
{
    global.filename = prefix + " B.NUT";
}
if (selection == 2)
{
    global.filename = prefix + " C.NUT";
}
if (selection == 3)
{
    global.filename = prefix + " D.NUT";
}
if (selection == 4)
{
    global.filename = prefix + " E.NUT";
}
if (selection == 5)
{
    global.filename = prefix + " F.NUT";
}
if (selection == 6)
{
    global.filename = prefix + " G.NUT";
}
if (selection == 7)
{
    global.filename = prefix + " H.NUT";
}
if (menu_offset < 5)
{
    counter += 1;
}
if (selected)
{
    exit;
}
if (global.key_accept && !global.key_up && !global.key_down && !global.key_left && !global.key_right)
{
    new_game_plus = 0;
    choice_made = 1;
    // -- MW Change: Move nyoom sound inside if statements
    if (submenu == 0)
    {
        bitsound(sndRidleyNyoom, 0.76);
        submenu = 1;
        sub_selection = 0;
        exit;
    }
    else
    {
        // -- MW Changes Start
        if (is_undefined(newish) && !global.localSeed && (!obj_MWConnector.connectedToClient || !obj_MWConnector.receivedSeedFromClient))
        {
            bitsound(sndPauseReject);
            var msg = "";
            if (!obj_MWConnector.connectedToClient)
            {
                msg = "Error: Not connected to python client";
            }
            else if (!obj_MWConnector.receivedSeedFromClient)
            {
                msg = "Error: Haven't received seed from client yet";
            }
            show_item_pickup_text(msg);
            exit;
        }
        bitsound(sndRidleyNyoom, 0.76);
        // -- MW Changes End
        with (menu_title)
        {
            leaving = 1;
        }
        selected = 1;
        if (sub_selection == 0 || (sub_selection == 1 && newish == undefined))
        {
            fade_out += 1;
        }
        alarm[0] = 27;
        exit;
    }
}
if (submenu == 0)
{
    selection_vertical(7, sndPauseScroll);
    sub_selection = 0;
}
else
{
    selected = 0;
    sub_selection += ((-1 * global.key_left_tap) + (1 * global.key_right_tap));
    if (global.key_left_tap || global.key_right_tap)
    {
        bitsound(sndPauseScroll);
    }
    sub_selection = clamp(sub_selection, 0, 1);
}
if (new_game_plus)
{
    can_delete = 0;
}
if (global.are_you_sure == 1 && !new_game_plus)
{
    can_delete = 1;
    global.are_you_sure = 0;
}
if (can_delete && !new_game_plus)
{
    can_delete = 0;
    submenu = 0;
    sub_selection = 0;
    file_delete(global.filename);
    ds_map_destroy(variable_instance_get(id, "map" + string(selection)));
    variable_instance_set(id, "map" + string(selection), ds_map_create());
    read_maps();
}
if (global.key_option_y && submenu == 0)
{
    if (selection == 0 && clear0)
    {
        instance_create(x, y, subsubmenu_are_you_sure);
        bitsound(sndPauseSelect);
        selected = 0;
        choice_made = 0;
        new_game_plus = 1;
    }
    if (selection == 1 && clear1)
    {
        instance_create(x, y, subsubmenu_are_you_sure);
        bitsound(sndPauseSelect);
        selected = 0;
        choice_made = 0;
        new_game_plus = 1;
    }
    if (selection == 2 && clear2)
    {
        instance_create(x, y, subsubmenu_are_you_sure);
        bitsound(sndPauseSelect);
        selected = 0;
        choice_made = 0;
        new_game_plus = 1;
    }
    if (selection == 3 && clear3)
    {
        instance_create(x, y, subsubmenu_are_you_sure);
        bitsound(sndPauseSelect);
        selected = 0;
        choice_made = 0;
        new_game_plus = 1;
    }
    if (selection == 4 && clear4)
    {
        instance_create(x, y, subsubmenu_are_you_sure);
        bitsound(sndPauseSelect);
        selected = 0;
        choice_made = 0;
        new_game_plus = 1;
    }
    if (selection == 5 && clear5)
    {
        instance_create(x, y, subsubmenu_are_you_sure);
        bitsound(sndPauseSelect);
        selected = 0;
        choice_made = 0;
        new_game_plus = 1;
    }
    if (selection == 6 && clear6)
    {
        instance_create(x, y, subsubmenu_are_you_sure);
        bitsound(sndPauseSelect);
        selected = 0;
        choice_made = 0;
        new_game_plus = 1;
    }
    if (selection == 7 && clear7)
    {
        instance_create(x, y, subsubmenu_are_you_sure);
        bitsound(sndPauseSelect);
        selected = 0;
        choice_made = 0;
        new_game_plus = 1;
    }
}
if (global.are_you_sure == 1 && new_game_plus)
{
    global.are_you_sure = 0;
    room_goto(rm_New_Game_Plus);
}
