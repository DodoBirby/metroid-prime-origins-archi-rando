if (!leaving)
{
    menu_offset = lerp(menu_offset, 0, 0.1);
}
else
{
    menu_offset = lerp(menu_offset, global._screen_height, 0.1);
    if (menu_offset > (global._screen_height - 32))
    {
        instance_destroy();
    }
}
if (menu_offset > 32)
{
    exit;
}
if (category == CREATURES)
{
    category_array = ds_zero("Creatures");
    log_array = ds_zero("Creatures Logs");
}
if (category == PIRATE_DATA)
{
    category_array = ds_zero("Pirate Data");
    log_array = ds_zero("Pirate Data Logs");
}
if (category == CHOZO_LORE)
{
    category_array = ds_zero("Chozo Lore");
    log_array = ds_zero("Chozo Lore Logs");
}
if (category == ARTIFACTS)
{
    category_array = ds_zero("Chozo Artifacts");
    log_array = ds_zero("Chozo Artifacts Logs");
}
if (left_selection == 0)
{
    category = PIRATE_DATA;
}
if (left_selection == 1)
{
    category = CHOZO_LORE;
}
if (left_selection == 2)
{
    category = CREATURES;
}
if (left_selection == 3)
{
    category = ARTIFACTS;
}
selection_offset = floor(right_selection / 5) * 5;
if (side == 0 && !examining)
{
    selection_vertical(3, sndPauseScroll, 0, 7);
    left_selection = selection;
    right_selection = 0;
    description_position = 0;
    if (global.key_accept && !global.key_up && !global.key_down && !global.key_left && !global.key_right)
    {
        side = 1;
        selection = 0;
        bitsound(sndPauseSelect);
        exit;
    }
    if (global.key_cancel || global.key_menu)
    {
        bitsound(sndPauseReject);
        leaving = 1;
        exit;
    }
}
if (side == 1)
{
    if (!examining)
    {
        // -- MW Changes Start
        /*
        if (category == CREATURES)
        {
            selection_vertical(81, sndPauseScroll, 0, 7);
        }
        if (category == PIRATE_DATA)
        {
            selection_vertical(24, sndPauseScroll, 0, 7);
        }
        if (category == CHOZO_LORE)
        {
            selection_vertical(15, sndPauseScroll, 0, 7);
        }
        if (category == ARTIFACTS)
        {
            selection_vertical(11, sndPauseScroll, 0, 7);
        }
        */
        selection_vertical(array_length(log_array) - 1, sndPauseScroll, 0, 7);
        // -- MW Changes End
        right_selection = selection;
        if (global.key_up || global.key_down)
        {
            description_position = 0;
        }
        else
        {
            description_position += 4;
        }
        if (global.key_accept && examining && !global.key_up && !global.key_down && !global.key_left && !global.key_right)
        {
            bitsound(sndPauseSelect);
            examining = 0;
            exit;
        }
    }
    else
    {
        description_position += 7;
    }
    if (global.key_accept && !examining && !global.key_up && !global.key_down && !global.key_left && !global.key_right)
    {
        bitsound(sndPauseSelect);
        examining += 1;
        if (examining > 1)
        {
            examining = 0;
        }
        exit;
    }
    if (global.key_cancel)
    {
        bitsound(sndPauseReject);
        if (!examining)
        {
            side = 0;
            selection = left_selection;
        }
        else
        {
            examining = 0;
        }
        exit;
    }
    if (global.key_menu)
    {
        bitsound(sndPauseReject);
        leaving = 1;
        exit;
    }
}
if (examining)
{
    middle_size = lerp(middle_size, 4, 0.1);
    yspd += ((0.1 * global.key_up) + (-0.1 * global.key_down));
    if (!global.key_up && !global.key_down)
    {
        yspd *= 0.69;
    }
    if (abs(yspd) < 0.01)
    {
        yspd = 0;
    }
    yspd = clamp(yspd, -1, 1);
    _h = string_height_scribble_ext(center_string, description_width);
    y_off += yspd;
    y_off = clamp(y_off, -_h + 160, 0);
}
else
{
    y_off = lerp(y_off, 0, 0.1);
    yspd = 0;
    middle_size = lerp(middle_size, 1, 0.1);
}
control_counter += 1;
if (control_counter > 60)
{
    control_counter = 0;
}
