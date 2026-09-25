message_counter += message_dir;
// -- MW Changes Start
message_life -= 1;
popup_height = mw_small_text_height("[fnt_Logbook]" + message_0, popup_width);
with (obj_message_in_game)
{
    if (msg_id < other.msg_id)
    {
        other.offset += popup_height + 2;
    }
}
// -- MW Changes End
if (message_counter == round(message_counter) && message_counter <= string_length(message_0))
{
    bitsound(sndText);
}
// -- MW Changes Start
if (message_life <= 0)
{
    instance_destroy();
}
// -- MW Changes End
