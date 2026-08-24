# Metroid Prime Origins Archipelago

This is an [Archipelago](https://github.com/ArchipelagoMW/Archipelago) implementation for the fangame "Metroid Prime Origins".

# Source Code Structure

- `/gamemod` contains a [UTMT](https://github.com/UnderminersTeam/UndertaleModTool) project for all the changes that are made to the actual gamemaker code.

- `/apworld` contains an APWorld for generating the game with [Archipelago](https://github.com/ArchipelagoMW/Archipelago), this is also where all the logic lives.

# Build Instructions

The following instructions are for people who would like to help with development, if you just want to play then you can ignore everything below.

## Building the APWorld

Copy the `/apworld` folder into a [from source](https://github.com/ArchipelagoMW/Archipelago/blob/main/docs/running%20from%20source.md) build of Archipelago and then reference the [Official Archipelago Documentation](https://github.com/ArchipelagoMW/Archipelago/blob/main/docs/apworld%20specification.md#build-apworlds-launcher-component) on building apworlds.

## Building the Game Mod

1. Download the latest version of [UTMT](https://github.com/UnderminersTeam/UndertaleModTool) and run it.
2. In the `File` dropdown menu, click `Open` and select the `data.win` file in your Metroid Prime Origins game folder.
3. In the `Project` dropdown menu, click `Open project` and select the `project.json` file in the `/gamemod` folder of this repository.
4. You will be asked to pick a destination data file location, pick any place you want and name it something like `modded.win`.
5. In the `File` dropdown menu, click `Save`, if it asks to "save to the designated data file" then click yes.
6. You should now have a modded data file in whatever location you picked in step 4.
