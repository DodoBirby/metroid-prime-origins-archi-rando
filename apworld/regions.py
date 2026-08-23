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

    _ = inside_frigate.connect(east_tallon, "Inside Frigate to East Tallon")

    _ = east_tallon.connect(gated_east_tallon, "East Tallon to Gated East Tallon")
    
    _ = gated_east_tallon.connect(life_grove, "Gated East Tallon to Life Grove")

    _ = west_ruins.connect(upper_west_ruins, "West Ruins to Upper West Ruins")
    _ = west_ruins.connect(central_ruins, "West Ruins to Central Ruins")
    _ = west_ruins.connect(ruined_shrine, "West Ruins to Ruined Shrine")

    _ = upper_west_ruins.connect(sun_tower_and_flaahgra, "Upper West Ruins to Flaahgra")

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
    # Add events
    create_event(inside_frigate, "Open East Tallon Gate")
    create_event(upper_west_ruins, "Enter Main Plaza From Ledge")
