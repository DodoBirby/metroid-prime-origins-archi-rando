from __future__ import annotations
from typing import Any
from Options import Option
from worlds.AutoWorld import World
from .locations import LOCATION_NAME_TO_ID, create_locations
from .items import ITEM_NAME_TO_ID, MetroidPrimeOriginsItem, create_item_with_correct_classification, add_items_to_multiworld
from .regions import create_and_connect_regions
from .rules import set_all_rules
from .options import MPOOptions

class MetroidPrimeOriginsWorld(World):
    """
    Metroid Prime Origins is a 2d demake of Metroid Prime.
    """
    game = "Metroid Prime Origins"

    location_name_to_id = LOCATION_NAME_TO_ID
    item_name_to_id = ITEM_NAME_TO_ID

    origin_region_name = "(Tallon Overworld) Landing Site"
    topology_present = True

    ut_can_gen_without_yaml = True

    options_dataclass = MPOOptions
    options: MPOOptions

    def create_regions(self) -> None:
        create_and_connect_regions(self)
        create_locations(self)

    def set_rules(self) -> None:
        set_all_rules(self)

    def create_items(self) -> None:
        add_items_to_multiworld(self)
        
        
    def create_item(self, name: str) -> MetroidPrimeOriginsItem:
        return create_item_with_correct_classification(self, name)

    def fill_slot_data(self):
        return {
            "options": self.options.as_dict(
                "end_at_ridley"
            )
        }

    def generate_early(self):
        re_gen_passthrough = getattr(self.multiworld, "re_gen_passthrough", {})
        if re_gen_passthrough and self.game in re_gen_passthrough:
            slot_data: dict[str, Any] = re_gen_passthrough[self.game]

            slot_options: dict[str, Any] = slot_data.get("options", {})
            for key, value in slot_options.items():
                opt = getattr(self.options, key, None)
                if opt is not None:
                    setattr(self.options, key, opt.from_any(value))

    @staticmethod
    def interpret_slot_data(slot_data: dict[str, Any]) -> dict[str, Any]:
        return slot_data

    def get_filler_item_name(self) -> str:
        return "Missile Tank"
