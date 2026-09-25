if (!nativeInitialized)
{
    exit;
}

// apclient_poll works by setting a bunch of globals that need to be accessed through apclient functions, these values are only valid until the next apclient_poll call
apclient_poll();
nativeLastEvent = apclient_json_source();

switch (nativeLastEvent)
{
    case "":
        break;

    case "ap_socket_connected":
        nativeState = "authenticating";
        nativeLastSocketError = "";
        nativeAddMessage("Socket connected; authenticating");
        show_debug_message("Archipelago: socket connected");
        break;

    case "ap_room_info":
        if (!nativeSessionActive)
        {
            break;
        }
        nativeRoomInfoSeen = true;
        nativeState = "authenticating";
        apclient_set_items_handling(7);
        apclient_set_version(0, 6, 7);
        if (!apclient_connect_slot(nativeSlot, nativePassword, "[\"AP\"]"))
        {
            nativeState = "error";
            nativeError = "Could not queue ConnectSlot";
        }
        break;

    case "ap_slot_connected":
        connectedToClient = true;
        nativeCompletionSent = false;
        nativeState = "loading seed";
        nativeSlotDataSeen = true;
        if (!nativeStageSlotData())
        {
            break;
        }
        show_debug_message("Archipelago: authenticated as " + apclient_get_slot() + " for seed " + apclient_get_seed());
        nativeAddMessage("Authenticated as " + apclient_get_slot());
        if (!apclient_location_scouts(mw_ap_scout_ids_json(), 0))
        {
            nativeFailSeed("Could not request the MPO location layout");
            break;
        }
        apclient_sync();
        break;

    case "ap_slot_refused":
        connectedToClient = false;
        apclient_disconnect();
        nativeSessionActive = false;
        nativePassword = "";
        nativeState = "error";
        nativeError = "Connection refused";
        var reasonsProxy = apclient_json_proxy(0, "reasons");
        if (reasonsProxy >= 0)
        {
            for (var reasonIndex = 0; reasonIndex < apclient_json_size(reasonsProxy); reasonIndex++)
            {
                nativeError += " " + apclient_json_string_at(reasonsProxy, string(reasonIndex));
            }
        }
        nativeError = nativeEscapeDisplay(nativeError);
        nativeAddMessage(nativeError);
        show_item_pickup_text(nativeError);
        show_debug_message("Archipelago: " + nativeError);
        break;

    case "ap_location_info":
        if (!nativeSlotDataValid)
        {
            break;
        }
        var scoutCount = apclient_json_number_at(0, "len");
        var scoutLocationsProxy = apclient_json_proxy(0, "locations");
        var scoutItemsProxy = apclient_json_proxy(0, "items");
        var scoutPlayersProxy = apclient_json_proxy(0, "players");
        var scoutFlagsProxy = apclient_json_proxy(0, "flags");
        if (scoutCount < 0 || floor(scoutCount) != scoutCount
            || (scoutCount > 0 && (scoutLocationsProxy < 0 || scoutItemsProxy < 0 || scoutPlayersProxy < 0 || scoutFlagsProxy < 0)))
        {
            nativeFailSeed("Malformed Archipelago scout response");
            break;
        }
        var scoutBatchValid = true;
        for (var scoutIndex = 0; scoutIndex < scoutCount; scoutIndex++)
        {
            var scoutKey = string(scoutIndex);
            var scoutLocation = apclient_json_number_at(scoutLocationsProxy, scoutKey);
            if (scoutLocation < 1 || scoutLocation > nativeExpectedScoutCount || floor(scoutLocation) != scoutLocation)
            {
                nativeFailSeed("Unknown MPO location ID " + string(scoutLocation));
                scoutBatchValid = false;
                break;
            }
            if (nativeScoutItems[scoutLocation] < 0)
            {
                nativeScoutCount += 1;
            }
            nativeScoutItems[scoutLocation] = apclient_json_number_at(scoutItemsProxy, scoutKey);
            nativeScoutPlayers[scoutLocation] = apclient_json_number_at(scoutPlayersProxy, scoutKey);
            nativeScoutFlags[scoutLocation] = apclient_json_number_at(scoutFlagsProxy, scoutKey);
        }
        if (!scoutBatchValid)
        {
            break;
        }
        nativeScoutSeen = true;
        nativeTryPublishSeed();
        if (nativeState != "error")
        {
            nativeState = receivedSeedFromClient ? "ready" : "loading seed";
        }
        show_debug_message("Archipelago: scout data " + string(nativeScoutCount) + "/" + string(nativeExpectedScoutCount));
        break;

    case "ap_items_received":
        nativeProofItems = [];
        var itemStartIndex = apclient_json_number_at(0, "index");
        var itemCount = apclient_json_number_at(0, "len");
        var itemIdsProxy = apclient_json_proxy(0, "ids");
        var itemNamesProxy = apclient_json_proxy(0, "names");
        var itemPlayersProxy = apclient_json_proxy(0, "players");
        var itemLocationsProxy = apclient_json_proxy(0, "locations");
        var itemFlagsProxy = apclient_json_proxy(0, "flags");
        if (itemStartIndex < 0 || floor(itemStartIndex) != itemStartIndex
            || itemCount < 0 || floor(itemCount) != itemCount
            || itemIdsProxy < 0 || itemNamesProxy < 0 || itemPlayersProxy < 0
            || itemLocationsProxy < 0 || itemFlagsProxy < 0)
        {
            nativeFailSeed("Malformed Archipelago item history");
            break;
        }
        if (itemStartIndex > array_length(nativeReceivedItemIds))
        {
            nativeAddMessage("Item history gap; requesting Sync");
            apclient_sync();
            break;
        }
        if (itemStartIndex == 0)
        {
            nativeReceivedItemIds = [];
        }
        var itemBatchValid = true;
        for (var itemIndex = 0; itemIndex < itemCount; itemIndex++)
        {
            var itemKey = string(itemIndex);
            var itemId = apclient_json_number_at(itemIdsProxy, itemKey);
            if (floor(itemId) != itemId || mw_ap_item_name(itemId) == "")
            {
                nativeFailSeed("Unknown MPO item ID " + string(itemId));
                itemBatchValid = false;
                break;
            }
            var historyIndex = itemStartIndex + itemIndex;
            if (historyIndex < array_length(nativeReceivedItemIds))
            {
                if (nativeReceivedItemIds[historyIndex] != itemId)
                {
                    nativeFailSeed("Conflicting Archipelago item history at index " + string(historyIndex));
                    itemBatchValid = false;
                    break;
                }
            }
            else
            {
                array_push(nativeReceivedItemIds, itemId);
            }
            array_push(nativeProofItems, {
                index: historyIndex,
                item: itemId,
                name: apclient_json_string_at(itemNamesProxy, itemKey),
                player: apclient_json_number_at(itemPlayersProxy, itemKey),
                location: apclient_json_number_at(itemLocationsProxy, itemKey),
                flags: apclient_json_number_at(itemFlagsProxy, itemKey)
            });
        }
        if (!itemBatchValid) break;
        nativeItemsSeen = true;
        nativeTransferTimer = 0;
        show_debug_message("Archipelago: native item callback received at index " + string(itemStartIndex));
        break;

    case "ap_location_checked":
        var checkedCount = apclient_json_number_at(0, "len");
        var checkedLocationsProxy = apclient_json_proxy(0, "locations");
        if (checkedCount < 0 || floor(checkedCount) != checkedCount
            || (checkedCount > 0 && checkedLocationsProxy < 0))
        {
            nativeFailSeed("Malformed Archipelago check acknowledgement");
            break;
        }
        for (var checkedIndex = 0; checkedIndex < checkedCount; checkedIndex++)
        {
            var checkedLocation = apclient_json_number_at(checkedLocationsProxy, string(checkedIndex));
            if (checkedLocation < 1 || checkedLocation > nativeExpectedScoutCount || floor(checkedLocation) != checkedLocation)
            {
                nativeFailSeed("Unknown acknowledged MPO location ID " + string(checkedLocation));
                break;
            }
            nativeAcknowledgedChecks[checkedLocation] = true;
        }
        break;

    case "ap_print_json":
        var plainMessage = apclient_render_json(apclient_json_dump(0), global.AP_RENDER_FORMAT_TEXT);
        nativeAddMessage(plainMessage, nativeFormatPrintJSON(plainMessage));
        show_item_pickup_text(nativeLastMessage);
        show_debug_message("Archipelago: " + plainMessage);
        break;

    case "ap_socket_disconnected":
        connectedToClient = false;
        if (nativeSessionActive)
        {
            nativeState = "disconnected";
            nativeAddMessage("Connection lost; retrying");
            show_debug_message("Archipelago: socket disconnected; reconnect pending");
        }
        else
        {
            if (nativeState != "error")
            {
                nativeState = "disconnected";
            }
            show_debug_message("Archipelago: socket disconnected");
        }
        break;

    case "ap_socket_error":
        connectedToClient = false;
        nativeState = "error";
        nativeError = nativeEscapeDisplay(apclient_json_string_at(0, "message"));
        if (nativeError != nativeLastSocketError)
        {
            nativeLastSocketError = nativeError;
            nativeAddMessage(nativeError);
        }
        show_debug_message("Archipelago socket error: " + nativeError);
        break;

    case "show_message":
        nativeState = "error";
        nativeError = nativeEscapeDisplay(apclient_json_string_at(0, "message"));
        nativeAddMessage(nativeError);
        show_item_pickup_text(nativeError);
        show_debug_message("Archipelago library error: " + nativeError);
        break;

    case "ap_bounced":
        break;

    default:
        show_debug_message("Archipelago: ignored native event " + nativeLastEvent);
        break;
}

nativeTransferTimer -= 1;
if (nativeTransferTimer <= 0)
{
    nativeTransferTimer = 30;
    nativeReconcileItems();
    nativeSendPendingChecks();
    nativeSendGoal();
}

if (nativeConsoleOpen)
{
    keyboard_string = string_copy(keyboard_string, 1, 256);
    if (keyboard_check_pressed(vk_tab)) nativeCompleteInput();
    if (keyboard_check_pressed(vk_enter))
    {
        var chatMessage = string_trim(keyboard_string);
        keyboard_string = "";
        nativeCompletionMatches = [];
        nativeCompletionCurrent = "";
        if (chatMessage != "" && (!connectedToClient || !apclient_say(chatMessage)))
        {
            nativeAddMessage("Could not send Archipelago message");
        }
    }
}
