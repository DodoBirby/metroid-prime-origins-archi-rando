// -- MW Changes Start
function apclient_bind(dll_path)
{
    global.AP_RENDER_FORMAT_TEXT = 0;
    global.AP_RENDER_FORMAT_HTML = 1;
    global.AP_RENDER_FORMAT_ANSI = 2;
    global.AP_STATE_DISCONNECTED = 0;
    global.AP_STATE_SOCKET_CONNECTING = 1;
    global.AP_STATE_SOCKET_CONNECTED = 2;
    global.AP_STATE_ROOM_INFO = 3;
    global.AP_STATE_SLOT_CONNECTED = 4;
    global.AP_CLIENT_STATUS_UNKNOWN = 0;
    global.AP_CLIENT_STATUS_READY = 10;
    global.AP_CLIENT_STATUS_PLAYING = 20;
    global.AP_CLIENT_STATUS_GOAL = 30;
    global.AP_JSON_MISSING = -1;
    global.AP_JSON_OBJECT = 0;
    global.AP_JSON_ARRAY = 1;
    global.AP_JSON_STRING = 2;
    global.AP_JSON_NUMBER = 3;
    global.AP_JSON_NULL = 4;

    global.ext_apclient_init = external_define(dll_path, "apclient_init", dll_cdecl, ty_real, 1, ty_real);
    global.ext_apclient_deinit = external_define(dll_path, "apclient_deinit", dll_cdecl, ty_real, 0);
    global.ext_apclient_connect = external_define(dll_path, "apclient_connect", dll_cdecl, ty_real, 3, ty_string, ty_string, ty_string);
    global.ext_apclient_poll = external_define(dll_path, "apclient_poll", dll_cdecl, ty_string, 0);
    global.ext_apclient_disconnect = external_define(dll_path, "apclient_disconnect", dll_cdecl, ty_real, 0);
    global.ext_apclient_reset = external_define(dll_path, "apclient_reset", dll_cdecl, ty_real, 0);
    global.ext_apclient_get_player_alias = external_define(dll_path, "apclient_get_player_alias", dll_cdecl, ty_string, 1, ty_real);
    global.ext_apclient_get_player_game = external_define(dll_path, "apclient_get_player_game", dll_cdecl, ty_string, 1, ty_real);
    global.ext_apclient_get_game = external_define(dll_path, "apclient_get_game", dll_cdecl, ty_string, 0);
    global.ext_apclient_get_location_name = external_define(dll_path, "apclient_get_location_name", dll_cdecl, ty_string, 2, ty_real, ty_string);
    global.ext_apclient_get_item_name = external_define(dll_path, "apclient_get_item_name", dll_cdecl, ty_string, 2, ty_real, ty_string);
    global.ext_apclient_render_json = external_define(dll_path, "apclient_render_json", dll_cdecl, ty_string, 2, ty_string, ty_real);
    global.ext_apclient_get_state = external_define(dll_path, "apclient_get_state", dll_cdecl, ty_real, 0);
    global.ext_apclient_get_seed = external_define(dll_path, "apclient_get_seed", dll_cdecl, ty_string, 0);
    global.ext_apclient_get_slot = external_define(dll_path, "apclient_get_slot", dll_cdecl, ty_string, 0);
    global.ext_apclient_get_player_number = external_define(dll_path, "apclient_get_player_number", dll_cdecl, ty_real, 0);
    global.ext_apclient_get_team_number = external_define(dll_path, "apclient_get_team_number", dll_cdecl, ty_real, 0);
    global.ext_apclient_is_data_package_valid = external_define(dll_path, "apclient_is_data_package_valid", dll_cdecl, ty_real, 0);
    global.ext_apclient_set_items_handling = external_define(dll_path, "apclient_set_items_handling", dll_cdecl, ty_real, 1, ty_real);
    global.ext_apclient_set_version = external_define(dll_path, "apclient_set_version", dll_cdecl, ty_real, 3, ty_real, ty_real, ty_real);
    global.ext_apclient_say = external_define(dll_path, "apclient_say", dll_cdecl, ty_real, 1, ty_string);
    global.ext_apclient_connect_slot = external_define(dll_path, "apclient_connect_slot", dll_cdecl, ty_real, 3, ty_string, ty_string, ty_string);
    global.ext_apclient_connect_update_items_handling = external_define(dll_path, "apclient_connect_update_items_handling", dll_cdecl, ty_real, 0);
    global.ext_apclient_connect_update = external_define(dll_path, "apclient_connect_update", dll_cdecl, ty_real, 1, ty_string);
    global.ext_apclient_sync = external_define(dll_path, "apclient_sync", dll_cdecl, ty_real, 0);
    global.ext_apclient_status_update = external_define(dll_path, "apclient_status_update", dll_cdecl, ty_real, 1, ty_real);
    global.ext_apclient_location_checks = external_define(dll_path, "apclient_location_checks", dll_cdecl, ty_real, 1, ty_string);
    global.ext_apclient_location_scouts = external_define(dll_path, "apclient_location_scouts", dll_cdecl, ty_real, 2, ty_string, ty_real);
    global.ext_apclient_json_proxy = external_define(dll_path, "apclient_json_proxy", dll_cdecl, ty_real, 2, ty_real, ty_string);
    global.ext_apclient_json_exists = external_define(dll_path, "apclient_json_exists", dll_cdecl, ty_real, 2, ty_real, ty_string);
    global.ext_apclient_json_typeof = external_define(dll_path, "apclient_json_typeof", dll_cdecl, ty_real, 1, ty_real);
    global.ext_apclient_json_size = external_define(dll_path, "apclient_json_size", dll_cdecl, ty_real, 1, ty_real);
    global.ext_apclient_json_get_string = external_define(dll_path, "apclient_json_get_string", dll_cdecl, ty_string, 1, ty_real);
    global.ext_apclient_json_string_at = external_define(dll_path, "apclient_json_string_at", dll_cdecl, ty_string, 2, ty_real, ty_string);
    global.ext_apclient_json_get_number = external_define(dll_path, "apclient_json_get_number", dll_cdecl, ty_real, 1, ty_real);
    global.ext_apclient_json_number_at = external_define(dll_path, "apclient_json_number_at", dll_cdecl, ty_real, 2, ty_real, ty_string);
    global.ext_apclient_json_dump = external_define(dll_path, "apclient_json_dump", dll_cdecl, ty_string, 1, ty_real);
    global.ext_apclient_json_source = external_define(dll_path, "apclient_json_source", dll_cdecl, ty_string, 0);
    return true;
}

function apclient_init(api_version) { return external_call(global.ext_apclient_init, api_version); }
function apclient_deinit() { return external_call(global.ext_apclient_deinit); }
function apclient_connect(uuid, game, host) { return external_call(global.ext_apclient_connect, uuid, game, host); }
function apclient_poll() { return external_call(global.ext_apclient_poll); }
function apclient_disconnect() { return external_call(global.ext_apclient_disconnect); }
function apclient_reset() { return external_call(global.ext_apclient_reset); }
function apclient_get_player_alias(slot) { return external_call(global.ext_apclient_get_player_alias, slot); }
function apclient_get_player_game(slot) { return external_call(global.ext_apclient_get_player_game, slot); }
function apclient_get_game() { return external_call(global.ext_apclient_get_game); }
function apclient_get_location_name(location_id, game) { return external_call(global.ext_apclient_get_location_name, location_id, game); }
function apclient_get_item_name(item_id, game) { return external_call(global.ext_apclient_get_item_name, item_id, game); }
function apclient_render_json(message, format) { return external_call(global.ext_apclient_render_json, message, format); }
function apclient_get_state() { return external_call(global.ext_apclient_get_state); }
function apclient_get_seed() { return external_call(global.ext_apclient_get_seed); }
function apclient_get_slot() { return external_call(global.ext_apclient_get_slot); }
function apclient_get_player_number() { return external_call(global.ext_apclient_get_player_number); }
function apclient_get_team_number() { return external_call(global.ext_apclient_get_team_number); }
function apclient_is_data_package_valid() { return external_call(global.ext_apclient_is_data_package_valid); }
function apclient_set_items_handling(items_handling) { return external_call(global.ext_apclient_set_items_handling, items_handling); }
function apclient_set_version(major, minor, revision) { return external_call(global.ext_apclient_set_version, major, minor, revision); }
function apclient_say(message) { return external_call(global.ext_apclient_say, message); }
function apclient_connect_slot(slot, password, tags) { return external_call(global.ext_apclient_connect_slot, slot, password, tags); }
function apclient_connect_update_items_handling() { return external_call(global.ext_apclient_connect_update_items_handling); }
function apclient_connect_update(tags) { return external_call(global.ext_apclient_connect_update, tags); }
function apclient_sync() { return external_call(global.ext_apclient_sync); }
function apclient_status_update(status) { return external_call(global.ext_apclient_status_update, status); }
function apclient_location_checks(location_ids) { return external_call(global.ext_apclient_location_checks, location_ids); }
function apclient_location_scouts(location_ids, create_as_hint) { return external_call(global.ext_apclient_location_scouts, location_ids, create_as_hint); }
function apclient_json_proxy(proxy, key) { return external_call(global.ext_apclient_json_proxy, proxy, key); }
function apclient_json_exists(proxy, key) { return external_call(global.ext_apclient_json_exists, proxy, key); }
function apclient_json_typeof(proxy) { return external_call(global.ext_apclient_json_typeof, proxy); }
function apclient_json_size(proxy) { return external_call(global.ext_apclient_json_size, proxy); }
function apclient_json_get_string(proxy) { return external_call(global.ext_apclient_json_get_string, proxy); }
function apclient_json_string_at(proxy, key) { return external_call(global.ext_apclient_json_string_at, proxy, key); }
function apclient_json_get_number(proxy) { return external_call(global.ext_apclient_json_get_number, proxy); }
function apclient_json_number_at(proxy, key) { return external_call(global.ext_apclient_json_number_at, proxy, key); }
function apclient_json_dump(proxy) { return external_call(global.ext_apclient_json_dump, proxy); }
function apclient_json_source() { return external_call(global.ext_apclient_json_source); }
// -- MW Changes End
