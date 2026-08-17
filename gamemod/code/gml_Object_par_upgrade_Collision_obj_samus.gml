if (!(!other.grappling && visible) && sprite_index != sprChozoArtifacts)
{
    exit;
}
if (!(place_meeting(x, y, other) && !other.grappling && visible) && sprite_index == sprChozoArtifacts)
{
    exit;
}
ds_write(key, 1);
ds_add("Completion", 1);
instance_create(x, y, obj_collected);
ds_write("Hint Timer", 0);
instance_destroy();
exit;

// Vanilla item obtain code
if (!ds_adding)
{
    ds_write(ds_name, ds_value);
}
else
{
    ds_add(ds_name, ds_value);
}

aeon_array = dz("Aeon");
stat_array = dz("Aeon Status");
if (is_array(stat_array))
{
    if (is_aeon)
    {
        if (aeon_0 != "Nothing")
        {
            array_push(stat_array, 0);
            array_push(aeon_array, aeon_0);
        }
        if (aeon_1 != "Nothing")
        {
            array_push(stat_array, 0);
            array_push(aeon_array, aeon_1);
        }
        if (aeon_2 != "Nothing")
        {
            array_push(stat_array, 0);
            array_push(aeon_array, aeon_2);
        }
        if (aeon_3 != "Nothing")
        {
            array_push(stat_array, 0);
            array_push(aeon_array, aeon_3);
        }
        ds_write("Aeon", aeon_array);
        ds_write("Aeon Status", stat_array);
    }
}
instance_destroy();
