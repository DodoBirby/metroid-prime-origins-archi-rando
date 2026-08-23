function handle_locations_cmd(payload)
{
    var locationsMap = ds_map_find_value(payload, "locations");
    ds_map_copy(global.mwLocations, locationsMap);
    global.seedreceived = 1;
}

function handle_items_cmd(payload)
{
    if (!instance_exists(obj_samus))
    {
        return;
    }
    var numItemsReceived = 0;
    var lastItemReceived = "";
    
    var prevmissiletanks = dz("Missiles Max") / 5;
    var prevetanks = dz("Energy Tanks Max");
    var prevpbombtanks = dz("Power Bombs Max") / 2;
    var etanks = ds_map_find_value(payload, "etanks");
    ds_write("Energy Tanks Max", etanks);
    var missiletanks = ds_map_find_value(payload, "missiletanks");
    ds_write("Missiles Max", missiletanks * 5);
    var pbombtanks = ds_map_find_value(payload, "pbombtanks");
    ds_write("Power Bombs Max", pbombtanks * 2);
    
    if (missiletanks > 0)
    {
        ds_write("Missile Launcher", 1);
        if (prevmissiletanks < missiletanks)
        {
            numItemsReceived += missiletanks - prevmissiletanks;
            lastItemReceived = "Missile Tank";
            ds_add("Missiles", (missiletanks - prevmissiletanks) * 5);
        }
    }
    if (pbombtanks > 0)
    {
        ds_write("Power Bomb Detonator", 1);
        if (prevpbombtanks < pbombtanks)
        {
            numItemsReceived += pbombtanks - prevpbombtanks;
            lastItemReceived = "Power Bomb";
            ds_add("Power Bombs", (pbombtanks - prevpbombtanks) * 2);
        }
    }
    if (etanks > 0)
    {
        ds_write("Energy Tank", 1);
        if (prevetanks < etanks)
        {
            numItemsReceived += etanks - prevetanks;
            lastItemReceived = "Energy Tank";
            ds_write("Energy", 99);
            ds_write("Energy Tanks", etanks);
        }
    }
    
    var majorsList = ds_map_find_value(payload, "majors");
    for (var i = 0; i < ds_list_size(majorsList); i++)
    {
        var major = ds_list_find_value(majorsList, i);
        var ds_name = convert_mw_name_to_ds_name(major);
        if (dz(ds_name) == 0)
        {
            numItemsReceived += 1;
            lastItemReceived = major;
            ds_write(ds_name, 1);
            if (string_pos("Artifact", ds_name) != 0)
            {
                mw_handle_aeon_powers(ds_name);
            }
        }
    }

    if (numItemsReceived > 0)
    {
        var suffix = "";
        if (numItemsReceived > 1)
        {
            suffix = " (+ " + string(numItemsReceived - 1) + " other items)";
        }
        bitsound(sndMessageConfirm);
        show_item_pickup_text(lastItemReceived + " Obtained" + suffix);
    }
}

function generate_return_map()
{
    var returnMap = ds_map_create();
    var checkList = ds_list_create();
    for (var i = 0; i < array_length(locationKeys); i++)
    {
        if (dz(locationKeys[i]))
        {
            ds_list_add(checkList, locationKeys[i]);
        }
    }
    ds_map_add_list(returnMap, "items", checkList);
    ds_map_add(returnMap, "seedreceived", global.seedreceived);
    ds_map_add(returnMap, "gamecompleted", global.mwcompleted);
    return returnMap;
}

var type_event = ds_map_find_value(async_load, "type");
switch type_event
{
    case network_type_connect:
        socket = ds_map_find_value(async_load, "socket");
        connectedToClient = true;
        bitsound(sndMessageConfirm);
        show_item_pickup_text("Connected to python client");
        break;
    case network_type_disconnect:
        connectedToClient = false;
        bitsound(sndMessageConfirm);
        show_item_pickup_text("Lost connection to python client");
        break;
    case network_type_data:
        var buffer = ds_map_find_value(async_load, "buffer");
        var receivedString = buffer_read(buffer, buffer_string);
        var payload = json_decode(receivedString);
        var command = ds_map_find_value(payload, "cmd");
        switch command
        {
            case "locations":
                handle_locations_cmd(payload);
                break;
            case "items":
                handle_items_cmd(payload);
                break;
        }
        var returnMap = generate_return_map();
        var returnBuffer = buffer_create(1024, buffer_grow, 1);
        buffer_write(returnBuffer, buffer_text, json_encode(returnMap));
        buffer_write(returnBuffer, buffer_text, "\n");
        network_send_raw(socket, returnBuffer, buffer_tell(returnBuffer));
        buffer_delete(returnBuffer);
        ds_map_destroy(payload);
        ds_map_destroy(returnMap);
        break;
}