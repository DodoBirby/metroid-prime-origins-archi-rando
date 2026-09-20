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
// -- MW Change: bump selection vertical to 4 entries
selection_vertical(4, sndPauseScroll);
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
    // -- MW Change: Add new menu entry and bump next entry selection number
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
    if (selection == 4)
    {
        leaving = 1;
        bitsound(sndPauseReject);
    }
}
