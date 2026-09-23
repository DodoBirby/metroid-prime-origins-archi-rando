function InputGameHasFocus()
{
    static _system = __InputSystem();

    // -- MW Changes Start
    return _system.__windowFocus && !os_is_paused()
        && !(instance_exists(obj_MWConnector) && obj_MWConnector.nativeConsoleOpen);
    // -- MW Changes End
}
