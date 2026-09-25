if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit;
}

global.mwcompleted = 0;
ds_map_clear(global.mwLocations);
ds_map_clear(global.mwRemoteLocations);
connectedToClient = false;
receivedSeedFromClient = false;

nativeDllPath = working_directory + "gm-apclientpp.dll";
nativeBindingsLoaded = false;
nativeInitialized = false;
nativeState = "unavailable";
nativeError = "";
nativeHost = ds_zero_options("AP Host");
nativeSlot = ds_zero_options("AP Slot");
if (!is_string(nativeHost)) nativeHost = "";
if (!is_string(nativeSlot)) nativeSlot = "";
nativePassword = "";
nativeUuid = ds_zero_options("AP UUID");
if (!is_string(nativeUuid) || nativeUuid == "")
{
    nativeUuid = "mpo-" + string(date_current_datetime()) + "-" + string(get_timer());
    ds_write_options("AP UUID", nativeUuid);
    save_options();
}
nativeSessionActive = false;
nativeLastMessage = "";
nativeLastEvent = "";
nativeLastSocketError = "";
nativeMessages = [];
nativeConsoleOpen = false;
nativeCompletionMatches = [];
nativeCompletionCurrent = "";
nativeCompletionIndex = 0;
nativeCompletionStem = "";
nativeDialogId = -1;
nativeDialogStage = "";
nativePendingHost = "";
nativeRoomInfoSeen = false;
nativeSlotDataSeen = false;
nativeSlotDataValid = false;
nativeScoutSeen = false;
nativeItemsSeen = false;
nativeCompletionSent = false;
nativeAcknowledgedChecks = [];
nativePlayerNumber = -1;
nativeTeamNumber = -1;
nativeSeedName = "";
nativeSlotEndAtRidley = -1;
nativeSlotArtifactsRequired = -1;
nativeSlotAeonPowers = -1;
nativeSlotExoOrder = [];
nativeExpectedScoutCount = array_length(mw_ap_location_keys());
nativeScoutCount = 0;
nativeScoutItems = array_create(nativeExpectedScoutCount + 1, -1);
nativeScoutPlayers = array_create(nativeExpectedScoutCount + 1, -1);
nativeScoutFlags = array_create(nativeExpectedScoutCount + 1, 0);
nativeSeedPublishedForAuth = false;
nativeProofItems = [];
nativeReceivedItemIds = [];
nativeTransferTimer = 0;
depth = -10000;

scribble_color_set("AP_White", make_color_rgb(255, 255, 255));
scribble_color_set("AP_Green", make_color_rgb(0, 255, 127));
scribble_color_set("AP_Cyan", make_color_rgb(0, 238, 238));
scribble_color_set("AP_Plum", make_color_rgb(175, 153, 239));
scribble_color_set("AP_Slateblue", make_color_rgb(109, 139, 232));
scribble_color_set("AP_Salmon", make_color_rgb(250, 128, 114));
scribble_color_set("AP_Magenta", make_color_rgb(238, 0, 238));
scribble_color_set("AP_Yellow", make_color_rgb(250, 250, 210));
scribble_color_set("AP_Blue", make_color_rgb(100, 149, 237));
scribble_color_set("AP_Red", make_color_rgb(238, 0, 0));
scribble_color_set("AP_Orange", make_color_rgb(255, 119, 0));

nativeEscapeDisplay = function(message)
{
    message = string(message);
    message = string_replace_all(message, "[", "(");
    message = string_replace_all(message, "]", ")");
    message = string_replace_all(message, "#", "No.");
    message = string_replace_all(message, "\r", " ");
    message = string_replace_all(message, "\n", " ");
    return string_copy(message, 1, 512);
};

nativeAPColorTag = function(color)
{
    switch (color)
    {
        case "green": return "[AP_Green]";
        case "cyan": return "[AP_Cyan]";
        case "plum": return "[AP_Plum]";
        case "slateblue": return "[AP_Slateblue]";
        case "salmon": return "[AP_Salmon]";
        case "magenta": return "[AP_Magenta]";
        case "yellow": return "[AP_Yellow]";
        case "blue": return "[AP_Blue]";
        case "red": return "[AP_Red]";
        case "orange": return "[AP_Orange]";
        default: return "[AP_White]";
    }
};

nativeFormatPrintJSON = function(plain)
{
    var parts = apclient_json_proxy(0, "data");
    if (parts < 0) return nativeEscapeDisplay(plain);

    var formatted = "[AP_White]";
    var remaining = 512;
    for (var partIndex = 0; partIndex < apclient_json_size(parts) && remaining > 0; partIndex++)
    {
        var part = apclient_json_proxy(parts, string(partIndex));
        if (part < 0) return nativeEscapeDisplay(plain);

        var partType = apclient_json_exists(part, "type") ? apclient_json_string_at(part, "type") : "text";
        var partText = apclient_json_exists(part, "text") ? apclient_json_string_at(part, "text") : "";
        var partColor = "white";
        if (partType == "player_id")
        {
            var playerId = real(partText);
            var playerAlias = apclient_get_player_alias(playerId);
            if (playerAlias != "") partText = playerAlias;
            partColor = playerId == nativePlayerNumber ? "magenta" : "yellow";
        }
        else if (partType == "player_name") partColor = "yellow";
        else if (partType == "item_id" || partType == "item_name")
        {
            if (partType == "item_id")
            {
                var itemPlayer = apclient_json_exists(part, "player") ? apclient_json_number_at(part, "player") : nativePlayerNumber;
                var itemName = apclient_get_item_name(real(partText), apclient_get_player_game(itemPlayer));
                if (itemName != "") partText = itemName;
            }
            var flags = apclient_json_exists(part, "flags") ? apclient_json_number_at(part, "flags") : 0;
            if (flags & 1) partColor = "plum";
            else if (flags & 2) partColor = "slateblue";
            else if (flags & 4) partColor = "salmon";
            else partColor = "cyan";
        }
        else if (partType == "location_id" || partType == "location_name")
        {
            if (partType == "location_id")
            {
                var locationPlayer = apclient_json_exists(part, "player") ? apclient_json_number_at(part, "player") : nativePlayerNumber;
                var locationName = apclient_get_location_name(real(partText), apclient_get_player_game(locationPlayer));
                if (locationName != "") partText = locationName;
            }
            partColor = "green";
        }
        else if (partType == "entrance_name") partColor = "blue";
        else if (partType == "color" && apclient_json_exists(part, "color")) partColor = apclient_json_string_at(part, "color");
        else if (partType == "hint_status")
        {
            var hintStatus = apclient_json_exists(part, "hint_status") ? apclient_json_number_at(part, "hint_status") : 0;
            if (hintStatus == 40) partColor = "green";
            else if (hintStatus == 10) partColor = "slateblue";
            else if (hintStatus == 20) partColor = "salmon";
            else if (hintStatus == 30) partColor = "plum";
        }

        partText = string_copy(nativeEscapeDisplay(partText), 1, remaining);
        remaining -= string_length(partText);
        formatted += nativeAPColorTag(partColor) + partText;
    }
    return formatted + "[AP_White]";
};

nativeAddMessage = function(message, richText)
{
    nativeLastMessage = is_undefined(richText) ? nativeEscapeDisplay(message) : richText;
    array_push(nativeMessages, nativeLastMessage);
    if (array_length(nativeMessages) > 50)
    {
        array_delete(nativeMessages, 0, 1);
    }
};

nativeCompleteInput = function()
{
    var input = keyboard_string;
    var lowerInput = string_lower(input);
    var completingArgument = string_pos("!hint ", lowerInput) == 1
        || string_pos("!hint_location ", lowerInput) == 1;
    if (input == nativeCompletionCurrent && array_length(nativeCompletionMatches) > 1
        && (completingArgument == (nativeCompletionStem != "")))
    {
        nativeCompletionIndex = (nativeCompletionIndex + 1) mod array_length(nativeCompletionMatches);
        keyboard_string = nativeCompletionStem + nativeCompletionMatches[nativeCompletionIndex];
        if (nativeCompletionStem == "") keyboard_string += " ";
        nativeCompletionCurrent = keyboard_string;
        return;
    }

    nativeCompletionMatches = [];
    nativeCompletionCurrent = "";
    nativeCompletionIndex = 0;
    nativeCompletionStem = "";
    if (lowerInput == "!hint" || lowerInput == "!hint_location")
    {
        keyboard_string = lowerInput + " ";
        return;
    }

    var candidates = [];
    var fragment = input;
    var commandMode = false;
    if (string_pos("!hint_location ", lowerInput) == 1)
    {
        nativeCompletionStem = "!hint_location ";
        fragment = string_delete(input, 1, string_length(nativeCompletionStem));
        if (!connectedToClient) return;
        var game = apclient_get_game();
        for (var locationId = 1; locationId <= nativeExpectedScoutCount; locationId++)
        {
            var locationName = apclient_get_location_name(locationId, game);
            if (locationName != "") array_push(candidates, locationName);
        }
    }
    else if (string_pos("!hint ", lowerInput) == 1)
    {
        nativeCompletionStem = "!hint ";
        fragment = string_delete(input, 1, string_length(nativeCompletionStem));
        candidates = mw_ap_item_names();
    }
    else if (string_pos("!", input) == 1 && string_pos(" ", input) == 0)
    {
        commandMode = true;
        candidates = ["!help", "!hint", "!hint_location", "!missing", "!checked", "!players", "!status", "!remaining", "!alias", "!countdown", "!release", "!collect", "!options"];
    }
    else return;

    var lowerFragment = string_lower(fragment);
    for (var candidateIndex = 0; candidateIndex < array_length(candidates); candidateIndex++)
    {
        var candidate = candidates[candidateIndex];
        var matchPosition = string_pos(lowerFragment, string_lower(candidate));
        if (matchPosition > 0 && (!commandMode || matchPosition == 1))
        {
            array_push(nativeCompletionMatches, candidate);
        }
    }
    if (array_length(nativeCompletionMatches) == 0) return;
    keyboard_string = nativeCompletionStem + nativeCompletionMatches[0];
    if (commandMode) keyboard_string += " ";
    nativeCompletionCurrent = keyboard_string;
};

nativeFailSeed = function(message)
{
    if (nativeInitialized && nativeSessionActive)
    {
        apclient_disconnect();
    }
    nativeSessionActive = false;
    nativePassword = "";
    connectedToClient = false;
    receivedSeedFromClient = false;
    nativeState = "error";
    nativeError = nativeEscapeDisplay(message);
    ds_map_clear(global.mwLocations);
    ds_map_clear(global.mwRemoteLocations);
    ds_list_clear(global.mwExoBeams);
    nativeAddMessage(nativeError);
    show_item_pickup_text(nativeError);
    show_debug_message("Archipelago compatibility error: " + nativeError);
    return false;
};

nativeStageSlotData = function()
{
    var optionsProxy = apclient_json_proxy(0, "options");
    if (optionsProxy < 0
        || !apclient_json_exists(optionsProxy, "end_at_ridley")
        || !apclient_json_exists(optionsProxy, "artifacts_required")
        || !apclient_json_exists(optionsProxy, "aeon_powers"))
    {
        return nativeFailSeed("Incompatible slot data: required MPO options are missing");
    }

    var endAtRidley = apclient_json_number_at(optionsProxy, "end_at_ridley");
    var artifactsRequired = apclient_json_number_at(optionsProxy, "artifacts_required");
    var aeonPowers = apclient_json_number_at(optionsProxy, "aeon_powers");
    if ((endAtRidley != 0 && endAtRidley != 1)
        || artifactsRequired < 0 || artifactsRequired > 12 || floor(artifactsRequired) != artifactsRequired
        || (aeonPowers != 0 && aeonPowers != 1))
    {
        return nativeFailSeed("Incompatible slot data: invalid MPO option values");
    }

    var exoProxy = apclient_json_proxy(0, "exo_order");
    if (exoProxy < 0 || apclient_json_size(exoProxy) != 4)
    {
        return nativeFailSeed("Incompatible slot data: exo_order must contain four beams");
    }
    var exoOrder = [];
    var exoSeen = [false, false, false, false];
    for (var exoIndex = 0; exoIndex < 4; exoIndex++)
    {
        var exoValue = apclient_json_number_at(exoProxy, string(exoIndex));
        if (exoValue < 0 || exoValue > 3 || floor(exoValue) != exoValue || exoSeen[exoValue])
        {
            return nativeFailSeed("Incompatible slot data: exo_order is not a beam permutation");
        }
        exoSeen[exoValue] = true;
        array_push(exoOrder, exoValue);
    }

    var playerNumber = apclient_get_player_number();
    var teamNumber = apclient_get_team_number();
    var seedName = apclient_get_seed();
    if (playerNumber < 1 || teamNumber < 0 || seedName == "")
    {
        return nativeFailSeed("Incompatible slot data: session identity is missing");
    }
    if (nativeSeedName != ""
        && (nativeSeedName != seedName || nativeTeamNumber != teamNumber || nativePlayerNumber != playerNumber))
    {
        nativeReceivedItemIds = [];
    }
    nativePlayerNumber = playerNumber;
    nativeTeamNumber = teamNumber;
    nativeSeedName = seedName;
    nativeAcknowledgedChecks = array_create(nativeExpectedScoutCount + 1, false);
    nativeSlotEndAtRidley = endAtRidley;
    nativeSlotArtifactsRequired = artifactsRequired;
    nativeSlotAeonPowers = aeonPowers;
    nativeSlotExoOrder = exoOrder;
    nativeSlotDataValid = true;
    nativeScoutCount = 0;
    nativeScoutItems = array_create(nativeExpectedScoutCount + 1, -1);
    nativeScoutPlayers = array_create(nativeExpectedScoutCount + 1, -1);
    nativeScoutFlags = array_create(nativeExpectedScoutCount + 1, 0);
    nativeSeedPublishedForAuth = false;
    return true;
};

nativeSaveMatchesSession = function()
{
    if (!receivedSeedFromClient || !instance_exists(obj_game)) return false;
    return ds_check("MWLocal") == false
        && ds_check("MWOnlineSchema") == 1
        && ds_check("MWAPSeed") == nativeSeedName
        && ds_check("MWAPTeam") == nativeTeamNumber
        && ds_check("MWAPPlayer") == nativePlayerNumber;
};

nativeReconcileItems = function()
{
    if (!nativeSaveMatchesSession()) return false;

    var etanks = 0;
    var missiletanks = 0;
    var pbombtanks = 0;
    var proggrapples = 0;
    var artifacts = 0;
    var majors = [];
    for (var itemIndex = 0; itemIndex < array_length(nativeReceivedItemIds); itemIndex++)
    {
        var itemName = mw_ap_item_name(nativeReceivedItemIds[itemIndex]);
        switch (itemName)
        {
            case "Energy Tank": etanks += 1; break;
            case "Missile Tank": missiletanks += 1; break;
            case "Power Bomb": pbombtanks += 1; break;
            case "Progressive Grapple Beam": proggrapples += 1; break;
            default:
                if (string_pos("Artifact of ", itemName) == 1) artifacts += 1;
                array_push(majors, itemName);
                break;
        }
    }
    reconcile_mw_items(etanks, missiletanks, pbombtanks, proggrapples, artifacts, majors);
    return true;
};

nativeSendPendingChecks = function()
{
    if (!nativeSaveMatchesSession()) return false;

    var checksJson = "[";
    var checkCount = 0;
    var syncedCount = 0;
    for (var locationId = 1; locationId <= nativeExpectedScoutCount; locationId++)
    {
        var locationKey = mw_ap_location_key(locationId);
        if (nativeAcknowledgedChecks[locationId])
        {
            if (ds_check(locationKey) != 1)
            {
                ds_write(locationKey, 1);
                syncedCount += 1;
            }
        }
        else if (connectedToClient && ds_check(locationKey) == 1)
        {
            if (checkCount > 0) checksJson += ",";
            checksJson += string(locationId);
            checkCount += 1;
        }
    }
    checksJson += "]";
    if (syncedCount > 0)
    {
        nativeAddMessage("Synced " + string(syncedCount) + " checked location(s) into this save");
    }
    return !connectedToClient || checkCount == 0 || apclient_location_checks(checksJson);
};

nativeSendGoal = function()
{
    if (!connectedToClient || nativeCompletionSent || !nativeSaveMatchesSession() || ds_check("MWGoalComplete") != 1)
    {
        return false;
    }
    nativeCompletionSent = apclient_status_update(global.AP_CLIENT_STATUS_GOAL);
    return nativeCompletionSent;
};

nativeTryPublishSeed = function()
{
    if (!nativeSlotDataValid || nativeSeedPublishedForAuth || nativeScoutCount != nativeExpectedScoutCount)
    {
        return false;
    }
    if (!apclient_is_data_package_valid())
    {
        return nativeFailSeed("Archipelago name data is not valid for this seed");
    }

    var stagedLocations = ds_map_create();
    var stagedRemoteLocations = ds_map_create();
    for (var locationId = 1; locationId <= nativeExpectedScoutCount; locationId++)
    {
        var locationKey = mw_ap_location_key(locationId);
        var itemId = nativeScoutItems[locationId];
        var receivingPlayer = nativeScoutPlayers[locationId];
        var itemFlags = nativeScoutFlags[locationId];
        if (locationKey == "" || itemId < 0 || receivingPlayer < 1)
        {
            ds_map_destroy(stagedLocations);
            ds_map_destroy(stagedRemoteLocations);
            return nativeFailSeed("Incomplete scout data at MPO location " + string(locationId));
        }

        if (receivingPlayer == nativePlayerNumber)
        {
            var localItemName = mw_ap_item_name(itemId);
            if (localItemName == "")
            {
                ds_map_destroy(stagedLocations);
                ds_map_destroy(stagedRemoteLocations);
                return nativeFailSeed("Unknown local MPO item ID " + string(itemId));
            }
            ds_map_add(stagedLocations, locationKey, localItemName);
        }
        else
        {
            var receivingGame = apclient_get_player_game(receivingPlayer);
            var receivingAlias = apclient_get_player_alias(receivingPlayer);
            var remoteItemName = apclient_get_item_name(itemId, receivingGame);
            if (receivingGame == "" || receivingAlias == "" || remoteItemName == "")
            {
                ds_map_destroy(stagedLocations);
                ds_map_destroy(stagedRemoteLocations);
                return nativeFailSeed("Missing remote item name data at MPO location " + string(locationId));
            }
            var remoteClass = "APFiller";
            if ((itemFlags & 1) != 0)
            {
                remoteClass = "APMajor";
            }
            else if ((itemFlags & 2) != 0)
            {
                remoteClass = "APUseful";
            }
            ds_map_add(stagedLocations, locationKey, remoteClass);
            ds_map_add(stagedRemoteLocations, locationKey, remoteItemName + " for " + receivingAlias);
        }
    }

    ds_map_clear(global.mwLocations);
    ds_map_copy(global.mwLocations, stagedLocations);
    ds_map_clear(global.mwRemoteLocations);
    ds_map_copy(global.mwRemoteLocations, stagedRemoteLocations);
    ds_map_destroy(stagedLocations);
    ds_map_destroy(stagedRemoteLocations);
    ds_list_clear(global.mwExoBeams);
    for (var exoIndex = 0; exoIndex < array_length(nativeSlotExoOrder); exoIndex++)
    {
        ds_list_add(global.mwExoBeams, nativeSlotExoOrder[exoIndex]);
    }
    global.mwEndAtRidley = nativeSlotEndAtRidley;
    global.mwArtifactsRequired = nativeSlotArtifactsRequired;
    global.mwAeonPowers = nativeSlotAeonPowers;
    global.localSeed = false;
    receivedSeedFromClient = true;
    nativeSeedPublishedForAuth = true;
    nativeState = "ready";
    nativeAddMessage("Seed ready: " + string(nativeExpectedScoutCount) + " locations");
    show_debug_message("Archipelago: complete MPO seed layout published");
    return true;
};

nativeClearSessionState = function()
{
    receivedSeedFromClient = false;
    nativeLastMessage = "";
    nativeLastSocketError = "";
    nativeMessages = [];
    ds_map_clear(global.mwLocations);
    ds_map_clear(global.mwRemoteLocations);
    ds_list_clear(global.mwExoBeams);
    global.mwEndAtRidley = 0;
    global.mwArtifactsRequired = 0;
    global.mwAeonPowers = 0;
    nativeRoomInfoSeen = false;
    nativeSlotDataSeen = false;
    nativeSlotDataValid = false;
    nativeScoutSeen = false;
    nativeItemsSeen = false;
    nativeCompletionSent = false;
    nativeAcknowledgedChecks = array_create(nativeExpectedScoutCount + 1, false);
    nativePlayerNumber = -1;
    nativeTeamNumber = -1;
    nativeSeedName = "";
    nativeSlotEndAtRidley = -1;
    nativeSlotArtifactsRequired = -1;
    nativeSlotAeonPowers = -1;
    nativeSlotExoOrder = [];
    nativeScoutCount = 0;
    nativeScoutItems = array_create(nativeExpectedScoutCount + 1, -1);
    nativeScoutPlayers = array_create(nativeExpectedScoutCount + 1, -1);
    nativeScoutFlags = array_create(nativeExpectedScoutCount + 1, 0);
    nativeSeedPublishedForAuth = false;
    nativeProofItems = [];
    nativeReceivedItemIds = [];
    nativeTransferTimer = 0;
};

nativeDisconnect = function()
{
    if (nativeInitialized && nativeSessionActive)
    {
        apclient_disconnect();
    }
    nativeSessionActive = false;
    nativePassword = "";
    connectedToClient = false;
    nativeState = "disconnected";
    nativeError = "";
    nativeAddMessage("Disconnected");
};

nativeConnect = function(host, slot, password)
{
    if (!nativeInitialized)
    {
        nativeError = "gm-apclientpp is not available";
        nativeAddMessage(nativeError);
        return false;
    }
    if (host == "" || slot == "")
    {
        nativeError = "Archipelago host and slot are required";
        nativeAddMessage(nativeError);
        return false;
    }
    nativeClearSessionState();
    if (nativeSessionActive)
    {
        apclient_disconnect();
    }
    nativeHost = host;
    nativeSlot = slot;
    nativePassword = password;
    nativeState = "connecting";
    nativeError = "";
    ds_write_options("AP Host", host);
    ds_write_options("AP Slot", slot);
    save_options();
    nativeSessionActive = apclient_connect(nativeUuid, "Metroid Prime Origins", host);
    if (!nativeSessionActive)
    {
        nativePassword = "";
        nativeState = "error";
        nativeError = "Could not start the Archipelago connection";
        nativeAddMessage(nativeError);
    }
    else
    {
        nativeAddMessage("Connecting to " + host);
    }
    return nativeSessionActive;
};

nativePromptConnect = function()
{
    if (!nativeInitialized)
    {
        show_item_pickup_text(nativeError);
        return;
    }
    nativeDialogStage = "host";
    nativeDialogId = get_string_async("Archipelago server address", nativeHost);
};

nativePromptChat = function()
{
    if (nativeDialogId != -1) return;
    if (!connectedToClient)
    {
        show_item_pickup_text("Connect to Archipelago before sending chat");
        return;
    }
    nativeDialogStage = "chat";
    nativeDialogId = get_string_async("Archipelago chat or command", "");
};

if (!file_exists(nativeDllPath))
{
    nativeError = "Missing gm-apclientpp.dll beside MetroidPrimeOrigins.exe";
    show_debug_message("Archipelago: " + nativeError);
}
else
{
    try
    {
        nativeBindingsLoaded = apclient_bind(nativeDllPath);
        nativeInitialized = nativeBindingsLoaded && apclient_init(202);
        if (nativeInitialized)
        {
            nativeState = "disconnected";
            show_debug_message("Archipelago: gm-apclientpp API 202 initialized");
        }
        else
        {
            nativeError = "gm-apclientpp initialization failed";
        }
    }
    catch (error)
    {
        var errorMessage = string(error);
        if (is_struct(error) && variable_struct_exists(error, "message"))
        {
            errorMessage = error.message;
        }
        nativeError = "Could not load gm-apclientpp.dll: " + errorMessage;
        show_debug_message("Archipelago: " + nativeError);
    }
}

locationKeys = mw_ap_location_keys();
nativeAcknowledgedChecks = array_create(nativeExpectedScoutCount + 1, false);
if (nativeInitialized && nativeHost != "" && nativeSlot != "")
{
    nativeConnect(nativeHost, nativeSlot, "");
}
