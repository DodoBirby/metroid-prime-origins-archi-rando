from __future__ import annotations

import math

from typing import NamedTuple, TYPE_CHECKING

from BaseClasses import Item, ItemClassification

if TYPE_CHECKING:
    from .world import MetroidPrimeOriginsWorld

class ItemData(NamedTuple):
    classification: ItemClassification
    vanilla_count: int = 1
    # Used for items that are partially progression and partially not progression
    progression_count: int = 0
    progression_classification: ItemClassification = ItemClassification.progression_skip_balancing

class MetroidPrimeOriginsItem(Item):
    game = "Metroid Prime Origins"

ITEM_TABLE: dict[str, ItemData] = {
    "Charge Beam": ItemData(ItemClassification.progression),
    "Wave Beam": ItemData(ItemClassification.progression),
    "Ice Beam": ItemData(ItemClassification.progression),
    "Plasma Beam": ItemData(ItemClassification.progression),
    "Spazer": ItemData(ItemClassification.useful),
    "Wavebuster": ItemData(ItemClassification.useful),
    "Ice Spreader": ItemData(ItemClassification.useful),
    "Incinerator": ItemData(ItemClassification.useful),
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
    "Energy Tank": ItemData(ItemClassification.useful, 14, 4),
    "Power Bomb": ItemData(ItemClassification.useful, 5, 2, ItemClassification.progression_deprioritized_skip_balancing),
    "Missile Tank": ItemData(ItemClassification.filler, 50, 1, ItemClassification.progression_deprioritized_skip_balancing),
}

ITEM_NAME_TO_ID = { name: i + 1 for i, name in enumerate(ITEM_TABLE.keys()) }

def create_item_with_correct_classification(world: MetroidPrimeOriginsWorld, name: str, force_classification: ItemClassification | None = None) -> MetroidPrimeOriginsItem:
    return MetroidPrimeOriginsItem(name, force_classification if force_classification is not None else ITEM_TABLE[name].classification, ITEM_NAME_TO_ID[name], world.player)

def create_fixed_pool(world: MetroidPrimeOriginsWorld) -> list[Item]:
    itempool: list[Item] = []
    for name, data in ITEM_TABLE.items():
        count = 1 if data.progression_count == 0 else data.progression_count

        for i in range(count):
            if i < data.progression_count:
                itempool.append(create_item_with_correct_classification(world, name, data.progression_classification))
            else:
                itempool.append(world.create_item(name))

    return itempool

def create_filler_items(world: MetroidPrimeOriginsWorld, filler_needed: int) -> list[Item]:
    itempool: list[Item] = []
    energy_tank_count = math.ceil(filler_needed * world.options.energy_tank_filler_percent / 100)
    power_bomb_count = math.ceil(filler_needed * world.options.power_bomb_filler_percent / 100)
    missile_tank_count = filler_needed - energy_tank_count - power_bomb_count
    for _ in range(energy_tank_count):
        itempool.append(world.create_item("Energy Tank"))
    for _ in range(power_bomb_count):
        itempool.append(world.create_item("Power Bomb"))
    for _ in range(missile_tank_count):
        itempool.append(world.create_item("Missile Tank"))
    assert len(itempool) == filler_needed
    return itempool

def add_items_to_multiworld(world: MetroidPrimeOriginsWorld):
    if world.options.use_vanilla_pool:
        itempool: list[Item] = []
        for name, data in ITEM_TABLE.items():
            for i in range(data.vanilla_count):
                if i < data.progression_count:
                    itempool.append(create_item_with_correct_classification(world, name, data.progression_classification))
                else:
                    itempool.append(world.create_item(name))
        assert len(itempool) == len(world.multiworld.get_unfilled_locations(world.player))
    else:
        itempool = create_fixed_pool(world)
        filler_needed = len(itempool) - len(world.multiworld.get_unfilled_locations(world.player))
        itempool += create_filler_items(world, filler_needed)

    world.multiworld.itempool += itempool
