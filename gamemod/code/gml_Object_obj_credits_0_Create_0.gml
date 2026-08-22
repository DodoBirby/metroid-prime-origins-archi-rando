str = "[c_white][fa_center][fa_top]";
str += credits();
_h = string_height_scribble(str);
bitBGM(theme);
alarm[0] = audio_sound_length(theme) * 60;
music_volume(1);
song_frames = audio_sound_length(theme) * 60;
scroll_factor = _h / song_frames;
fade_out = 0;
can_skip = 0;
alarm[1] = 180;
// -- MW Changes Start
global.mwcompleted = 1;
// -- MW Changes End
