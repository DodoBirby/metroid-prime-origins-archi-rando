message_0 = "Dummy Message";
message_counter = 0;
message_dir = 0.25;
// -- MW Changes Start
msg_id = global.messageInGameCount;
global.messageInGameCount += 1;
message_life = room_speed * 3;
offset = 0;
popup_width = global._screen_width - 24;
popup_height = 16;
depth = -9999;
// -- MW Changes End
