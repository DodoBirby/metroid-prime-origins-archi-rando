read_maps();
menu_text = "[fnt_Logbook][NES_Gray][fa_left][fa_top]";
menu_text_1 = "[fnt_Logbook][NES_Gray][fa_left][fa_top]";
menu_text_1 += "[NES_Gray]";
if (selection == 0)
{
    menu_text += ("[c_white]" + cursor_helmet(cursor0));
}
if (!submenu || (submenu && selection != 0))
{
    // -- MW Changes Start: Hide saves not associated with the active multiworld.
    // Repeated for every slot.
    if (hidden0)
    {
        if (selection == 0)
        {
            current_file_state = 2;
        }
        menu_text += "[[Unavailable for current AP seed]\n\n";
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
    else if (ds_map_find_value(map0, "New Game") != undefined)
    {
        // -- MW Changes End
        if (selection == 0)
        {
            current_file_state = 0;
        }
        if (selection == 0)
        {
            menu_text += "[c_white]";
        }
        menu_text += "[[Samus A]";
        repeat (plus0)
        {
            menu_text += "+";
        }
        menu_text += " ";
        menu_text += (string(ds_map_find_value(map0, "Completion")) + "%");
        menu_text += " | ";
        menu_text += txt(area0);
        menu_text += " | ";
        sec_text = string(ds_map_find_value(map0, "Seconds"));
        if (string_length(sec_text) == 1)
        {
            sec_text = "0" + sec_text;
        }
        min_text = string(ds_map_find_value(map0, "Minutes"));
        if (string_length(min_text) == 1)
        {
            min_text = "0" + min_text;
        }
        hour_text = string(ds_map_find_value(map0, "Hours"));
        if (string_length(hour_text) == 1)
        {
            hour_text = "0" + hour_text;
        }
        menu_text += (hour_text + ":" + min_text + ":" + sec_text);
        if (selection != 0)
        {
            menu_text_1 += "[NES_Gray]";
        }
        else
        {
            menu_text_1 += ("[c_white]" + cursor_helmet());
        }
        menu_text += ("\n[sprTanksMenu," + string(ds_map_find_value(map0, "Energy Tanks Max")) + "] " + " [spr_menu_missiles] " + string(ds_map_find_value(map0, "Missiles")) + "/" + string(ds_map_find_value(map0, "Missiles Max")) + " [spr_menu_pbombs] " + string(ds_map_find_value(map0, "Power Bombs")) + "/" + string(ds_map_find_value(map0, "Power Bombs Max")) + " [spr_death_icon] " + string(ds_map_find_value(map0, "Deaths")));
        if (classic0)
        {
            menu_text += txt(" [[Classic]");
        }
        else
        {
            menu_text += txt(" [[Remix]");
        }
        menu_text += "\n";
        menu_text_1 += "\n";
    }
    else
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
        if (selection == 0)
        {
            current_file_state = 1;
        }
        menu_text += ("[[" + txt("New Game") + "]\n");
        menu_text += "\n";
    }
}
if (selection == 0 && submenu)
{
    menu_text += (choice_text + "\n");
    menu_text_1 += "[sprTanksMenu,0]\n";
    if (ds_map_find_value(map0, "New Game") == undefined)
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
}
menu_text += "[NES_Gray]";
if (selection == 1)
{
    menu_text += ("[c_white]" + cursor_helmet(cursor1));
}
if (!submenu || (submenu && selection != 1))
{
    // -- MW Changes Start
    if (hidden1)
    {
        if (selection == 1)
        {
            current_file_state = 2;
        }
        menu_text += "[[Unavailable for current AP seed]\n\n";
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
    else if (ds_map_find_value(map1, "New Game") != undefined)
    {
        // -- MW Changes End
        if (selection == 1)
        {
            current_file_state = 0;
        }
        if (selection == 1)
        {
            menu_text += "[c_white]";
        }
        menu_text += "[[Samus B] ";
        repeat (plus1)
        {
            menu_text += "+";
        }
        menu_text += " ";
        menu_text += (string(ds_map_find_value(map1, "Completion")) + "%");
        menu_text += " | ";
        menu_text += txt(area1);
        menu_text += " | ";
        sec_text = string(ds_map_find_value(map1, "Seconds"));
        if (string_length(sec_text) == 1)
        {
            sec_text = "0" + sec_text;
        }
        min_text = string(ds_map_find_value(map1, "Minutes"));
        if (string_length(min_text) == 1)
        {
            min_text = "0" + min_text;
        }
        hour_text = string(ds_map_find_value(map1, "Hours"));
        if (string_length(hour_text) == 1)
        {
            hour_text = "0" + hour_text;
        }
        menu_text += (hour_text + ":" + min_text + ":" + sec_text);
        if (selection != 1)
        {
            menu_text_1 += "[NES_Gray]";
        }
        else
        {
            menu_text_1 += ("[c_white]" + cursor_helmet());
        }
        menu_text += ("\n[sprTanksMenu," + string(ds_map_find_value(map1, "Energy Tanks Max")) + "] " + " [spr_menu_missiles] " + string(ds_map_find_value(map1, "Missiles")) + "/" + string(ds_map_find_value(map1, "Missiles Max")) + " [spr_menu_pbombs] " + string(ds_map_find_value(map1, "Power Bombs")) + "/" + string(ds_map_find_value(map1, "Power Bombs Max")) + " [spr_death_icon] " + string(ds_map_find_value(map1, "Deaths")));
        if (classic1)
        {
            menu_text += txt(" [[Classic]");
        }
        else
        {
            menu_text += txt(" [[Remix]");
        }
        menu_text += "\n";
        menu_text_1 += "\n";
    }
    else
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
        if (selection == 1)
        {
            current_file_state = 1;
        }
        menu_text += ("[[" + txt("New Game") + "]\n");
        menu_text += "\n";
    }
}
if (selection == 1 && submenu)
{
    menu_text += (choice_text + "\n");
    menu_text_1 += "[sprTanksMenu,0]\n";
    if (ds_map_find_value(map1, "New Game") == undefined)
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
}
menu_text += "[NES_Gray]";
if (selection == 2)
{
    menu_text += ("[c_white]" + cursor_helmet(cursor2));
}
if (!submenu || (submenu && selection != 2))
{
    // -- MW Changes Start
    if (hidden2)
    {
        if (selection == 2)
        {
            current_file_state = 2;
        }
        menu_text += "[[Unavailable for current AP seed]\n\n";
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
    else if (ds_map_find_value(map2, "New Game") != undefined)
    {
        // -- MW Changes End
        if (selection == 2)
        {
            current_file_state = 0;
        }
        if (selection == 2)
        {
            menu_text += "[c_white]";
        }
        menu_text += "[[Samus C] ";
        repeat (plus2)
        {
            menu_text += "+";
        }
        menu_text += " ";
        menu_text += (string(ds_map_find_value(map2, "Completion")) + "%");
        menu_text += " | ";
        menu_text += txt(area2);
        menu_text += " | ";
        sec_text = string(ds_map_find_value(map2, "Seconds"));
        if (string_length(sec_text) == 1)
        {
            sec_text = "0" + sec_text;
        }
        min_text = string(ds_map_find_value(map2, "Minutes"));
        if (string_length(min_text) == 1)
        {
            min_text = "0" + min_text;
        }
        hour_text = string(ds_map_find_value(map2, "Hours"));
        if (string_length(hour_text) == 1)
        {
            hour_text = "0" + hour_text;
        }
        menu_text += (hour_text + ":" + min_text + ":" + sec_text);
        if (selection != 2)
        {
            menu_text_1 += "[NES_Gray]";
        }
        else
        {
            menu_text_1 += ("[c_white]" + cursor_helmet());
        }
        menu_text += ("\n[sprTanksMenu," + string(ds_map_find_value(map2, "Energy Tanks Max")) + "] " + " [spr_menu_missiles] " + string(ds_map_find_value(map2, "Missiles")) + "/" + string(ds_map_find_value(map2, "Missiles Max")) + " [spr_menu_pbombs] " + string(ds_map_find_value(map2, "Power Bombs")) + "/" + string(ds_map_find_value(map2, "Power Bombs Max")) + " [spr_death_icon] " + string(ds_map_find_value(map2, "Deaths")));
        if (classic2)
        {
            menu_text += txt(" [[Classic]");
        }
        else
        {
            menu_text += txt(" [[Remix]");
        }
        menu_text += "\n";
        menu_text_1 += "\n";
    }
    else
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
        if (selection == 2)
        {
            current_file_state = 1;
        }
        menu_text += ("[[" + txt("New Game") + "]\n");
        menu_text += "\n";
    }
}
if (selection == 2 && submenu)
{
    menu_text += (choice_text + "\n");
    menu_text_1 += "[sprTanksMenu,0]\n";
    if (ds_map_find_value(map2, "New Game") == undefined)
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
}
menu_text += "[NES_Gray]";
if (selection == 3)
{
    menu_text += ("[c_white]" + cursor_helmet(cursor3));
}
if (!submenu || (submenu && selection != 3))
{
    // -- MW Changes Start
    if (hidden3)
    {
        if (selection == 3)
        {
            current_file_state = 2;
        }
        menu_text += "[[Unavailable for current AP seed]\n\n";
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
    else if (ds_map_find_value(map3, "New Game") != undefined)
    {
        // -- MW Changes End
        if (selection == 3)
        {
            current_file_state = 0;
        }
        if (selection == 3)
        {
            menu_text += "[c_white]";
        }
        menu_text += "[[Samus D] ";
        repeat (plus3)
        {
            menu_text += "+";
        }
        menu_text += " ";
        menu_text += (string(ds_map_find_value(map3, "Completion")) + "%");
        menu_text += " | ";
        menu_text += txt(area3);
        menu_text += " | ";
        sec_text = string(ds_map_find_value(map3, "Seconds"));
        if (string_length(sec_text) == 1)
        {
            sec_text = "0" + sec_text;
        }
        min_text = string(ds_map_find_value(map3, "Minutes"));
        if (string_length(min_text) == 1)
        {
            min_text = "0" + min_text;
        }
        hour_text = string(ds_map_find_value(map3, "Hours"));
        if (string_length(hour_text) == 1)
        {
            hour_text = "0" + hour_text;
        }
        menu_text += (hour_text + ":" + min_text + ":" + sec_text);
        if (selection != 3)
        {
            menu_text_1 += "[NES_Gray]";
        }
        else
        {
            menu_text_1 += ("[c_white]" + cursor_helmet());
        }
        menu_text += ("\n[sprTanksMenu," + string(ds_map_find_value(map3, "Energy Tanks Max")) + "] " + " [spr_menu_missiles] " + string(ds_map_find_value(map3, "Missiles")) + "/" + string(ds_map_find_value(map3, "Missiles Max")) + " [spr_menu_pbombs] " + string(ds_map_find_value(map3, "Power Bombs")) + "/" + string(ds_map_find_value(map3, "Power Bombs Max")) + " [spr_death_icon] " + string(ds_map_find_value(map3, "Deaths")));
        if (classic3)
        {
            menu_text += txt(" [[Classic]");
        }
        else
        {
            menu_text += txt(" [[Remix]");
        }
        menu_text += "\n";
        menu_text_1 += "\n";
    }
    else
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
        if (selection == 3)
        {
            current_file_state = 1;
        }
        menu_text += ("[[" + txt("New Game") + "]\n");
        menu_text += "\n";
    }
}
if (selection == 3 && submenu)
{
    menu_text += (choice_text + "\n");
    menu_text_1 += "[sprTanksMenu,0]\n";
    if (ds_map_find_value(map3, "New Game") == undefined)
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
}
menu_text += "[NES_Gray]";
if (selection == 4)
{
    menu_text += ("[c_white]" + cursor_helmet(cursor4));
}
if (!submenu || (submenu && selection != 4))
{
    // -- MW Changes Start
    if (hidden4)
    {
        if (selection == 4)
        {
            current_file_state = 2;
        }
        menu_text += "[[Unavailable for current AP seed]\n\n";
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
    else if (ds_map_find_value(map4, "New Game") != undefined)
    {
        // -- MW Changes End
        if (selection == 4)
        {
            current_file_state = 0;
        }
        if (selection == 4)
        {
            menu_text += "[c_white]";
        }
        menu_text += "[[Samus E] ";
        repeat (plus4)
        {
            menu_text += "+";
        }
        menu_text += " ";
        menu_text += (string(ds_map_find_value(map4, "Completion")) + "%");
        menu_text += " | ";
        menu_text += txt(area4);
        menu_text += " | ";
        sec_text = string(ds_map_find_value(map4, "Seconds"));
        if (string_length(sec_text) == 1)
        {
            sec_text = "0" + sec_text;
        }
        min_text = string(ds_map_find_value(map4, "Minutes"));
        if (string_length(min_text) == 1)
        {
            min_text = "0" + min_text;
        }
        hour_text = string(ds_map_find_value(map4, "Hours"));
        if (string_length(hour_text) == 1)
        {
            hour_text = "0" + hour_text;
        }
        menu_text += (hour_text + ":" + min_text + ":" + sec_text);
        if (selection != 4)
        {
            menu_text_1 += "[NES_Gray]";
        }
        else
        {
            menu_text_1 += ("[c_white]" + cursor_helmet());
        }
        menu_text += ("\n[sprTanksMenu," + string(ds_map_find_value(map4, "Energy Tanks Max")) + "] " + " [spr_menu_missiles] " + string(ds_map_find_value(map4, "Missiles")) + "/" + string(ds_map_find_value(map4, "Missiles Max")) + " [spr_menu_pbombs] " + string(ds_map_find_value(map4, "Power Bombs")) + "/" + string(ds_map_find_value(map4, "Power Bombs Max")) + " [spr_death_icon] " + string(ds_map_find_value(map4, "Deaths")));
        if (classic4)
        {
            menu_text += txt(" [[Classic]");
        }
        else
        {
            menu_text += txt(" [[Remix]");
        }
        menu_text += "\n";
        menu_text_1 += "\n";
    }
    else
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
        if (selection == 4)
        {
            current_file_state = 1;
        }
        menu_text += ("[[" + txt("New Game") + "]\n");
        menu_text += "\n";
    }
}
if (selection == 4 && submenu)
{
    menu_text += (choice_text + "\n");
    menu_text_1 += "[sprTanksMenu,0]\n";
    if (ds_map_find_value(map4, "New Game") == undefined)
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
}
menu_text += "[NES_Gray]";
if (selection == 5)
{
    menu_text += ("[c_white]" + cursor_helmet(cursor5));
}
if (!submenu || (submenu && selection != 5))
{
    // -- MW Changes Start
    if (hidden5)
    {
        if (selection == 5)
        {
            current_file_state = 2;
        }
        menu_text += "[[Unavailable for current AP seed]\n\n";
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
    else if (ds_map_find_value(map5, "New Game") != undefined)
    {
        // -- MW Changes End
        if (selection == 5)
        {
            current_file_state = 0;
        }
        menu_text += "[[Samus F] ";
        repeat (plus5)
        {
            menu_text += "+";
        }
        menu_text += " ";
        menu_text += (string(ds_map_find_value(map5, "Completion")) + "%");
        menu_text += " | ";
        menu_text += txt(area5);
        menu_text += " | ";
        sec_text = string(ds_map_find_value(map5, "Seconds"));
        if (string_length(sec_text) == 1)
        {
            sec_text = "0" + sec_text;
        }
        min_text = string(ds_map_find_value(map5, "Minutes"));
        if (string_length(min_text) == 1)
        {
            min_text = "0" + min_text;
        }
        hour_text = string(ds_map_find_value(map5, "Hours"));
        if (string_length(hour_text) == 1)
        {
            hour_text = "0" + hour_text;
        }
        menu_text += (hour_text + ":" + min_text + ":" + sec_text);
        if (selection != 5)
        {
            menu_text_1 += "[NES_Gray]";
        }
        else
        {
            menu_text_1 += ("[c_white]" + cursor_helmet());
        }
        menu_text += ("\n[sprTanksMenu," + string(ds_map_find_value(map5, "Energy Tanks Max")) + "] " + " [spr_menu_missiles] " + string(ds_map_find_value(map5, "Missiles")) + "/" + string(ds_map_find_value(map5, "Missiles Max")) + " [spr_menu_pbombs] " + string(ds_map_find_value(map5, "Power Bombs")) + "/" + string(ds_map_find_value(map5, "Power Bombs Max")) + " [spr_death_icon] " + string(ds_map_find_value(map5, "Deaths")));
        if (classic5)
        {
            menu_text += txt(" [[Classic]");
        }
        else
        {
            menu_text += txt(" [[Remix]");
        }
        menu_text += "\n";
        menu_text_1 += "\n";
    }
    else
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
        if (selection == 5)
        {
            current_file_state = 1;
        }
        menu_text += ("[[" + txt("New Game") + "]\n");
        menu_text += "\n";
    }
}
if (selection == 5 && submenu)
{
    menu_text += (choice_text + "\n");
    menu_text_1 += "[sprTanksMenu,0]\n";
    if (ds_map_find_value(map5, "New Game") == undefined)
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
}
menu_text += "[NES_Gray]";
if (selection == 6)
{
    menu_text += ("[c_white]" + cursor_helmet(cursor6));
}
if (!submenu || (submenu && selection != 6))
{
    // -- MW Changes Start
    if (hidden6)
    {
        if (selection == 6)
        {
            current_file_state = 2;
        }
        menu_text += "[[Unavailable for current AP seed]\n\n";
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
    else if (ds_map_find_value(map6, "New Game") != undefined)
    {
        // -- MW Changes End
        if (selection == 6)
        {
            current_file_state = 0;
        }
        menu_text += "[[Samus G] ";
        repeat (plus6)
        {
            menu_text += "+";
        }
        menu_text += " ";
        menu_text += (string(ds_map_find_value(map6, "Completion")) + "%");
        menu_text += " | ";
        menu_text += txt(area6);
        menu_text += " | ";
        sec_text = string(ds_map_find_value(map6, "Seconds"));
        if (string_length(sec_text) == 1)
        {
            sec_text = "0" + sec_text;
        }
        min_text = string(ds_map_find_value(map6, "Minutes"));
        if (string_length(min_text) == 1)
        {
            min_text = "0" + min_text;
        }
        hour_text = string(ds_map_find_value(map6, "Hours"));
        if (string_length(hour_text) == 1)
        {
            hour_text = "0" + hour_text;
        }
        menu_text += (hour_text + ":" + min_text + ":" + sec_text);
        if (selection != 5)
        {
            menu_text_1 += "[NES_Gray]";
        }
        else
        {
            menu_text_1 += ("[c_white]" + cursor_helmet());
        }
        menu_text += ("\n[sprTanksMenu," + string(ds_map_find_value(map6, "Energy Tanks Max")) + "] " + " [spr_menu_missiles] " + string(ds_map_find_value(map6, "Missiles")) + "/" + string(ds_map_find_value(map6, "Missiles Max")) + " [spr_menu_pbombs] " + string(ds_map_find_value(map6, "Power Bombs")) + "/" + string(ds_map_find_value(map6, "Power Bombs Max")) + " [spr_death_icon] " + string(ds_map_find_value(map6, "Deaths")));
        if (classic6)
        {
            menu_text += txt(" [[Classic]");
        }
        else
        {
            menu_text += txt(" [[Remix]");
        }
        menu_text += "\n";
        menu_text_1 += "\n";
    }
    else
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
        if (selection == 6)
        {
            current_file_state = 1;
        }
        menu_text += ("[[" + txt("New Game") + "]\n");
        menu_text += "\n";
    }
}
if (selection == 6 && submenu)
{
    menu_text += (choice_text + "\n");
    menu_text_1 += "[sprTanksMenu,0]\n";
    if (ds_map_find_value(map6, "New Game") == undefined)
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
}
menu_text += "[NES_Gray]";
if (selection == 7)
{
    menu_text += ("[c_white]" + cursor_helmet(cursor7));
}
if (!submenu || (submenu && selection != 7))
{
    // -- MW Changes Start
    if (hidden7)
    {
        if (selection == 7)
        {
            current_file_state = 2;
        }
        menu_text += "[[Unavailable for current AP seed]\n\n";
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
    else if (ds_map_find_value(map7, "New Game") != undefined)
    {
        // -- MW Changes End
        if (selection == 7)
        {
            current_file_state = 0;
        }
        menu_text += "[[Samus H] ";
        repeat (plus7)
        {
            menu_text += "+";
        }
        menu_text += " ";
        menu_text += (string(ds_map_find_value(map7, "Completion")) + "%");
        menu_text += " | ";
        menu_text += txt(area7);
        menu_text += " | ";
        sec_text = string(ds_map_find_value(map7, "Seconds"));
        if (string_length(sec_text) == 1)
        {
            sec_text = "0" + sec_text;
        }
        min_text = string(ds_map_find_value(map7, "Minutes"));
        if (string_length(min_text) == 1)
        {
            min_text = "0" + min_text;
        }
        hour_text = string(ds_map_find_value(map7, "Hours"));
        if (string_length(hour_text) == 1)
        {
            hour_text = "0" + hour_text;
        }
        menu_text += (hour_text + ":" + min_text + ":" + sec_text);
        if (selection != 5)
        {
            menu_text_1 += "[NES_Gray]";
        }
        else
        {
            menu_text_1 += ("[c_white]" + cursor_helmet());
        }
        menu_text += ("\n[sprTanksMenu," + string(ds_map_find_value(map7, "Energy Tanks Max")) + "] " + " [spr_menu_missiles] " + string(ds_map_find_value(map7, "Missiles")) + "/" + string(ds_map_find_value(map7, "Missiles Max")) + " [spr_menu_pbombs] " + string(ds_map_find_value(map7, "Power Bombs")) + "/" + string(ds_map_find_value(map7, "Power Bombs Max")) + " [spr_death_icon] " + string(ds_map_find_value(map7, "Deaths")));
        if (classic7)
        {
            menu_text += txt(" [[Classic]");
        }
        else
        {
            menu_text += txt(" [[Remix]");
        }
        menu_text += "\n";
        menu_text_1 += "\n";
    }
    else
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
        if (selection == 7)
        {
            current_file_state = 1;
        }
        menu_text += ("[[" + txt("New Game") + "]\n");
        menu_text += "\n";
    }
}
if (selection == 7 && submenu)
{
    menu_text += (choice_text + "\n");
    menu_text_1 += "[sprTanksMenu,0]\n";
    if (ds_map_find_value(map7, "New Game") == undefined)
    {
        menu_text_1 += "[sprTanksMenu,0]\n[sprTanksMenu,0]\n";
    }
}
prompt_text = "[c_white][fa_right][fnt_Logbook]";
if (selection == 0 && clear0)
{
    prompt_text += (butt("option_y") + txt(" New Game+ | "));
}
if (selection == 1 && clear1)
{
    prompt_text += (butt("option_y") + txt(" New Game+ | "));
}
if (selection == 2 && clear2)
{
    prompt_text += (butt("option_y") + txt(" New Game+ | "));
}
if (selection == 3 && clear3)
{
    prompt_text += (butt("option_y") + txt(" New Game+ | "));
}
if (selection == 4 && clear4)
{
    prompt_text += (butt("option_y") + txt(" New Game+ | "));
}
if (selection == 5 && clear5)
{
    prompt_text += (butt("option_y") + txt(" New Game+ | "));
}
if (selection == 6 && clear6)
{
    prompt_text += (butt("option_y") + txt(" New Game+ | "));
}
if (selection == 7 && clear7)
{
    prompt_text += (butt("option_y") + txt(" New Game+ | "));
}
prompt_text += (butt("accept") + txt(" Select | "));
prompt_text += (butt("cancel") + txt(" Return\n"));
choice_text = "[fnt_Logbook][c_white][fa_left][fa_top]";

function mode_description()
{
    if (sub_selection == 0)
    {
        return "    [NES_Yellow]" + txt("Mission:[c_white] Defeat all the bosses\n    [NES_Yellow]Artifacts:[c_white] OPTIONAL Aeon Power-Ups");
    }
    else
    {
        return "    [NES_Yellow]" + txt("Mission:[c_white] Unlock the Chozo Cipher\n    [NES_Yellow]Artifacts:[c_white] MANDATORY Cipher Keys");
    }
}

// -- MW Changes Start
if (current_file_state == 2)
{
    choice_text += " This file belongs to another AP seed.\n[sprTanksMenu,0]";
}
else if (current_file_state)
{
    // -- MW Changes End
    if (submenu && sub_selection == 0)
    {
        choice_text += " [[";
    }
    choice_text += txt(" Remix Mode ");
    if (submenu && sub_selection == 0)
    {
        choice_text += "] ";
    }
    choice_text += "    ";
    if (submenu && sub_selection == 1)
    {
        choice_text += " [[";
    }
    choice_text += txt(" Classic Mode ");
    if (submenu && sub_selection == 1)
    {
        choice_text += "] ";
    }
    choice_text += ("\n" + mode_description());
    choice_text += "[sprTanksMenu,0]";
}
else
{
    if (submenu && sub_selection == 0)
    {
        choice_text += " [[";
    }
    choice_text += txt(" Start Game ");
    if (submenu && sub_selection == 0)
    {
        choice_text += "] ";
    }
    choice_text += "    ";
    if (submenu && sub_selection == 1)
    {
        choice_text += " [[";
    }
    choice_text += txt(" Erase File ");
    if (submenu && sub_selection == 1)
    {
        choice_text += "]";
    }
    choice_text += "\n[sprTanksMenu,0]";
}
