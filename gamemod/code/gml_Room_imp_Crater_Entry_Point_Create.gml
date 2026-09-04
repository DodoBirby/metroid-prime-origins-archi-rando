global.area = 6;
map_offset(10, 2);
ds_write("Entered Crater", 1);
// -- MW Changes Start
if (dz("MWPhazonHint") != 0)
{
    instance_create_layer(64, 288, "Instances", obj_aura_pirate, { scan_number: 25 });
}
// -- MW Changes End