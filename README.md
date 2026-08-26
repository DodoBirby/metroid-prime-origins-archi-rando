# Metroid Prime Origins Archipelago

This is an [Archipelago](https://github.com/ArchipelagoMW/Archipelago) implementation for the fangame "Metroid Prime Origins".

# Install Instructions ("I want to play the randomizer")

These instructions will assume you are somewhat familiar with how to use Archipelago and will only contain the things that are special for this randomizer (This is just temporary for the prerelease stage, I will give better instructions on actual release).

## Files

The release has several files, here is what they are for:

| File | Description |
|---|---|
| metroid_prime_origins.apworld | The apworld for use with [Archipelago](https://github.com/ArchipelagoMW/Archipelago), I'm assuming you know what to do with this (for now) |
| randomizer_patch.xdelta | This is an xdelta patch file that you can use to apply the game modifications needed for randomizer to your vanilla Metroid Prime Origins game. (More details in the setup instructions below) |
| metroid_prime_origins.yaml | Template YAML file for use with [Archipelago](https://github.com/ArchipelagoMW/Archipelago), again I'm assuming you already know what to do with this (for now) |

## Game mod setup

First you need to apply the randomizer patches to your copy of Metroid Prime Origins, you only have to do this once (until the randomizer gets an update).

I will be referring to the Metroid Prime Origins folder (the one with the exe you use to run the game) as `GAME_FOLDER`.

I recommend making a copy of `GAME_FOLDER` before performing any of the following steps so you can still play the vanilla game.

**MAKE SURE YOU ARE USING THE 1.0.4 RELEASE OF METROID PRIME ORIGINS OR THE PATCH WON'T WORK**

You'll need to apply the `randomizer_patch.xdelta` to the `data.win` file in `GAME_FOLDER`.

There are many ways to apply an xdelta patch but the easiest way is to use this online patcher https://kotcrab.github.io/xdelta-wasm/.

If the patch succeeded you will have a new file, rename this file to `data.win` and put it in the same place as the old `data.win` (I recommend keeping the old `data.win` around somewhere since it may be required if you want to patch the game again, like when the randomizer gets an update).

## Running the client

Now that you have patched your game, you are ready to actually play!

I will be assuming you know how to install the apworld and generate a seed (or you have a host who can generate a seed for you).

You need to run 2 things:

- The python client
- The patched game

The python client can be run from the archipelago menu (assuming you have the apworld installed), it's called "Metroid Prime Origins Client".

The patched game can be run by just running your Metroid Prime Origins exe (assuming you already patched the `data.win` as described above).

If both of these are running you should see a message pop up in game saying "Connected to Python Client", and hitting the F1 key in game should show a message saying "Status: Connected".

Additionally, using the `/mpo` command in the python client should give a connected status.

Once both things are running you can connect to the archipelago server using the python client by typing the server ip into the bar at the top and hitting the `connect` button.

Now that you're connected, you can start your save file. Make sure to pick `remix mode`, other modes have not been tested and the logic won't be correct.

The other settings are less important but for reference, the randomizer has been tested with the following settings:

- Difficulty: 100%
- Hint System: Off
- Auto Save: Off

Things should still work if you don't have these set, but there might be issues (let me know if you try these settings and run into anything).

## Common Issues

### The F1 status says "Status: Connected" but none of my items are getting sent

You might've forgotten to connect the python client to the archipelago server. Type the ip of the server into the address bar at the top of the python client and hit `connect`.

### TODO: List more common issues

## Potentially unintuitive item locations

Some locations in the game have weird requirements or event flags, here is a list of them in case you're stuck.

### (Chozo Ruins) Main Plaza - Boost Ball Ramp

This item is normally blocked by boost ball blocks, but if you have Space Jump Boots equipped and Boost ball unequipped then the boost ball blocks will be gone.

### (Phendrana Drifts) Phendrana Canyon

You can move the platforms back to their normal positions by unequipping boost ball and re-entering the room.

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
- Hellruns (except for Chozo ruins acid runs which are in logic because I forgot about it)
- Going through Phazon mines fully backwards (omega pirate is backdoorable though)
- Super Metroid style walljumping
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
