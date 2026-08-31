if (room == rm_Title)
{
    menu_string = "[fnt_Big][NES_Cyan][fa_left][fa_bottom]";
    menu_string += (txt("OPTIONS") + "[fnt_Logbook]\n");
}
else
{
    menu_string = "[fnt_Big][NES_Cyan][fa_left][fa_bottom]";
    menu_string += (txt("OPTIONS") + "[fnt_Logbook]\n");
}
if (selection == 0)
{
    menu_string += cursor_helmet();
}
menu_string += (txt("Sound Volume: ") + "[wave]<[/wave] " + string(round(ds_zero_options("SFX Volume") * 100)) + "% [wave]>[/wave]\n");
if (selection == 1)
{
    menu_string += cursor_helmet();
}
menu_string += (txt("Music Volume: ") + "[wave]<[/wave] " + string(round(ds_zero_options("BGM Volume") * 100)) + "% [wave]>[/wave]\n");
if (selection == 2)
{
    menu_string += cursor_helmet();
}
menu_string += (txt("Window Size: ") + "[wave]<[/wave] " + string(round(ds_zero_options("Window Size"))) + "x [wave]>[/wave]\n");
if (selection == 3)
{
    menu_string += cursor_helmet();
}
menu_string += txt("Fullscreen: ");
if (ds_zero_options("Fullscreen"))
{
    menu_string += (txt("[wave]<[/wave] ON [wave]>[/wave]") + "\n");
}
else
{
    menu_string += (txt("[wave]<[/wave] OFF [wave]>[/wave]") + "\n");
}
if (selection == 4)
{
    menu_string += cursor_helmet();
}
menu_string += (txt("Control Customization") + "\n");
if (selection == 5)
{
    menu_string += cursor_helmet();
}
menu_string += txt("Auto-Save: ");
if (ds_zero_options("Autosave"))
{
    menu_string += (txt("[wave]<[/wave] ON [wave]>[/wave]") + "\n");
}
else
{
    menu_string += (txt("[wave]<[/wave] OFF [wave]>[/wave]") + "\n");
}
if (selection == 6)
{
    menu_string += cursor_helmet();
}
menu_string += txt("Damage Values: ");
if (ds_zero_options("Damage Numbers"))
{
    menu_string += (txt("[wave]<[/wave] Show [wave]>[/wave]") + "\n");
}
else
{
    menu_string += (txt("[wave]<[/wave] Hide [wave]>[/wave]") + "\n");
}
if (selection == 7)
{
    menu_string += cursor_helmet();
}
menu_string += txt("Display Room Names: ");
if (ds_zero_options("Room Names"))
{
    menu_string += (txt("[wave]<[/wave] Always [wave]>[/wave]") + "\n");
}
else
{
    menu_string += (txt("[wave]<[/wave] Map Only [wave]>[/wave]") + "\n");
}
if (selection == 8)
{
    menu_string += cursor_helmet();
}
menu_string += txt("Controller Vibration: ");
if (ds_zero_options("Vibration"))
{
    menu_string += (txt("[wave]<[/wave] ON [wave]>[/wave]") + "\n");
}
else
{
    menu_string += (txt("[wave]<[/wave] OFF [wave]>[/wave]") + "\n");
}
if (selection == 9)
{
    menu_string += cursor_helmet();
}
menu_string += txt("Hint System: ");
if (ds_zero_options("Hint System"))
{
    menu_string += (txt("[wave]<[/wave] ON [wave]>[/wave]") + "\n");
}
else
{
    menu_string += (txt("[wave]<[/wave] OFF [wave]>[/wave]") + "\n");
}
if (ds_zero_options("Spiciness") >= 2.5)
{
    menu_string += "[shake]";
}
if (selection == 10)
{
    menu_string += cursor_helmet();
}
menu_string += (txt("Difficulty: ") + "[wave]<[/wave][NES_Red] " + string(round(ds_zero_options("Spiciness") * 100)) + "% [wave][NES_Cyan]>[/wave]\n");
menu_string += "[/shake]";
if (selection == 11)
{
    menu_string += cursor_helmet();
}
menu_string += txt("Mouse Aiming: ");
if (ds_zero_options("Mouse Aiming"))
{
    menu_string += (txt("[wave]<[/wave] ON [wave]>[/wave]") + "\n");
}
else
{
    menu_string += (txt("[wave]<[/wave] OFF [wave]>[/wave]") + "\n");
}
if (selection == 12)
{
    menu_string += cursor_helmet();
}
menu_string += txt("Auto-Charge: ");
if (ds_zero_options("Auto Charge"))
{
    menu_string += (txt("[wave]<[/wave] ON [wave]>[/wave]") + "\n");
}
else
{
    menu_string += (txt("[wave]<[/wave] OFF [wave]>[/wave]") + "\n");
}
// -- MW Change: Add new menu item and bump the save + return to title item up
if (selection == 13)
{
    menu_string += cursor_helmet();
}
menu_string += "Load Seed File\n";
if (selection == 14)
{
    menu_string += cursor_helmet();
}
menu_string += (txt("Save + Return to Title") + "\n");
menu_string += ("\n\n" + butt("cancel") + "/" + butt("menu") + txt(" Save Changes & Return"));
draw_text_scribble(48, (global._screen_height - 12) + menu_offset, menu_string);
