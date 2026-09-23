text = "[fnt_Logbook][fa_right][fa_bottom][NES_Cyan]";
text += message_0;
// -- MW Changes Start
offset = 0;
with (obj_message_in_game)
{
    if (id < other.id)
    {
        other.offset += popup_height + 2;
    }
}
mw_draw_small_text(global._screen_width - 6, global._screen_height - 3 - offset, text, popup_width);
// -- MW Changes End
