# Metroid Prime Origins Archipelago

This is an [Archipelago](https://github.com/ArchipelagoMW/Archipelago) implementation for the fangame "Metroid Prime Origins".

# Install Instructions ("I want to play the randomizer")

These instructions will assume you are somewhat familiar with how to use Archipelago and will only contain the things that are special for this randomizer (This is just temporary for the prerelease stage, I will give better instructions on actual release).

## The general steps

The tl;dr of setting up the rando is as follows:

Before playing any seeds:
1. Download the `game-patch0_0_5.zip` and extract it.
2. Patch your data.win file using the randomizer_patch0_0_5.xdelta file. (Make sure you have the VM version of MPO 1.1.2)
3. Copy `gm-apclientpp.dll` and the patched `data.win` from the previous step into your MPO folder (next to `MetroidPrimeOrigins.exe`)
3. Download and install the `metroid_prime_origins.apworld` in Archipelago.

Before each seed (if you're playing a multiworld):

1. Run your patched copy of Metroid Prime Origins.
2. Open Extras and select `AP Connect` to enter the server, slot, and optional password. Server ip and slot values are saved in the options, and are automatically applied on later launches.
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

First you need to apply the randomizer patches to your copy of Metroid Prime Origins, you only have to do this once (until the randomizer gets an update).

I will be referring to the Metroid Prime Origins folder (the one with the exe you use to run the game) as `GAME_FOLDER`.

I recommend making a copy of `GAME_FOLDER` before performing any of the following steps so you can still play the vanilla game.

**MAKE SURE YOU ARE USING THE 1.1.2 VM RELEASE OF METROID PRIME ORIGINS OR THE PATCH WON'T WORK**

You'll need to apply the `randomizer_patch0_0_5.xdelta` to the `data.win` file in `GAME_FOLDER`.

There are many ways to apply an xdelta patch but the easiest way is to use this online patcher https://kotcrab.github.io/xdelta-wasm/.

If the patch succeeded you will have a new file, rename this file to `data.win` and put it in the same place as the old `data.win` (I recommend keeping the old `data.win` around somewhere since it may be required if you want to patch the game again, like when the randomizer gets an update).

If the patch doesn't succeed this usually means you used the wrong `data.win` as a base. Make sure it's the `data.win` from the 1.1.2 VM Release of MPO.

After patching the `data.win` the last step is copying the `gm-apclientpp.dll` file into `GAME_FOLDER` as well.

## Running the client

Now that you have patched your game, you are ready to actually play!

I will be assuming you know how to install the apworld and generate a seed (or you have a host who can generate a seed for you).

First, run your patched copy of MPO.

The patched game connects directly to Archipelago. Open the Extras menu and select `AP Connect` to enter the server address, slot name, and optional password. The game saves the server address and slot and tries to reconnect with them when it starts. Passwords are not saved. Enter them through `AP Connect` when needed.

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

Copy the `/apworld` folder into a [from source](https://github.com/ArchipelagoMW/Archipelago/blob/main/docs/running%20from%20source.md) build of Archipelago and then reference the [Official Archipelago Documentation](https://github.com/ArchipelagoMW/Archipelago/blob/main/docs/apworld%20specification.md#build-apworlds-launcher-component) on building apworlds.

## Building the Game Mod

1. Download the latest version of [UTMT](https://github.com/UnderminersTeam/UndertaleModTool) and run it.
2. In the `File` dropdown menu, click `Open` and select the `data.win` file in your Metroid Prime Origins game folder.
3. In the `Project` dropdown menu, click `Open project` and select the `project.json` file in the `/gamemod` folder of this repository.
4. You will be asked to pick a destination data file location, pick any place you want and name it something like `modded.win`.
5. In the `File` dropdown menu, click `Save`, if it asks to "save to the designated data file" then click yes.
6. You should now have a modded data file in whatever location you picked in step 4.

## Regenerating ap item mappings

The gamemod has an autogenerated file `/gamemod/code/rando_scripts/gml_GlobalScript_mw_ap_mappings.gml`. This file is generated by the python script `/tools/generate_ap_mappings.py`.

This script should be rerun whenever you add new items or locations to the apworld.

You can run the script with the `--check` flag to test whether the generated files are up to date without overwriting them.
