/*
if (dz("Artifact 4") || !dz("Varia Suit"))
{
    instance_destroy();
}
*/
// Just kill the vines, the consequences for logic are annoying to think about
instance_destroy();
if (place_meeting(xstart, ystart, par_player))
{
    x = -666;
}
else
{
    x = xstart;
}
