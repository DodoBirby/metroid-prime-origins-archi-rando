identity = string(room) + " Save Point";
room_nombre = string(room_get_name(room));
room_nombre = string_copy(room_nombre, 5, string_length(room_nombre));
teleport_name = global.area_name + " - " + room_nombre;
// -- MW Change: Allow ship to be a teleport point
if (!ds_zero(identity) && global.area > 0)
{
    array_push(ds_zero("Teleport Array"), [teleport_name, x, y, room_get_name(room)]);
}
ds_write(identity, 1);
