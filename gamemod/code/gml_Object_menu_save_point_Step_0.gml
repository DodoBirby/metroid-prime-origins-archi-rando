pos = 0;
skips = 0;
repeat (12)
{
    if (ds_zero("Artifact " + string(pos + 1)) == 0)
    {
        skips += 1;
    }
    pos += 1;
}
if (skips < 12)
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