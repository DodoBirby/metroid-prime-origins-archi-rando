can_artifact = 0;
var arr = dz("Aeon");
if (array_length(arr) > 0)
{
    can_artifact = 1;
}
// -- MW Changes: Allow teleporting from ship
/*
if (global.area != 0 && room != tal_Landing_Site)
{
    can_teleport = 1;
}
*/
can_teleport = 1;