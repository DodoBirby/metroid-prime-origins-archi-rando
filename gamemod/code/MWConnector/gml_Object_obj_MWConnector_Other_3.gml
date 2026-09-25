
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


