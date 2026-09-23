// -- MW Changes Start
if (room == rm_Title)
{
    var titleStatus = "AP: " + nativeState;
    if (nativeState == "ready" && nativeSlot != "") titleStatus += " (" + nativeEscapeDisplay(nativeSlot) + ")";
    draw_text_scribble(global._screen_width - 6, global._screen_height - 4,
        "[fnt_Logbook][fa_right][fa_bottom][NES_Cyan]" + titleStatus);
}

if (!nativeConsoleOpen) exit;

var consoleHeader = "[fnt_Logbook][fa_left][fa_top][NES_Cyan]ARCHIPELAGO (" + nativeState + ")";
var consoleFooter = "[NES_White]Enter: chat/command    F1: close";
var consoleBody = "";
var consoleWidth = global._screen_width - 20;
for (var messageIndex = array_length(nativeMessages) - 1; messageIndex >= 0; messageIndex--)
{
    var candidateBody = nativeMessages[messageIndex] + (consoleBody == "" ? "" : "\n" + consoleBody);
    if (mw_small_text_height(consoleHeader + "\n" + candidateBody + "\n" + consoleFooter, consoleWidth) > global._screen_height - 20)
    {
        break;
    }
    consoleBody = candidateBody;
}
var consoleText = consoleHeader + (consoleBody == "" ? "" : "\n" + consoleBody) + "\n" + consoleFooter;

draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(4, 4, global._screen_width - 4, global._screen_height - 4, false);
draw_set_alpha(1);
draw_set_color(c_white);
mw_draw_small_text(10, 10, consoleText, consoleWidth);
// -- MW Changes End
