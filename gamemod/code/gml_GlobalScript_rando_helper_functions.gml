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
        case "Power Bomb":
            ds_write("Power Bomb Detonator", 1);
            ds_add("Power Bombs", 2);
            ds_add("Power Bombs Max", 2);
            break;
        case "Energy Tank":
            ds_add("Energy Tanks Max", 1);
            ds_write("Energy", 99);
            ds_write("Energy Tanks", dz("Energy Tanks Max"));
            ds_write("Energy Tank", 1);
            break;
        case "Missile Tank":
            ds_write("Missile Launcher", 1);
            ds_add("Missiles", 5);
            ds_add("Missiles Max", 5);
            break;
        default:
            var ds_name = convert_mw_name_to_ds_name(item);
            if (dz(ds_name) == 0)
            {
                ds_write(ds_name, 1);
                if (string_pos("Artifact", ds_name) != 0)
                {
                    mw_handle_aeon_powers(ds_name);
                }
            }
            break;
    }
}

function load_seed_file(path)
{
    var file = file_text_open_read(path);
    var base64 = file_text_readln(file);
    var json = base64_decode(base64);
    var payload = json_decode(json);
    var result = false;
    if (payload != -1)
    {
        ds_map_copy(global.mwLocations, ds_map_find_value(payload, "items"));
        ds_list_copy(global.localStarterItems, ds_map_find_value(payload, "starter_items"));
        ds_map_destroy(payload);
        global.localSeed = true;
        result = true;
    }
    file_text_close(file);
    return result;
}