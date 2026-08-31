function ir(arg0 = 1)
{
    return irandom(arg0);
}

function selection_vertical(arg0, arg1 = 0, arg2 = 0, arg3 = 5)
{
    if (global.key_left || global.key_right)
    {
        exit;
    }
    bitvar("selection");
    if (!variable_instance_exists(id, "selection_sound"))
    {
        selection_sound = 0;
    }
    selection += menu_opposing_delta(UnknownEnum.Value_0, UnknownEnum.Value_1, arg2, arg3);
    if (selection < 0)
    {
        selection = arg0;
    }
    if (selection > arg0)
    {
        selection = 0;
    }
    if (selection_sound != selection)
    {
        if (audio_exists(arg1))
        {
            bitsound(arg1);
        }
        selection_sound = selection;
        vibrate(1/3, 4);
    }
}

function selection_horizontal(arg0, arg1 = 0, arg2 = 0)
{
    if (global.key_up || global.key_down)
    {
        exit;
    }
    bitvar("selection");
    if (!variable_instance_exists(id, "selection_sound"))
    {
        selection_sound = 0;
    }
    selection += menu_opposing_delta(UnknownEnum.Value_2, UnknownEnum.Value_3, arg2);
    if (selection < 0)
    {
        selection = arg0;
    }
    if (selection > arg0)
    {
        selection = 0;
    }
    if (selection_sound != selection)
    {
        if (audio_exists(arg1))
        {
            bitsound(arg1);
        }
        selection_sound = selection;
    }
}

function selection_vertical_two_columns(arg0, arg1 = 0, arg2 = 0, arg3 = "selection")
{
    variable_instance_set(id, arg3, variable_instance_get(id, arg3) + (2 * menu_opposing_delta(UnknownEnum.Value_0, UnknownEnum.Value_1, arg2)));
    variable_instance_set(id, arg3, variable_instance_get(id, arg3) + menu_opposing_delta(UnknownEnum.Value_2, UnknownEnum.Value_3, arg2));
    if (variable_instance_get(id, arg3) < 0)
    {
        variable_instance_set(id, arg3, 0);
    }
    if (variable_instance_get(id, arg3) > arg0)
    {
        variable_instance_set(id, arg3, arg0);
    }
    if (!variable_instance_exists(id, "selection_sound"))
    {
        selection_sound = 0;
    }
    if (selection_sound != selection)
    {
        if (audio_exists(arg1))
        {
            bitsound(arg1);
        }
        selection_sound = selection;
    }
}

function map_offset(arg0, arg1)
{
    global.map_room_x = arg0;
    global.map_room_y = arg1;
}

function new_damage_number(arg0, arg1 = x, arg2 = y, arg3 = 16777215, arg4 = 0)
{
    if (!ds_zero_options("Damage Numbers") && !arg4)
    {
        exit;
    }
    arg1 += (-7 + irandom(14));
    arg2 += (-7 + irandom(14));
    arg2 -= 14;
    array_push(global.damage_number_queue, [arg0, 0, 0, arg1, arg2, arg3]);
}

// -- MW Changes Start
function show_item_pickup_text(text)
{
    with (instance_create_layer(0, 0, "Instances", obj_message_in_game))
    {
        message_0 = text;
    }
}

function grant_item(item)
{
    switch item
    {
        case "Bombs":
            show_item_pickup_text("Bombs obtained");
            ds_write("Morph Ball Bomb", 1);
            break;
        case "Space Jump":
            show_item_pickup_text("Space jump obtained");
            ds_write("Space Jump Boots", 1);
            break;
        case "Energy Tank":
            show_item_pickup_text("Energy tank obtained");
            ds_add("Energy Tanks Max", 1);
            break;
    }
}
// -- MW Changes End

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3
}
