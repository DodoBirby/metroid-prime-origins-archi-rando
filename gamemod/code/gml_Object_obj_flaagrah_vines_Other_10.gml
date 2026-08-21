/*
if (dz("Artifact 4") || !dz("Varia Suit"))
{
    instance_destroy();
}
*/
// Make this work off the locations instead
if (dz("Artifact 4 cho_Sunchamber x320 y224") || !dz("Varia Suit cho_Sunchamber x56 y320"))
{
    instance_destroy();
}
if (place_meeting(xstart, ystart, par_player))
{
    x = -666;
}
else
{
    x = xstart;
}
