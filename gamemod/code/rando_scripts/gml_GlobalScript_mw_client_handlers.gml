// -- MW Changes Start
function handle_locations_cmd(payload)
{
    var locationsMap = ds_map_find_value(payload, "locations");
    var remoteLocationsMap = ds_map_find_value(payload, "remote_items");
    var exoOrder = ds_map_find_value(payload, "exo_order");
    ds_map_copy(global.mwLocations, locationsMap);
    ds_map_copy(global.mwRemoteLocations, remoteLocationsMap);
    ds_list_copy(global.mwExoBeams, exoOrder);
    global.mwEndAtRidley = ds_map_find_value(payload, "end_at_ridley");
    global.mwArtifactsRequired = ds_map_find_value(payload, "artifacts_required");
    global.mwAeonPowers = ds_map_find_value(payload, "aeon_powers");
    receivedSeedFromClient = true;
}

function handle_items_cmd(payload)
{
    var majorsList = ds_map_find_value(payload, "majors");
    var majors = [];
    for (var i = 0; i < ds_list_size(majorsList); i++)
    {
        array_push(majors, ds_list_find_value(majorsList, i));
    }
    reconcile_mw_items(
        ds_map_find_value(payload, "etanks"),
        ds_map_find_value(payload, "missiletanks"),
        ds_map_find_value(payload, "pbombtanks"),
        ds_map_find_value(payload, "proggrapples"),
        ds_map_find_value(payload, "artifacts"),
        majors
    );
}

function reconcile_mw_items(etanks, missiletanks, pbombtanks, proggrapples, artifacts, majors)
{
    if (!instance_exists(obj_game)) return;

    var numItemsReceived = 0;
    var lastItemReceived = "";

    var prevmissiletanks = dz("Missiles Max") / 5;
    var prevetanks = dz("Energy Tanks Max");
    var prevpbombtanks = dz("Power Bombs Max") / 2;
    var prevproggrapples = dz("ProgGrapples");
    ds_write("ArtifactCountCollected", artifacts);

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

    for (var i = 0; i < array_length(majors); i++)
    {
        var major = majors[i];
        if (grant_item(major))
        {
            lastItemReceived = major;
            numItemsReceived += 1;
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
// -- MW Changes End
