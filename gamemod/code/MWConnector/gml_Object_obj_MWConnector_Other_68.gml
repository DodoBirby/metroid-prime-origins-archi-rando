function handle_locations_cmd(payload)
{
    var locationsMap = ds_map_find_value(payload, "locations");
    var remoteLocationsMap = ds_map_find_value(payload, "remote_items");
    var exoOrder = ds_map_find_value(payload, "exo_order");
    ds_map_copy(global.mwLocations, locationsMap);
    ds_map_copy(global.mwRemoteLocations, remoteLocationsMap);
    ds_list_copy(global.mwExoBeams, exoOrder);
    global.mwEndAtRidley = ds_map_find_value(payload, "end_at_ridley");
    receivedSeedFromClient = true;
}

function handle_items_cmd(payload)
{
    if (!instance_exists(obj_game))
    {
        return;
    }
    var numItemsReceived = 0;
    var lastItemReceived = "";
    
    var prevmissiletanks = dz("Missiles Max") / 5;
    var prevetanks = dz("Energy Tanks Max");
    var prevpbombtanks = dz("Power Bombs Max") / 2;
    var prevproggrapples = dz("ProgGrapples");
    var etanks = ds_map_find_value(payload, "etanks");
    var missiletanks = ds_map_find_value(payload, "missiletanks");
    var pbombtanks = ds_map_find_value(payload, "pbombtanks");
    var proggrapples = ds_map_find_value(payload, "proggrapples");

    if (prevmissiletanks < missiletanks)
    {
        lastItemReceived = "Missile Tank";
        for (var i = 0; i < missiletanks - prevmissiletanks; i++)
        {
            numItemsReceived += 1;
            grant_item("Missile Tank");
        }
    }
    if (prevpbombtanks < pbombtanks)
    {
        lastItemReceived = "Power Bomb";
        for (var i = 0; i < pbombtanks - prevpbombtanks; i++)
        {
            numItemsReceived += 1;
            grant_item("Power Bomb");
        }
    }
    if (prevetanks < etanks)
    {
        lastItemReceived = "Energy Tank";
        for (var i = 0; i < etanks - prevetanks; i++)
        {
            numItemsReceived += 1;
            grant_item("Energy Tank");
        }
    }
    if (prevproggrapples < proggrapples)
    {
        lastItemReceived = "Progressive Grapple";
        for (var i = 0; i < proggrapples - prevproggrapples; i++)
        {
            numItemsReceived += 1;
            grant_item("Progressive Grapple Beam");
        }
    }
    
    var majorsList = ds_map_find_value(payload, "majors");
    for (var i = 0; i < ds_list_size(majorsList); i++)
    {
        var major = ds_list_find_value(majorsList, i);
        lastItemReceived = major;
        numItemsReceived += 1;
        grant_item(major);
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
    ds_map_add(returnMap, "gamecompleted", global.mwcompleted);
    return returnMap;
}

var type_event = ds_map_find_value(async_load, "type");
switch type_event
{
    case network_type_connect:
        socket = ds_map_find_value(async_load, "socket");
        connectedToClient = true;
        receivedSeedFromClient = false;
        ds_map_clear(global.mwLocations);
        bitsound(sndMessageConfirm);
        show_item_pickup_text("Connected to python client");
        break;
    case network_type_disconnect:
        connectedToClient = false;
        receivedSeedFromClient = false;
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