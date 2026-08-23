from __future__ import annotations
from typing import TYPE_CHECKING
from BaseClasses import Region

from .locations import MetroidPrimeOriginsLocation
from .items import MetroidPrimeOriginsItem

if TYPE_CHECKING:
    from .world import MetroidPrimeOriginsWorld

def create_event(region: Region, name: str):
    _ = region.add_event(name, location_type=MetroidPrimeOriginsLocation, item_type=MetroidPrimeOriginsItem)

def create_region(name: str, regions: list[Region], world: MetroidPrimeOriginsWorld) -> Region:
    region = Region(name, world.player, world.multiworld)
    regions.append(region)
    return region

def create_and_connect_regions(world: MetroidPrimeOriginsWorld):
    # Create regions
    regions: list[Region] = []
    # Tallon
    landing_site = create_region("(Tallon Overworld) Landing Site", regions, world)
    artifact_temple = create_region("(Tallon Overworld) Artifact Temple", regions, world)
    west_tallon = create_region("(Tallon Overworld) West Tallon", regions, world)
    crash_site_left = create_region("(Tallon Overworld) Crash Site Left of Lake", regions, world)
    crash_site_right = create_region("(Tallon Overworld) Crash Site Right of Lake", regions, world)
    overgrown_cavern = create_region("(Tallon Overworld) Overgrown Cavern", regions, world)
    inside_frigate = create_region("(Tallon Overworld) Inside Frigate", regions, world)
    east_tallon = create_region("(Tallon Overworld) East Tallon", regions, world)
    gated_east_tallon = create_region("(Tallon Overworld) Gated East Tallon", regions, world)
    life_grove = create_region("(Tallon Overworld) Life Grove", regions, world)

    # Chozo Ruins
    west_ruins = create_region("(Chozo Ruins) West Chozo Ruins", regions, world)
    upper_west_ruins = create_region("(Chozo Ruins) Upper West Chozo Ruins", regions, world)
    ruined_shrine = create_region("(Chozo Ruins) Ruined Shrine", regions, world)
    central_ruins = create_region("(Chozo Ruins) Central Ruins", regions, world)
    past_ruins_magma_pool = create_region("(Chozo Ruins) Past the Magma Pool", regions, world)
    arboretum = create_region("(Chozo Ruins) Arboretum", regions, world)
    gathering_hall = create_region("(Chozo Ruins) Gathering Hall", regions, world)
    dynamo = create_region("(Chozo Ruins) Dynamo", regions, world)
    energy_core = create_region("(Chozo Ruins) Energy Core", regions, world)
    furnace = create_region("(Chozo Ruins) Furnace", regions, world)
    upper_furnace = create_region("(Chozo Ruins) Upper Furnace", regions, world)
    crossway = create_region("(Chozo Ruins) Crossway", regions, world)
    elder_hall = create_region("(Chozo Ruins) Hall of the Elders", regions, world)
    lower_reflecting_pool = create_region("(Chozo Ruins) Lower Reflecting Pool", regions, world)
    upper_reflecting_pool = create_region("(Chozo Ruins) Upper Reflecting Pool", regions, world)
    tower_of_light = create_region("(Chozo Ruins) Tower of Light", regions, world)
    sun_tower_and_flaahgra = create_region("(Chozo Ruins) Sun Tower and Flaahgra", regions, world)

    # Magmoor Caverns
    east_magmoor = create_region("(Magmoor Caverns) East Magmoor", regions, world)
    central_magmoor = create_region("(Magmoor Caverns) Central Magmoor", regions, world)
    central_magmoor_elevator = create_region("(Magmoor Caverns) Central Magmoor Elevator", regions, world)
    geothermal_core = create_region("(Magmoor Caverns) Geothermal Core", regions, world)
    west_magmoor = create_region("(Magmoor Caverns) West Magmoor", regions, world)

    # Phendrana Drifts
    east_phendrana = create_region("(Phendrana Drifts) East Phendrana", regions, world)
    west_phendrana_elevator = create_region("(Phendrana Drifts) West Phendrana Elevator", regions, world)

    # Phazon Mines
    west_phazon_mines_elevator = create_region("(Phazon Mines) West Phazon Mines Elevator", regions, world)

    world.multiworld.regions += regions

    # Connect regions

    _ = landing_site.connect(artifact_temple)
    _ = landing_site.connect(west_tallon, "Landing Site to West Tallon")
    _ = landing_site.connect(crash_site_left, "Landing Site to Crash Site")
    # Elevator
    _ = landing_site.connect(west_ruins)

    _ = crash_site_left.connect(crash_site_right, "Crash Site Left to Right")

    _ = crash_site_right.connect(inside_frigate, "Crash Site Right to Frigate")
    _ = crash_site_right.connect(overgrown_cavern, "Crash Site Right to Overgrown Cavern")

    _ = overgrown_cavern.connect(upper_reflecting_pool, "Overgrown Cavern to Upper Reflecting Pool")

    _ = inside_frigate.connect(east_tallon, "Inside Frigate to East Tallon")

    _ = east_tallon.connect(gated_east_tallon, "East Tallon to Gated East Tallon")
    _ = east_tallon.connect(upper_reflecting_pool, "East Tallon to Upper Reflecting Pool")

    _ = west_tallon.connect(central_magmoor_elevator)
    
    _ = gated_east_tallon.connect(life_grove, "Gated East Tallon to Life Grove")

    _ = west_ruins.connect(upper_west_ruins, "West Ruins to Upper West Ruins")
    _ = west_ruins.connect(central_ruins, "West Ruins to Central Ruins")
    _ = west_ruins.connect(ruined_shrine, "West Ruins to Ruined Shrine")

    _ = upper_west_ruins.connect(sun_tower_and_flaahgra, "Upper West Ruins to Flaahgra")
    _ = upper_west_ruins.connect(east_magmoor)

    _ = ruined_shrine.connect(tower_of_light, "Ruined Shrine to Tower of Light")

    _ = central_ruins.connect(past_ruins_magma_pool, "Central Ruins to Past Magma Pool")
    _ = central_ruins.connect(arboretum, "Central Ruins to Arboretum")

    _ = arboretum.connect(gathering_hall, "Arboretum to Gathering Hall")
    _ = arboretum.connect(sun_tower_and_flaahgra, "Arboretum to Flaahgra")

    _ = gathering_hall.connect(dynamo, "Gathering Hall to Dynamo")
    _ = gathering_hall.connect(energy_core, "Gathering Hall to Energy Core")

    _ = energy_core.connect(furnace, "Energy Core to Furnace")

    _ = furnace.connect(upper_furnace, "Furnace to Upper Furnace")

    _ = upper_furnace.connect(crossway, "Upper Furnace to Crossway")
    _ = upper_furnace.connect(elder_hall, "Upper Furnace to Elder Hall")

    _ = crossway.connect(elder_hall, "Crossway to Elder Hall")

    _ = elder_hall.connect(lower_reflecting_pool, "Elder Hall to Lower Reflecting Pool")

    _ = lower_reflecting_pool.connect(upper_reflecting_pool, "Lower Pool to Upper Pool")

    _ = upper_reflecting_pool.connect(overgrown_cavern, "Upper Reflecting Pool to Overgrown Cavern")
    _ = upper_reflecting_pool.connect(east_tallon, "Upper Reflecting Pool to East Tallon")

    _ = east_magmoor.connect(upper_west_ruins)
    _ = east_magmoor.connect(central_magmoor, "East Magmoor to Central Magmoor")

    _ = central_magmoor.connect(east_magmoor, "Central Magmoor to East Magmoor")
    _ = central_magmoor.connect(east_phendrana, "Central Magmoor to East Phendrana")
    _ = central_magmoor.connect(central_magmoor_elevator, "Central Magmoor to Central Elevator")

    _ = central_magmoor_elevator.connect(central_magmoor, "Central Elevator to Central Magmoor")
    _ = central_magmoor_elevator.connect(west_tallon)
    _ = central_magmoor_elevator.connect(geothermal_core, "Central Elevator to Geothermal Core")

    _ = geothermal_core.connect(central_magmoor_elevator, "Geothermal Core to Central Elevator")
    _ = geothermal_core.connect(west_magmoor)

    _ = west_magmoor.connect(geothermal_core, "West Magmoor to Geothermal Core")
    _ = west_magmoor.connect(west_phendrana_elevator, "West Magmoor to West Phendrana")
    _ = west_magmoor.connect(west_phazon_mines_elevator, "West Magmoor to West Phazon")

    _ = west_phendrana_elevator.connect(west_magmoor, "West Phendrana to West Magmoor")
    # Add events
    create_event(inside_frigate, "Open East Tallon Gate")
    create_event(upper_west_ruins, "Enter Main Plaza From Ledge")
