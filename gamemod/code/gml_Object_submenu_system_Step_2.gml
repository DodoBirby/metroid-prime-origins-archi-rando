if (instance_exists(par_subsubmenu))
{
    menu_offset = lerp(menu_offset, global._screen_height, 0.1);
    exit;
}
if (global.key_option_r || global.key_option_l)
{
    cheat_bops += 1;
    if (cheat_bops == 11)
    {
        ds_write("Cheater", 1);
        spawn(obj_effect_screen_flash);
        global.user_debug = 1;
        bitsound(sndMetroid1);
    }
}
if (global.are_you_sure == 1)
{
    if (alarm[0] <= 0)
    {
        alarm[0] = 5;
        if (room != rm_Title)
        {
            ds_write("Energy", 99);
            ds_write("Energy Tanks", ds_zero("Energy Tanks Max"));
            save_and_tell();
        }
    }
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
selection_vertical(14, sndPauseScroll);
if (global.key_cancel || global.key_menu)
{
    leaving = 1;
    bitsound(sndPauseReject);
    exit;
}
// -- MW Changes: Add new menu item and bump save + return to title item up
if (global.key_accept && (selection == 4 || selection == 13 || selection == 14) && !global.key_up && !global.key_down && !global.key_left && !global.key_right)
{
    bitsound(sndPauseSelect);
    if (selection == 4)
    {
        spawn(submenu_controls);
    }
    if (selection == 13)
    {
        var path = get_open_filename("seed files|*.mposeed");
        load_seed_file(path);
    }
    if (selection == 14)
    {
        if (instance_exists(menu_choice))
        {
            global.are_you_sure_text = txt("Progress will be saved.");
            spawn(subsubmenu_are_you_sure);
        }
        leaving = 1;
        bitsound(sndPauseReject);
    }
}
global.are_you_sure_text = "";
global.are_you_sure = 0;
if (round(menu_offset) != 0)
{
    exit;
}
if (!global.key_left && !global.key_right && !global.key_up && !global.key_down)
{
    voluming = 0;
}
if ((global.key_left_tap || global.key_left_repeat) && selection != 4 && selection != 13 && !global.key_up && !global.key_down)
{
    bitsound(sndPauseScroll);
    if (selection == 0)
    {
        voluming += 0.01;
        ds_add_options("SFX Volume", -voluming);
    }
    if (ds_zero_options("SFX Volume") < 0)
    {
        ds_write_options("SFX Volume", 0);
    }
    if (selection == 1)
    {
        vol_changed = 1;
        voluming += 0.01;
        ds_add_options("BGM Volume", -voluming);
        if (ds_zero_options("BGM Volume") < 0)
        {
            ds_write_options("BGM Volume", 0);
        }
        music_volume(ds_zero_options("BGM Volume"));
    }
    if (selection == 2)
    {
        ds_add_options("Window Size", -1);
    }
    if (ds_zero_options("Window Size") < 1)
    {
        ds_write_options("Window Size", 1);
    }
    if (selection == 3)
    {
        ds_add_options("Fullscreen", -1);
    }
    if (ds_zero_options("Fullscreen") < 0)
    {
        ds_write_options("Fullscreen", 1);
    }
    if (selection == 5)
    {
        ds_add_options("Autosave", -1);
    }
    if (ds_zero_options("Autosave") < 0)
    {
        ds_write_options("Autosave", 1);
    }
    if (selection == 6)
    {
        ds_add_options("Damage Numbers", -1);
    }
    if (ds_zero_options("Damage Numbers") < 0)
    {
        ds_write_options("Damage Numbers", 1);
    }
    if (selection == 7)
    {
        ds_add_options("Room Names", -1);
    }
    if (ds_zero_options("Room Names") < 0)
    {
        ds_write_options("Room Names", 1);
    }
    if (selection == 8)
    {
        ds_add_options("Vibration", -1);
        if (ds_zero_options("Vibration") < 0)
        {
            ds_write_options("Vibration", 1);
        }
        if (ds_zero_options("Vibration"))
        {
            vibrate_pulse(1, 45);
        }
    }
    if (selection == 9)
    {
        ds_add_options("Hint System", -1);
    }
    if (ds_zero_options("Hint System") < 0)
    {
        ds_write_options("Hint System", 1);
    }
    if (selection == 10)
    {
        ds_add_options("Spiciness", -0.05);
    }
    if (ds_zero_options("Spiciness") < 0.25)
    {
        ds_write_options("Spiciness", 5);
    }
    if (selection == 11)
    {
        ds_add_options("Mouse Aiming", -1);
    }
    if (ds_zero_options("Mouse Aiming") < 0)
    {
        ds_write_options("Mouse Aiming", 1);
    }
    if (selection == 12)
    {
        ds_add_options("Auto Charge", -1);
    }
    if (ds_zero_options("Auto Charge") < 0)
    {
        ds_write_options("Auto Charge", 1);
    }
}
if ((global.key_right_tap || global.key_right_repeat || global.key_accept) && selection != 4 && selection != 13 && !global.key_up && !global.key_down)
{
    bitsound(sndPauseScroll);
    if (selection == 0)
    {
        voluming += 0.01;
        ds_add_options("SFX Volume", voluming);
    }
    if (ds_zero_options("SFX Volume") > 1)
    {
        ds_write_options("SFX Volume", 1);
    }
    if (selection == 1)
    {
        vol_changed = 1;
        voluming += 0.01;
        ds_add_options("BGM Volume", voluming);
        if (ds_zero_options("BGM Volume") > 1)
        {
            ds_write_options("BGM Volume", 1);
        }
        music_volume(ds_zero_options("BGM Volume"));
    }
    if (selection == 2)
    {
        ds_add_options("Window Size", 1);
    }
    if (ds_zero_options("Window Size") > 8)
    {
        ds_write_options("Window Size", 8);
    }
    if (selection == 3)
    {
        ds_add_options("Fullscreen", 1);
    }
    if (ds_zero_options("Fullscreen") > 1)
    {
        ds_write_options("Fullscreen", 0);
    }
    if (selection == 5)
    {
        ds_add_options("Autosave", 1);
    }
    if (ds_zero_options("Autosave") > 1)
    {
        ds_write_options("Autosave", 0);
    }
    if (selection == 6)
    {
        ds_add_options("Damage Numbers", 1);
    }
    if (ds_zero_options("Damage Numbers") > 1)
    {
        ds_write_options("Damage Numbers", 0);
    }
    if (selection == 7)
    {
        ds_add_options("Room Names", 1);
    }
    if (ds_zero_options("Room Names") > 1)
    {
        ds_write_options("Room Names", 0);
    }
    if (selection == 8)
    {
        ds_add_options("Vibration", 1);
        if (ds_zero_options("Vibration") == 1)
        {
            vibrate_pulse(1, 45);
        }
        if (ds_zero_options("Vibration") > 1)
        {
            ds_write_options("Vibration", 0);
        }
    }
    if (selection == 9)
    {
        ds_add_options("Hint System", 1);
    }
    if (ds_zero_options("Hint System") > 1)
    {
        ds_write_options("Hint System", 0);
    }
    if (selection == 10)
    {
        ds_add_options("Spiciness", 0.05);
    }
    if (ds_zero_options("Spiciness") > 5)
    {
        ds_write_options("Spiciness", 0.25);
    }
    if (selection == 11)
    {
        ds_add_options("Mouse Aiming", 1);
    }
    if (ds_zero_options("Mouse Aiming") > 1)
    {
        ds_write_options("Mouse Aiming", 0);
    }
    if (selection == 12)
    {
        ds_add_options("Auto Charge", 1);
    }
    if (ds_zero_options("Auto Charge") > 1)
    {
        ds_write_options("Auto Charge", 0);
    }
}
