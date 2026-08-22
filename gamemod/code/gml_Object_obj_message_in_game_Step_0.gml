message_counter += message_dir;
// -- MW Changes Start: Make message counter ending dynamic instead of fixed 50
if (message_counter > string_length(message_0) + 30)
{
    message_dir = -1;
}
// -- MW Changes End
if (message_counter == round(message_counter) && message_counter <= string_length(message_0))
{
    bitsound(sndText);
}
if (message_counter < 0)
{
    instance_destroy();
}
