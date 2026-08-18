from __future__ import annotations
from typing import TYPE_CHECKING, NamedTuple

from BaseClasses import Location

if TYPE_CHECKING:
    from .world import MetroidPrimeOriginsWorld

class LocationData(NamedTuple):
    location_key: str = "" # TODO: set this for all locations

class MetroidPrimeOriginsLocation(Location):
    game = "Metroid Prime Origins"

LOCATION_TABLE: dict[str, LocationData] = {
    "Dummy1": LocationData(),
    "Dummy2": LocationData(),
    "Dummy3": LocationData(),
}

LOCATION_NAME_TO_ID = { name: i + 1 for i, name in enumerate(LOCATION_TABLE.keys()) }

def get_location_names_with_ids(location_names: list[str]):
    return { name: LOCATION_NAME_TO_ID[name] for name in location_names }

def create_locations(world: MetroidPrimeOriginsWorld):
    overworld = world.get_region("Tallon Overworld")
    overworld.add_locations(get_location_names_with_ids(["Dummy1", "Dummy2", "Dummy3"]), MetroidPrimeOriginsLocation)
