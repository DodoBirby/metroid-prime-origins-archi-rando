from __future__ import annotations
import base64
import json
import os
from typing import Any
from worlds.AutoWorld import World
from .locations import LOCATION_NAME_TO_ID, LOCATION_TABLE, create_locations
from .items import ITEM_NAME_TO_ID, MetroidPrimeOriginsItem, create_item_with_correct_classification, add_items_to_multiworld
from .regions import create_and_connect_regions
from .rules import set_all_rules
from .options import MPOOptions


#TODO: Clean up and deduplicate this with the one in client
location_name_to_game_key = { location_name: data.location_key for location_name, data in LOCATION_TABLE.items() }

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

    prime_exo_order: list[int] = []
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
                "end_at_ridley",
                "ibj_in_logic",
                "progressive_grapple_beam"
            ),
            "exo_order": self.prime_exo_order,
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
        self.prime_exo_order = [0, 1, 2, 3]
        self.multiworld.random.shuffle(self.prime_exo_order)

    @staticmethod
    def interpret_slot_data(slot_data: dict[str, Any]) -> dict[str, Any]:
        return slot_data

    def get_filler_item_name(self) -> str:
        return "Missile Tank"

    def generate_output(self, output_directory: str) -> None:
        if (self.multiworld.players != 1):
            return
        data = {
            "items": {location_name_to_game_key[location.name]: location.item.name for location in self.multiworld.get_filled_locations(self.player) if location.name in location_name_to_game_key},
            "starter_items": [item.name for item in self.multiworld.precollected_items[self.player]],
            "exo_order": self.prime_exo_order,
            "phazon_hint": self.multiworld.find_item("Phazon Suit", self.player).name,
            "end_at_ridley": self.options.end_at_ridley
        }

        mod_name = self.multiworld.get_out_file_name_base(self.player)
        out_file = os.path.join(output_directory, mod_name + ".mposeed")
        out_string = base64.standard_b64encode(json.dumps(data).encode()).decode()
        with open(out_file, 'w') as f:
            _ = f.write(out_string)
