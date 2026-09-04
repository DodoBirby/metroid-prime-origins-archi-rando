event_inherited();
// -- MW Changes Start
exit;
// -- MW Changes End

// We don't want to run any of this code since it's handled already
if (!dz(key))
{
    exit;
}
ds_add("Missiles", ds_value);
ds_write("Missile Launcher", 1);
