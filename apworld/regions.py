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


    world.multiworld.regions += regions

    # Connect regions

    _ = landing_site.connect(artifact_temple)
    _ = landing_site.connect(west_tallon, "Landing Site to West Tallon")
    _ = landing_site.connect(crash_site_left, "Landing Site to Crash Site")

    _ = crash_site_left.connect(crash_site_right, "Crash Site Left to Right")

    _ = crash_site_right.connect(inside_frigate, "Crash Site Right to Frigate")
    _ = crash_site_right.connect(overgrown_cavern, "Crash Site Right to Overgrown Cavern")

    _ = inside_frigate.connect(east_tallon, "Inside Frigate to East Tallon")

    _ = east_tallon.connect(gated_east_tallon, "East Tallon to Gated East Tallon")
    
    _ = gated_east_tallon.connect(life_grove, "Gated East Tallon to Life Grove")

    # Add events
    create_event(inside_frigate, "Open East Tallon Gate")
