if (!string_pos("Suit", upgrade_name))
{
    bitfanfare(_fanfare);
}
ds_add("Collection", 1);
if (sends_message)
{
    with (instance_create_layer(0, 0, "Instances", obj_message_box_double))
    {
        message_0 = other.upgrade_name + txt(" acquired!");
        message_1 = other.description;
    }
}
item_x = 0;
item_y = 0;
with (obj_map_system)
{
    item_x = global.map_room_x + (other.xstart / wblock);
    item_y = global.map_room_y + (other.ystart / hblock);
    array_push(found_array, [3, item_x, item_y]);
}
if (ds_zero_options("Autosave"))
{
    save_and_tell();
}
