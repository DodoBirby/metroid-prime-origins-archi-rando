alarm[0] = 15;
warp_name = "";
goto = 0;
debug_summon = 0;
instance_create(0, 0, obj_damage_number_manager);
cut_bars = 0;
ds_write_options("Last File", global.filename);
ds_write_options("Last Mode", 0 + global.fusion_mode + (global.retro_mode * 2));
save_options();
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
        ds_write("MWPhazonHint", global.mwPhazonHint);
        key = ds_map_find_first(global.mwArtifactHints);
        for (var i = 0; i < ds_map_size(global.mwArtifactHints); i++)
        {
            var name = "MWArtifact " + key;
            ds_write(name, ds_map_find_value(global.mwArtifactHints, key));
            key = ds_map_find_next(global.mwArtifactHints, key);
        }
    }
    var lockedBeams = [0, 1, 2, 3];
    for (var i = 0; i < ds_list_size(global.mwExoBeams); i++)
    {
        lockedBeams[i] = ds_list_find_value(global.mwExoBeams, i);
    }
    ds_write("MWLockedExoBeams", lockedBeams);
    
    ds_write("MWArtifactsRequired", global.mwArtifactsRequired);
    
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
if (room == rm_New_Game_Plus)
{
    global.loaded = 0;
    ds_map_destroy(global.savedata);
    global.savedata = bitload(global.filename);
    room_goto(tal_Landing_Site);
    instance_create(400, 516, obj_samus);
    ds_write("Ship", 1);
    obj_samus.pose = 100;
    obj_samus.y += 32;
    var og_Creatures = dz("Creatures");
    var og_Creatures_Logs = dz("Creatures Logs");
    var og_Chozo = dz("Chozo Lore");
    var og_Chozo_Logs = dz("Chozo Lore Logs");
    var og_Pirate = dz("Pirate Data");
    var og_Pirate_Logs = dz("Pirate Data Logs");
    var og_Deaths = dz("Deaths");
    var og_Energy = dz("Energy");
    var og_Energy_Tanks = dz("Energy Tanks");
    var og_Energy_Tanks_Max = dz("Energy Tanks Max");
    var og_Missiles = dz("Missiles");
    var og_Missiles_Max = dz("Missiles Max");
    var og_Power_Bombs = dz("Power Bombs");
    var og_Power_Bombs_Max = dz("Power Bombs Max");
    var og_Missile_Launcher = dz("Missile Launcher");
    var og_Power_Bomb_Detonator = dz("Power Bomb Detonator");
    var og_Energy_Tank = dz("Energy Tank");
    var og_Beam = dz("Beam");
    var og_Power_Beam = dz("Power Beam");
    var og_Charge = dz("Charge Beam");
    var og_Wave = dz("Wave Beam");
    var og_Ice = dz("Ice Beam");
    var og_Plasma = dz("Plasma Beam");
    var og_Spazer = dz("Spazer");
    var og_Wavebuster = dz("Wavebuster");
    var og_Ice_Spreader = dz("Ice Spreader");
    var og_Incinerator = dz("Incinerator");
    var og_Power_Suit = dz("Power Suit");
    var og_Varia = dz("Varia Suit");
    var og_Gravity = dz("Gravity Suit");
    var og_Phazon = dz("Phazon Suit");
    var og_Morph = dz("Morph Ball");
    var og_Boost = dz("Boost Ball");
    var og_Space = dz("Space Jump Boots");
    var og_Screw = dz("Screw Attack");
    var og_Bomb = dz("Morph Ball Bomb");
    var og_Spider = dz("Spider Ball");
    var og_Grapple = dz("Grapple Beam");
    var og_Super = dz("Super Missile");
    var og_Aeon = dz("Aeon");
    var og_Aeon_Status = dz("Aeon Status");
    var og_Clear_Game = dz("Clear Game");
    var og_Collection = dz("Collection");
    var og_Logbook = dz("Logbook");
    var og_Map_Completion = dz("Map Completion");
    var og_Rooms_Discovered = dz("Rooms Discovered");
    var og_Frigate_Map = dz("Frigate Orpheon Map");
    var og_Tallon_Map = dz("Tallon Overworld Map");
    var og_Chozo_Map = dz("Chozo Ruins Map");
    var og_Magmoor_Map = dz("Magmoor Caverns Map");
    var og_Phendrana_Map = dz("Phendrana Drifts Map");
    var og_Phazon_Map = dz("Phazon Mines Map");
    var og_Impact_Map = dz("Impact Crater Map");
    var og_Enemies_Killed = dz("Enemies Killed");
    var og_Damage_Dealt = dz("Damage Dealt");
    var og_Damage_Taken = dz("Damage Taken");
    var og_Shots_Fired = dz("Shots Fired");
    var og_Bombs_Used = dz("Bombs Used");
    var og_Missiles_Fired = dz("Missiles Fired");
    var og_Power_Bombs_Used = dz("Power Bombs Used");
    var og_Beam_Combos_Used = dz("Beam Combos Used");
    var og_Beam_Changes = dz("Beam Changes");
    var og_Distance_Traveled = dz("Distance Traveled");
    var og_Rooms_Explored = dz("Rooms Explored");
    var og_Blocks_Broken = dz("Blocks Broken");
    var og_Doors_Opened = dz("Doors Opened");
    var og_Attempted_Scans = dz("Attempted Scans");
    var og_Successful_Scans = dz("Successful Scans");
    var og_Save_Room_Uses = dz("Save Room Uses");
    ds_add("Sessions", 1);
    ds_add("New Game+", 1);
    var og_Sessions = dz("Sessions");
    var og_New_Game_Plus = dz("New Game+");
    ds_map_destroy(global.savedata);
    global.savedata = ds_map_create();
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
    ds_write("Real Milliseconds", 0);
    ds_write("Milliseconds", 0);
    ds_write("Seconds", 0);
    ds_write("Hours", 0);
    ds_write("Completion", 0);
    chozo_artifacts = [];
    artifact_logs = [];
    repeat (12)
    {
        array_push(chozo_artifacts, "??????");
        array_push(artifact_logs, "--");
    }
    ds_write("Chozo Artifacts", chozo_artifacts);
    ds_write("Chozo Artifacts Logs", artifact_logs);
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
    ds_write("New Game", 1);
    ds_write("Creatures", og_Creatures);
    ds_write("Creatures Logs", og_Creatures_Logs);
    ds_write("Chozo Lore", og_Chozo);
    ds_write("Chozo Lore Logs", og_Chozo_Logs);
    ds_write("Pirate Data", og_Pirate);
    ds_write("Pirate Data Logs", og_Pirate_Logs);
    ds_write("Deaths", og_Deaths);
    ds_write("Energy", og_Energy);
    ds_write("Energy Tanks", og_Energy_Tanks);
    ds_write("Energy Tanks Max", og_Energy_Tanks_Max);
    ds_write("Missiles", og_Missiles);
    ds_write("Missiles Max", og_Missiles_Max);
    ds_write("Power Bombs", og_Power_Bombs);
    ds_write("Power Bombs Max", og_Power_Bombs_Max);
    ds_write("Missile Launcher", og_Missile_Launcher);
    ds_write("Power Bomb Detonator", og_Power_Bomb_Detonator);
    ds_write("Energy Tank", og_Energy_Tank);
    ds_write("Beam", og_Beam);
    ds_write("Power Beam", og_Power_Beam);
    ds_write("Charge Beam", og_Charge);
    ds_write("Wave Beam", og_Wave);
    ds_write("Ice Beam", og_Ice);
    ds_write("Plasma Beam", og_Plasma);
    ds_write("Spazer", og_Spazer);
    ds_write("Wavebuster", og_Wavebuster);
    ds_write("Ice Spreader", og_Ice_Spreader);
    ds_write("Incinerator", og_Incinerator);
    ds_write("Power Suit", og_Power_Suit);
    ds_write("Varia Suit", og_Varia);
    ds_write("Gravity Suit", og_Gravity);
    ds_write("Phazon Suit", og_Phazon);
    ds_write("Morph Ball", og_Morph);
    ds_write("Boost Ball", og_Boost);
    ds_write("Space Jump Boots", og_Space);
    ds_write("Screw Attack", og_Screw);
    ds_write("Morph Ball Bomb", og_Bomb);
    ds_write("Spider Ball", og_Spider);
    ds_write("Grapple Beam", og_Grapple);
    ds_write("Super Missile", og_Super);
    ds_write("Aeon", og_Aeon);
    ds_write("Aeon Status", og_Aeon_Status);
    ds_write("Collection", og_Collection);
    ds_write("Logbook", og_Logbook);
    ds_write("Map Completion", og_Map_Completion);
    ds_write("Rooms Discovered", og_Rooms_Discovered);
    ds_write("Sessions", og_Sessions);
    ds_write("New Game+", og_New_Game_Plus);
    ds_write("Clear Game", og_Clear_Game);
    ds_write("Frigate Orpheon Map", og_Frigate_Map);
    ds_write("Tallon Overworld Map", og_Tallon_Map);
    ds_write("Chozo Ruins Map", og_Chozo_Map);
    ds_write("Magmoor Caverns Map", og_Magmoor_Map);
    ds_write("Phendrana Drifts Map", og_Phendrana_Map);
    ds_write("Phazon Mines Map", og_Phazon_Map);
    ds_write("Impact Crater Map", og_Impact_Map);
    ds_write("Enemies Killed", og_Enemies_Killed);
    ds_write("Damage Dealt", og_Damage_Dealt);
    ds_write("Damage Taken", og_Damage_Taken);
    ds_write("Shots Fired", og_Shots_Fired);
    ds_write("Bombs Used", og_Bombs_Used);
    ds_write("Missiles Fired", og_Missiles_Fired);
    ds_write("Power Bombs Used", og_Power_Bombs_Used);
    ds_write("Beam Combos Used", og_Beam_Combos_Used);
    ds_write("Beam Changes", og_Beam_Changes);
    ds_write("Distance Traveled", og_Distance_Traveled);
    ds_write("Rooms Explored", og_Rooms_Explored);
    ds_write("Blocks Broken", og_Blocks_Broken);
    ds_write("Doors Opened", og_Doors_Opened);
    ds_write("Attempted Scans", og_Attempted_Scans);
    ds_write("Successful Scans", og_Successful_Scans);
    ds_write("Save Room Uses", og_Save_Room_Uses);
    event_user(12);
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
