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
    phendrana_shorelines = create_region("(Phendrana Drifts) Shorelines", regions, world)
    ice_temple = create_region("(Phendrana Drifts) Ice Temple", regions, world)
    central_phendrana = create_region("(Phendrana Drifts) Central Phendrana", regions, world)
    thardus_area = create_region("(Phendrana Drifts) Thardus Area", regions, world)
    research_lab_hydra = create_region("(Phendrana Drifts) Research Lab Hydra", regions, world)
    top_observatory = create_region("(Phendrana Drifts) Top Observatory", regions, world)
    research_lab_aether = create_region("(Phendrana Drifts) Research Lab Aether", regions, world)
    research_core = create_region("(Phendrana Drifts) Research Core", regions, world)
    phendrana_edge_upper = create_region("(Phendrana Drifts) Phendrana Edge Upper", regions, world)
    phendrana_edge_lower = create_region("(Phendrana Drifts) Phendrana Edge Lower", regions, world)
    frost_cave = create_region("(Phendrana Drifts) Frost Cave", regions, world)
    true_phendrana_edge = create_region("(Phendrana Drifts) True Edge", regions, world)
    hunter_cave = create_region("(Phendrana Drifts) Hunter Cave", regions, world)

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

    _ = east_phendrana.connect(central_magmoor, "East Phendrana to Central Magmoor")
    _ = east_phendrana.connect(phendrana_shorelines, "East Phendrana to Shorelines")

    _ = west_phendrana_elevator.connect(west_magmoor, "West Phendrana to West Magmoor")
    _ = west_phendrana_elevator.connect(thardus_area, "West Phendrana to Thardus Area")
    _ = west_phendrana_elevator.connect(phendrana_edge_lower, "West Phendrana Elevator to Edge Lower")

    _ = phendrana_shorelines.connect(ice_temple, "Shorelines to Ice Temple")
    _ = phendrana_shorelines.connect(central_phendrana, "Shorelines to Central Phendrana")

    _ = west_phazon_mines_elevator.connect(west_magmoor, "West Phazon to West Magmoor")

    _ = central_phendrana.connect(thardus_area, "Central Phendrana to Thardus Area")
    _ = central_phendrana.connect(research_lab_hydra, "Central Phendrana to Research Lab Hydra")

    _ = thardus_area.connect(west_phendrana_elevator, "Thardus Area to West Phendrana Elevator")
    _ = thardus_area.connect(central_phendrana, "Thardus Area to Central Phendrana")

    _ = research_lab_hydra.connect(top_observatory, "Hydra to Top Observatory")

    _ = top_observatory.connect(research_lab_aether, "Observatory to Aether")

    _ = research_lab_aether.connect(research_core)

    _ = research_core.connect(research_lab_aether, "Core to Aether")
    _ = research_core.connect(phendrana_edge_upper, "Core to Upper Edge")

    _ = phendrana_edge_upper.connect(research_core, "Upper Edge to Core")
    _ = phendrana_edge_upper.connect(phendrana_edge_lower, "Upper Edge to Lower")
    _ = phendrana_edge_upper.connect(frost_cave, "Upper Edge to Frost Cave")

    _ = phendrana_edge_lower.connect(west_phendrana_elevator, "Lower Edge to Elevator")
    _ = phendrana_edge_lower.connect(phendrana_edge_upper, "Lower Edge to Upper")
    _ = phendrana_edge_lower.connect(hunter_cave, "Lower Edge to Hunter Cave")

    _ = frost_cave.connect(true_phendrana_edge, "Frost Cave to True Edge")

    _ = true_phendrana_edge.connect(hunter_cave, "True Edge to Hunter Cave")

    _ = hunter_cave.connect(phendrana_edge_lower, "Hunter Cave to Lower Edge")
    # Add events
    create_event(inside_frigate, "Open East Tallon Gate")
    create_event(upper_west_ruins, "Enter Main Plaza From Ledge")
