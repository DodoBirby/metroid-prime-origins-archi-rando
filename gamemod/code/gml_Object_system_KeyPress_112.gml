// -- MW Changes Start
if (instance_exists(obj_MWConnector))
{
    bitsound(sndMessageConfirm);
    obj_MWConnector.nativeConsoleOpen = !obj_MWConnector.nativeConsoleOpen;
    keyboard_string = "";
    obj_MWConnector.nativeCompletionMatches = [];
    obj_MWConnector.nativeCompletionCurrent = "";
}
// -- MW Changes End
