alarm[0] = 15;
warp_name = "";
goto = 0;
instance_create(0, 0, obj_damage_number_manager);
cut_bars = 0;
ds_write("Enemies Killed", 0);
ds_write("Damage Dealt", 0);
ds_write("Damage Taken", 0);
ds_write("Shots Fired", 0);
ds_write("Bombs Used", 0);
ds_write("Missiles Fired", 0);
ds_write("Power Bombs Used", 0);
ds_write("Beam Combos Used", 0);
ds_write("Beam Changes", 0);
ds_write("Distance Traveled", 0);
ds_write("Rooms Explored", 0);
ds_write("Blocks Broken", 0);
ds_write("Doors Opened", 0);
ds_write("Attempted Scans", 0);
ds_write("Successful Scans", 0);
ds_write("Save Room Uses", 0);
ds_write("Sessions", 1);
ds_write("Deaths", 0);
ds_write("Energy", 99);
ds_write("Energy Tanks", 0);
ds_write("Energy Tanks Max", 0);
ds_write("Missiles", 0);
ds_write("Missiles Max", 0);
ds_write("Power Bombs", 0);
ds_write("Power Bombs Max", 0);
ds_write("Missile Launcher", 0);
ds_write("Power Bomb Detonator", 0);
ds_write("Energy Tank", 0);
ds_write("Beam", 0);
ds_write("Power Beam", 1);
ds_write("Charge Beam", 0);
ds_write("Wave Beam", 0);
ds_write("Ice Beam", 0);
ds_write("Plasma Beam", 0);
ds_write("Spazer", 0);
ds_write("Wavebuster", 0);
ds_write("Ice Spreader", 0);
ds_write("Incinerator", 0);
ds_write("Power Suit", 1);
ds_write("Varia Suit", 0);
ds_write("Gravity Suit", 0);
ds_write("Phazon Suit", 0);
ds_write("Morph Ball", 0);
ds_write("Boost Ball", 0);
ds_write("Space Jump Boots", 0);
ds_write("Screw Attack", 0);
ds_write("Morph Ball Bomb", 0);
ds_write("Spider Ball", 0);
ds_write("Grapple Beam", 0);
ds_write("Super Missile", 0);
ds_write("Aeon", []);
ds_write("Aeon Status", []);
ds_write("Artifact 1", 0);
ds_write("Artifact 2", 0);
ds_write("Artifact 3", 0);
ds_write("Artifact 4", 0);
ds_write("Artifact 5", 0);
ds_write("Artifact 6", 0);
ds_write("Artifact 7", 0);
ds_write("Artifact 8", 0);
ds_write("Artifact 9", 0);
ds_write("Artifact 10", 0);
ds_write("Artifact 11", 0);
ds_write("Artifact 12", 0);
pirate_data = [];
pirate_data_logs = [];
repeat (25)
{
    array_push(pirate_data, "??????");
    array_push(pirate_data_logs, "--");
}
ds_write("Pirate Data", pirate_data);
ds_write("Pirate Data Logs", pirate_data_logs);
chozo_lore = [];
chozo_lore_logs = [];
repeat (16)
{
    array_push(chozo_lore, "??????");
    array_push(chozo_lore_logs, "--");
}
ds_write("Chozo Lore", chozo_lore);
ds_write("Chozo Lore Logs", chozo_lore_logs);
chozo_artifacts = [];
artifact_logs = [];
repeat (12)
{
    array_push(chozo_artifacts, "??????");
    array_push(artifact_logs, "--");
}
ds_write("Chozo Artifacts", chozo_artifacts);
ds_write("Chozo Artifacts Logs", artifact_logs);
creatures = [];
creatures_logs = [];
repeat (82)
{
    array_push(creatures, "??????");
    array_push(creatures_logs, "--");
}
ds_write("Creatures", creatures);
ds_write("Creatures Logs", creatures_logs);
ds_write("Hint Number", -69);
ds_write("Save Room", "tal_Landing_Site");
ds_write("Save X", 208);
ds_write("Save Y", 244);
ds_write("Rooms Discovered", 0);
ds_write("Map Completion", 0);
ds_write("Teleport Array", []);
ds_write("Teleport X", 0);
ds_write("Teleport Y", 0);
ds_write("Teleport Room", "tal_Landing_Site");

function start_game()
{
    // -- MW Changes Start
    // vanilla start game left here in case we want to enable the intro sequence
    /*
    ds_write("Energy", 99);
    ds_write("Energy Tanks", ds_zero("Energy Tanks Max"));
    ds_write("Varia Suit");
    ds_write("Morph Ball");
    ds_write("Morph Ball Bomb");
    ds_write("Charge Beam");
    ds_write("Grapple Beam");
    ds_write("Missiles", 15);
    ds_write("Missiles Max", 15);
    ds_write("Missile Launcher", 1);
    spawn(obj_intro_0);
    room_goto(rm_Intro_0);
    */
    // Store rando seed in save file
    var mwLocSize = ds_map_size(global.mwLocations);
    var key = ds_map_find_first(global.mwLocations);
    for (var i = 0; i < mwLocSize; i++)
    {
        var name = "MWLocation " + key;
        ds_write(name, ds_map_find_value(global.mwLocations, key));
        key = ds_map_find_next(global.mwLocations, key);
    }
    
    mwLocSize = ds_map_size(global.mwRemoteLocations);
    key = ds_map_find_first(global.mwRemoteLocations);
    for (var i = 0; i < mwLocSize; i++)
    {
        var name = "MWRemoteLocation " + key;
        ds_write(name, ds_map_find_value(global.mwRemoteLocations, key));
        key = ds_map_find_next(global.mwRemoteLocations, key);
    }
    
    ds_write("MWEndAtRidley", global.mwEndAtRidley);
    
    // local seed handling
    ds_write("MWLocal", global.localSeed);
    if (global.localSeed)
    {
        for (var i = 0; i < ds_list_size(global.localStarterItems); i++)
        {
            grant_item(ds_list_find_value(global.localStarterItems, i));
        }
    }
    
    // Ship teleport unlock
    var identity = string(tal_Landing_Site) + " Save Point";
    var room_nombre = string(room_get_name(tal_Landing_Site));
    room_nombre = string_copy(room_nombre, 5, string_length(room_nombre));
    var teleport_name = "Tallon Overworld" + " - " + room_nombre;
    array_push(ds_zero("Teleport Array"), [teleport_name, 400, 516, room_get_name(tal_Landing_Site)]);
    ds_write(identity, 1);
    
    // Ship start
    ds_write("Save X", 400);
    ds_write("Save Y", 516);
    room_goto(asset_get_index(dz("Save Room")));
    instance_create(ds_zero("Save X"), ds_zero("Save Y"), obj_samus);
    global.loaded = 1;
    ds_write("Ship", 1);
    obj_samus.pose = 100;
    obj_samus.y += 32;
    // -- MW Changes End
}

ds_write("New Game", 1);
event_user(0);
event_user(2);
ds_write("Real Milliseconds", 0);
ds_write("Milliseconds", 0);
ds_write("Seconds", 0);
ds_write("Hours", 0);
ds_write("Completion", 0);
if (room == rm_Load_Game)
{
    global.loaded = 1;
    ds_map_destroy(global.savedata);
    global.savedata = bitload(global.filename);
    if (!is_string(dz("Save Room")))
    {
        room_goto(dz("Save Room"));
    }
    else
    {
        room_goto(asset_get_index(dz("Save Room")));
    }
    instance_create(ds_zero("Save X"), ds_zero("Save Y"), obj_samus);
    if (ds_zero("Save Room") == tal_Landing_Site || ds_zero("Save Room") == "tal_Landing_Site")
    {
        ds_write("Ship", 1);
        obj_samus.pose = 100;
        obj_samus.y += 32;
    }
    arr = dz("Teleport Array");
    pos = 0;
    repeat (array_length(arr))
    {
        if (arr[pos][3] == "fri_Exterior_Docking_Hangar")
        {
            array_delete(arr, pos, 1);
            break;
        }
        pos += 1;
    }
    ds_write("Teleport Array", arr);
    ds_add("Sessions", 1);
    exit;
}
if (room == rm_New_Game)
{
    start_game();
}
if (room == rm_New_Game_Classic)
{
    start_game();
}
if (room == rm_Boss_Rush)
{
    spawn(obj_boss_rush);
}
