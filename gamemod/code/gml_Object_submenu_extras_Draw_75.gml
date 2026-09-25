menu_string = "[fnt_Big][NES_Red][fa_left][fa_bottom]";
menu_string += (txt("EXTRAS") + "[fnt_Logbook]\n\n");
if (selection == 0)
{
    menu_string += cursor_helmet();
}
if (dze("Fusion Mode"))
{
    menu_string += txt("Fusion Mode");
}
else
{
    menu_string += txt("??????");
}
menu_string += "\n\n";
if (selection == 1)
{
    menu_string += cursor_helmet();
}
if (dze("Retro Mode"))
{
    menu_string += txt("Retro Mode");
}
else
{
    menu_string += txt("??????");
}
menu_string += "\n\n";
if (selection == 2)
{
    menu_string += cursor_helmet();
}
menu_string += txt("Credits");
menu_string += "\n\n";
// -- MW Change: Add new menu entry and bump next entry selection number
if (selection == 3)
{
    menu_string += cursor_helmet();
}
menu_string += "Load Solo Seed File";
menu_string += "\n\n";

if (selection == 4)
{
    menu_string += cursor_helmet();
}
// -- MW Changes Start
var apStatus = "unavailable";
var apAction = "AP Connect";
var apIdentity = "";
if (instance_exists(obj_MWConnector))
{
    apStatus = obj_MWConnector.nativeState;
    if (obj_MWConnector.nativeSessionActive)
    {
        apAction = "AP Disconnect";
    }
    if (obj_MWConnector.nativeHost != "" || obj_MWConnector.nativeSlot != "")
    {
        apIdentity = obj_MWConnector.nativeEscapeDisplay(obj_MWConnector.nativeHost + " / " + obj_MWConnector.nativeSlot);
    }
}
menu_string += apAction + " (" + apStatus + ")";
if (apIdentity != "")
{
    menu_string += "\n   [indent]" + apIdentity + "[/indent]";
}
menu_string += "\n\n";

if (selection == 5)
{
    menu_string += cursor_helmet();
}
menu_string += "AP Chat";
if (instance_exists(obj_MWConnector))
{
    var firstMessage = max(0, array_length(obj_MWConnector.nativeMessages) - 2);
    for (var messageIndex = firstMessage; messageIndex < array_length(obj_MWConnector.nativeMessages); messageIndex++)
    {
        menu_string += "\n   [indent]" + obj_MWConnector.nativeMessages[messageIndex] + "[/indent][NES_Red]";
    }
}
menu_string += "\n\n";

if (selection == 6)
{
    menu_string += cursor_helmet();
}
menu_string += (txt("Return to Title") + "\n\n");
// -- MW Changes End
menu_string += ("\n\n" + butt("cancel") + "/" + butt("menu") + txt(" Return"));
// -- MW Changes Start
var menuWidth = global._screen_width - 56;
var menuOverflow = max(0, string_height_scribble_ext(menu_string, menuWidth) - (global._screen_height - 24));
var menuScrollTarget = menuOverflow * (1 - (selection / 6));
if (!variable_instance_exists(id, "menu_scroll"))
{
    menu_scroll = menuScrollTarget;
}
menu_scroll = lerp(menu_scroll, menuScrollTarget, 0.25);
draw_text_scribble_ext(48, (global._screen_height - 12) + menu_offset + menu_scroll, menu_string, menuWidth);
// -- MW Changes End
