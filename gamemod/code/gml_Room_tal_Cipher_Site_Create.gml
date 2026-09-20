global.area = 1;
map_offset(16, 2);
ds_write("Welcome to Disneyland", 1);
// -- MW Changes Start: swap ciphers depending on victory condition
if (instance_exists(obj_pirate_cipher) && dz("MWArtifactsRequired") != 0)
{
    instance_destroy(obj_pirate_cipher);
    instance_create(248, 256, obj_chozo_cipher);
}
// -- MW Changes End