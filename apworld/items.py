from __future__ import annotations
from typing import NamedTuple, TYPE_CHECKING

from BaseClasses import Item, ItemClassification

if TYPE_CHECKING:
    from .world import MetroidPrimeOriginsWorld

class ItemData(NamedTuple):
    classification: ItemClassification
    vanilla_count: int = 1

class MetroidPrimeOriginsItem(Item):
    game = "Metroid Prime Origins"

ITEM_TABLE: dict[str, ItemData] = {
    "Charge Beam": ItemData(ItemClassification.progression),
    "Wave Beam": ItemData(ItemClassification.progression),
    "Ice Beam": ItemData(ItemClassification.progression),
    "Plasma Beam": ItemData(ItemClassification.progression),
    "Spazer": ItemData(ItemClassification.progression),
    "Wavebuster": ItemData(ItemClassification.progression),
    "Ice Spreader": ItemData(ItemClassification.progression),
    "Incinerator": ItemData(ItemClassification.progression),
    "Varia Suit": ItemData(ItemClassification.progression),
    "Gravity Suit": ItemData(ItemClassification.progression),
    "Phazon Suit": ItemData(ItemClassification.progression),
    "Morph Ball": ItemData(ItemClassification.progression),
    "Boost Ball": ItemData(ItemClassification.progression),
    "Space Jump Boots": ItemData(ItemClassification.progression),
    "Screw Attack": ItemData(ItemClassification.progression),
    "Morph Ball Bomb": ItemData(ItemClassification.progression),
    "Spider Ball": ItemData(ItemClassification.progression),
    "Grapple Beam": ItemData(ItemClassification.progression),
    "Super Missile": ItemData(ItemClassification.progression),
    "Artifact of Truth": ItemData(ItemClassification.progression),
    "Artifact of Strength": ItemData(ItemClassification.progression),
    "Artifact of Elder": ItemData(ItemClassification.progression),
    "Artifact of Wild": ItemData(ItemClassification.progression),
    "Artifact of Lifegiver": ItemData(ItemClassification.progression),
    "Artifact of Chozo": ItemData(ItemClassification.progression),
    "Artifact of Warrior": ItemData(ItemClassification.progression),
    "Artifact of Nature": ItemData(ItemClassification.progression),
    "Artifact of Sun": ItemData(ItemClassification.progression),
    "Artifact of World": ItemData(ItemClassification.progression),
    "Artifact of Spirit": ItemData(ItemClassification.progression),
    "Artifact of Newborn": ItemData(ItemClassification.progression),
    "Energy Tank": ItemData(ItemClassification.useful, 14),
    "Power Bomb": ItemData(ItemClassification.progression_deprioritized_skip_balancing, 5),
    "Missile Tank": ItemData(ItemClassification.progression_deprioritized_skip_balancing, 50),
}

ITEM_NAME_TO_ID = { name: i + 1 for i, name in enumerate(ITEM_TABLE.keys()) }

def create_item_with_correct_classification(world: MetroidPrimeOriginsWorld, name: str) -> MetroidPrimeOriginsItem:
    return MetroidPrimeOriginsItem(name, ITEM_TABLE[name].classification, ITEM_NAME_TO_ID[name], world.player)

def add_items_to_multiworld(world: MetroidPrimeOriginsWorld):
    itempool: list[Item] = []
    for name, data in ITEM_TABLE.items():
        for _ in range(data.vanilla_count):
            itempool.append(world.create_item(name))
    assert len(itempool) == len(world.multiworld.get_unfilled_locations(world.player))
    world.multiworld.itempool += itempool
