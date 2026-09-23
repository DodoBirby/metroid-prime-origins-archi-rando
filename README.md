# Metroid Prime Origins Archipelago

This is an [Archipelago](https://github.com/ArchipelagoMW/Archipelago) implementation for the fangame "Metroid Prime Origins".

# Install Instructions ("I want to play the randomizer")

These instructions will assume you are somewhat familiar with how to use Archipelago and will only contain the things that are special for this randomizer (This is just temporary for the prerelease stage, I will give better instructions on actual release).

## The general steps

The tl;dr of setting up the rando is as follows:

Before playing any seeds:

1. Download and extract the matching `mpo-native-client-patch-1.1.2-vm.zip` release bundle.
2. Apply its `randomizer_patch_native_client_1_1_2_vm.xdelta` to the `data.win` from a clean **64-bit Metroid Prime Origins 1.1.2 VM** copy.
3. Put the patched `data.win`, `gm-apclientpp.dll`, and `mpo-window.dll` next to `MetroidPrimeOrigins.exe`.
4. Install the matching `metroid_prime_origins.apworld` in Archipelago.

Before each seed (if you're playing a multiworld):

1. Run your patched copy of Metroid Prime Origins.
2. Open Extras and select `AP Connect` to enter the server, slot, and optional password. Saved host and slot values are retried automatically on later launches.
3. Wait for the title-screen status to say `AP: ready`.
4. Start a new save file on `remix mode`.

Before each seed (if playing solo):

1. Ensure you have an mposeed file to load (if you generated an archipelago seed locally then it will be in the output .zip file), otherwise whoever generated the seed should give it to you.
2. Run your patched copy of Metroid Prime Origins.
3. Go to the extras menu and select the "Load Seed File" option.
4. Select the mposeed file in the menu (after selecting it you should see a message in the bottom right saying "Seed file loaded").
5. Start a new save file on `remix mode`.

If you need more details on any of the steps, see the sections below.

## Patching the game

Keep a backup of your clean **64-bit Metroid Prime Origins 1.1.2 VM** folder. Download the matching patch bundle from this version's release and extract it. Using an [xdelta patcher](https://kotcrab.github.io/xdelta-wasm/), select the clean game's `data.win` as the original file and `randomizer_patch_native_client_1_1_2_vm.xdelta` as the patch. Rename the output to `data.win` and place it next to `MetroidPrimeOrigins.exe` in your playing copy. Copy `gm-apclientpp.dll` and `mpo-window.dll` from the same bundle into that folder.

The older `randomizer_patch0_0_5.xdelta` does not contain the native Archipelago client. Do not apply it before or instead of the patch for this version. If the patcher rejects your original file, check that it is the clean 1.1.2 VM `data.win`.

## Running the client

The patched game connects directly to Archipelago. Open Extras and select `AP Connect` to enter the server address, slot name, and optional password. The game saves the host and slot and tries to reconnect with them when it starts. Passwords are not saved; enter one through `AP Connect` when needed.

The settings file is created when the game first saves options, at `%LOCALAPPDATA%\Metroid_Prime_Origins_Archipelago\Metroid Settings.NUT`. It contains serialized game settings, not editable `AP Host` and `AP Slot` INI entries. Use `AP Connect` to change those values.

The title screen shows the current AP connection state.

Press F1 for the in-game AP console.
Type a message or server command, use Tab to complete commands and `!hint` item or `!hint_location` location names. Press Enter to send.

Now that you're connected, you can start your save file. Make sure to pick `remix mode`, other modes have not been tested and the logic won't be correct.

The other settings are less important but for reference, the randomizer has been tested with the following settings:

- Difficulty: 100%
- Hint System: Off

Things should still work if you don't have these set, but there might be issues (let me know if you try these settings and run into anything).

## Local play

When a seed is generated (and it is a solo Metroid Prime Origins seed), there is an extra file generated in the output zip file.

This file can be identified by the .mposeed extension. This is the file you should share with anyone who wants to play the seed.

Assuming you have received a .mposeed file, here is how to use it.

In your patched version of the game, open the options menu and you should find an option "Load Seed File". Pressing this will bring up a file dialog asking you to select the mposeed file you want to play.

After selecting your mposeed file, exit the options menu and start a new save file on `remix mode`. Enjoy the rando!

If you want to continue playing the seed after quitting out of the game, simply load your save file, the seed has already been applied.

Currently playing a local seed and playing a multiworld are completely separate, so don't try and mix the 2 on the same save file unless you want things to break.

## Common Issues

### The title screen says `AP: unavailable`

Make sure `gm-apclientpp.dll` is next to `MetroidPrimeOrigins.exe` and that the game is the 64-bit 1.1.2 VM release.

### My save does not appear

Online saves are bound to their seed, team, and slot.
Connect to the matching room before opening the file-select menu. Local saves remain available during solo play.

## Potentially unintuitive item locations

Some locations in the game have weird requirements or event flags, here is a list of them in case you're stuck.

### (Chozo Ruins) Main Plaza - Boost Ball Ramp

This item is normally blocked by boost ball blocks, but if you have Space Jump Boots equipped the blocks will be gone.

## Bug reporting

Since this randomizer is still in a prerelease stage I expect there will be bugs. You may want to hold off on putting this apworld into a proper multiworld until it's more stable.

If you encounter any bugs or any other issues then please let me know about them, you can reach me in several discord servers:

- Official AM2R Discord Server
- Multiworld.gg Unofficial Archipelago Server (on the Metroid Prime Origins thread)
- Metroid Prime Origins Community Server (don't use the bug-reports thread since that's for the vanilla game)

Please don't send bug reports via Github issues (since I won't check it), or via the Official Archipelago Discord Server (since nintendo fangame discussion is not allowed there).

### Logic issue reporting

If you are reporting a logic issue where the logic is too strict (you can do something in game but the logic says you can't), note that there are some tricks which are intentionally not in logic yet.

They are the following:

- Missile Glides (firing a missile to reset y velocity)
- Boost ball jumps
- Horizontal bomb jumping

If you are reporting a logic issue where something is in logic but shouldn't be, then please let me know about it.

Combat logic is not fully complete yet so there may be cases where some really hard fights are in logic. (you should report these).

# Build Instructions ("I want to help develop the randomizer")

If you're just planning on playing then you can ignore everything below.

## Source Code Structure

- `/gamemod` contains a [UTMT](https://github.com/UnderminersTeam/UndertaleModTool) project for all the changes that are made to the actual gamemaker code.

- `/apworld` contains an APWorld for generating the game with [Archipelago](https://github.com/ArchipelagoMW/Archipelago), this is also where all the logic lives.

## Building the APWorld

Copy the `/apworld` folder into a [from-source](https://github.com/ArchipelagoMW/Archipelago/blob/main/docs/running%20from%20source.md) build of Archipelago and follow its [APWorld build documentation](https://github.com/ArchipelagoMW/Archipelago/blob/main/docs/apworld%20specification.md) to package it. The separate Python client and launcher component are no longer needed.

## Building the Game Mod

Use UTMT CLI 0.9.2.0 and a clean Metroid Prime Origins 1.1.2 VM directory:

```powershell
.\tools\build_game_mod.ps1 -UtmtCli C:\path\to\UndertaleModCli.exe `
  -SourceGame C:\path\to\clean-game `
  -OutputGame C:\path\to\patched-game
```

The script builds `data.win` into an isolated copy and adds both native DLLs.
Regenerate the checked-in AP ID mappings with `python tools/generate_ap_mappings.py`.
Use `--check` to verify them without writing.
