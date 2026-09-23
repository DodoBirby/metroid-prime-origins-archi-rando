if (instance_exists(par_subsubmenu) || instance_exists(submenu_file_select) || instance_exists(subsubmenu_credits))
{
    menu_offset = lerp(menu_offset, global._screen_height, 0.1);
    exit;
}
if (!leaving)
{
    menu_offset = lerp(menu_offset, 0, 0.2);
}
else
{
    menu_offset = lerp(menu_offset, global._screen_height, 0.05);
    if (menu_offset > (global._screen_height - 32) && !global.are_you_sure)
    {
        instance_destroy();
    }
}
if (menu_offset > 32)
{
    exit;
}
// -- MW Changes Start
selection_vertical(6, sndPauseScroll);
// -- MW Changes End
if (global.key_cancel || global.key_menu)
{
    leaving = 1;
    bitsound(sndPauseReject);
    exit;
}
if (global.key_accept && !global.key_up && !global.key_down && !global.key_left && !global.key_right)
{
    bitsound(sndPauseSelect);
    if (selection == 0 && dze("Fusion Mode"))
    {
        spawn(submenu_file_select_fusion);
    }
    if (selection == 1 && dze("Retro Mode"))
    {
        spawn(submenu_file_select_retro);
    }
    if (selection == 2)
    {
        spawn(subsubmenu_credits);
    }
    // -- MW Change: Add new menu entries
    if (selection == 3)
    {
        var path = get_open_filename("seed files|*.mposeed");
        if (path != "")
        {
            if (load_seed_file(path))
            {
                show_item_pickup_text("Seed file loaded");
            }
        }
    }
    // -- MW Changes Start
    if (selection == 4)
    {
        if (!instance_exists(obj_MWConnector))
        {
            show_item_pickup_text("Archipelago connector is unavailable");
        }
        else if (obj_MWConnector.nativeSessionActive)
        {
            obj_MWConnector.nativeDisconnect();
            show_item_pickup_text("Disconnected from Archipelago");
        }
        else
        {
            obj_MWConnector.nativePromptConnect();
        }
    }
    if (selection == 5)
    {
        if (instance_exists(obj_MWConnector))
        {
            obj_MWConnector.nativePromptChat();
        }
        else
        {
            show_item_pickup_text("Archipelago connector is unavailable");
        }
    }
    if (selection == 6)
    {
        leaving = 1;
        bitsound(sndPauseReject);
    }
    // -- MW Changes End
}
