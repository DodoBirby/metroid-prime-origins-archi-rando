from __future__ import annotations
from typing import TYPE_CHECKING
from BaseClasses import Region

if TYPE_CHECKING:
    from .world import MetroidPrimeOriginsWorld

def create_and_connect_regions(world: MetroidPrimeOriginsWorld):
    create_regions(world)

def create_regions(world: MetroidPrimeOriginsWorld):
    tallon_overworld = Region("Tallon Overworld", world.player, world.multiworld)
    regions = [tallon_overworld]

    world.multiworld.regions += regions
