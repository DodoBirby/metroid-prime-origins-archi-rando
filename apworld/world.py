from __future__ import annotations
from worlds.AutoWorld import World
from .locations import LOCATION_NAME_TO_ID, create_locations
from .items import ITEM_NAME_TO_ID, MetroidPrimeOriginsItem, create_item_with_correct_classification, add_items_to_multiworld
from .regions import create_and_connect_regions
from .rules import set_all_rules

class MetroidPrimeOriginsWorld(World):
    """
    Metroid Prime Origins is a 2d demake of Metroid Prime.
    """
    game = "Metroid Prime Origins"

    location_name_to_id = LOCATION_NAME_TO_ID
    item_name_to_id = ITEM_NAME_TO_ID

    origin_region_name = "(Tallon Overworld) Landing Site"
    topology_present = True

    def create_regions(self) -> None:
        create_and_connect_regions(self)
        create_locations(self)

    def set_rules(self) -> None:
        set_all_rules(self)

    def create_items(self) -> None:
        add_items_to_multiworld(self)
        
        
    def create_item(self, name: str) -> MetroidPrimeOriginsItem:
        return create_item_with_correct_classification(self, name)

    def get_filler_item_name(self) -> str:
        return "Missile Tank"
