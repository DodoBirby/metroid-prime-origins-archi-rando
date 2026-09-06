message_0 = "Dummy Message";
message_counter = 0;
message_dir = 0.25;
// -- MW Changes Start
offset = 0;
depth = -9999;
with (obj_message_in_game)
{
    if (id == other.id)
    {
        continue;
    }
    offset += 16;
}
// -- MW Changes End