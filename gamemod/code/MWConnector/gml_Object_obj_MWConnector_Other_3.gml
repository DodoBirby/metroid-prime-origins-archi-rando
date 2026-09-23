// -- MW Changes Start: Add option to lock mouse inside window.
if (nativeInitialized)
{
    nativePassword = "";
    nativeSessionActive = false;
    apclient_deinit();
    nativeInitialized = false;
}
if (nativeBindingsLoaded)
{
    external_free(nativeDllPath);
    nativeBindingsLoaded = false;
}
if (variable_global_exists("ext_mpo_mouse_confine") && global.ext_mpo_mouse_confine != -1)
{
    external_call(global.ext_mpo_mouse_confine, false);
    external_free(global.mpoMouseConfineDll);
    global.ext_mpo_mouse_confine = -1;
}
// -- MW Changes End
