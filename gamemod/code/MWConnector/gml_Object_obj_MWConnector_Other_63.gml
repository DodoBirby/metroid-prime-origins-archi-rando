if (ds_map_find_value(async_load, "id") != nativeDialogId)
{
    exit;
}

if (!ds_map_find_value(async_load, "status"))
{
    nativeDialogId = -1;
    nativeDialogStage = "";
    nativePendingHost = "";
    exit;
}

switch (nativeDialogStage)
{
    case "host":
        nativePendingHost = string(ds_map_find_value(async_load, "result"));
        if (nativePendingHost == "")
        {
            nativeError = "Archipelago server address is required";
            nativeDialogId = -1;
            nativeDialogStage = "";
            show_item_pickup_text(nativeError);
            break;
        }
        nativeDialogStage = "login";
        show_item_pickup_text("Enter the slot name as username; password is optional");
        nativeDialogId = get_login_async(nativeSlot, "");
        break;

    case "login":
        var pendingSlot = string(ds_map_find_value(async_load, "username"));
        var pendingPassword = string(ds_map_find_value(async_load, "password"));
        nativeDialogId = -1;
        nativeDialogStage = "";
        if (!nativeConnect(nativePendingHost, pendingSlot, pendingPassword))
        {
            show_item_pickup_text(nativeError);
        }
        nativePendingHost = "";
        break;

    case "chat":
        var chatMessage = string(ds_map_find_value(async_load, "result"));
        nativeDialogId = -1;
        nativeDialogStage = "";
        if (chatMessage != "" && (!connectedToClient || !apclient_say(chatMessage)))
        {
            nativeError = "Could not send the Archipelago message";
            show_item_pickup_text(nativeError);
        }
        break;
}
