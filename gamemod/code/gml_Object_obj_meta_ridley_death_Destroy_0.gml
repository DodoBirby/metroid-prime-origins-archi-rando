event_inherited();
instance_destroy(obj_spawner_meta_ridley);
instance_destroy(obj_camera_solid);
repeat (64)
{
    drop_pickup(global.xview + irandom(global._screen_width), global.yview + irandom(global._screen_height));
}
chunks = ((sprite_get_width(sprite_index) / 8) * sprite_get_height(sprite_index)) / 8;
chunks = ceil(chunks);
repeat (chunks)
{
    w = sprite_get_width(sprite_index);
    h = sprite_get_height(sprite_index);
    instance_create((x - (w / 2)) + irandom(w), (y - (h / 2)) + irandom(h), obj_enemy_chunk);
}
// -- MW Changes Start
if (dz("MWLocal") && dz("MWEndAtRidley"))
{
    room_goto(rm_Ending_0);
}
// -- MW Changes End