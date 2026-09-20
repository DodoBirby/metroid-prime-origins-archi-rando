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
menu_string += (txt("Return to Title") + "\n\n\n\n\n");
menu_string += ("\n\n" + butt("cancel") + "/" + butt("menu") + txt(" Return"));
draw_text_scribble(48, (global._screen_height - 12) + menu_offset, menu_string);
