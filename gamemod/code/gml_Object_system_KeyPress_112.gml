// -- MW Changes Start
if (instance_exists(obj_MWConnector))
{
    bitsound(sndMessageConfirm);
    obj_MWConnector.nativeConsoleOpen = !obj_MWConnector.nativeConsoleOpen;
}
// -- MW Changes End
