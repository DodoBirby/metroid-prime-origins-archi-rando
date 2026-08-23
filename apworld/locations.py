from __future__ import annotations
from typing import TYPE_CHECKING, NamedTuple

from BaseClasses import Location

if TYPE_CHECKING:
    from .world import MetroidPrimeOriginsWorld

class LocationData(NamedTuple):
    location_key: str
    region: str

class MetroidPrimeOriginsLocation(Location):
    game = "Metroid Prime Origins"

LOCATION_TABLE: dict[str, LocationData] = {
    "(Chozo Ruins) Sunchamber - Ghost Reward": LocationData("Artifact 4 cho_Sunchamber x320 y224", "(Chozo Ruins) Sun Tower and Flaahgra"),
    "(Chozo Ruins) Sunchamber - Flaahgra Reward": LocationData("Varia Suit cho_Sunchamber x56 y320", "(Chozo Ruins) Sun Tower and Flaahgra"),
    "(Chozo Ruins) Elder Chamber": LocationData("Artifact 10 cho_Elder_Chamber x152 y72", "(Chozo Ruins) Hall of the Elders"),
    "(Chozo Ruins) Hall of the Elders - Ceiling": LocationData("Energy Tanks Max cho_Hall_of_the_Elders x384 y32", "(Chozo Ruins) Hall of the Elders"),
    "(Chozo Ruins) Ruined Shrine - Bug Fight Reward": LocationData("Morph Ball cho_Ruined_Shrine x672 y128", "(Chozo Ruins) Ruined Shrine"),
    "(Chozo Ruins) Watery Hall - Top": LocationData("Charge Beam cho_Watery_Hall x480 y104", "(Chozo Ruins) Gathering Hall"),
    "(Chozo Ruins) Antechamber": LocationData("Ice Beam cho_Antechamber x152 y176", "(Chozo Ruins) Upper Reflecting Pool"),
    "(Chozo Ruins) Tower Chamber": LocationData("Artifact 5 cho_Tower_Chamber x160 y112", "(Chozo Ruins) Tower of Light"),
    "(Chozo Ruins) Tower of Light": LocationData("Wavebuster cho_Tower_of_Light x151 y65", "(Chozo Ruins) Tower of Light"),
    "(Chozo Ruins) Furnace - Chamber": LocationData("Energy Tanks Max cho_Furnace_subC x160 y112", "(Chozo Ruins) Furnace"),
    "(Chozo Ruins) Furnace - Boost Ceiling": LocationData("Missiles Max cho_Furnace_subD x288 y32", "(Chozo Ruins) Upper Furnace"),
    "(Chozo Ruins) Burn Dome - Fight Reward": LocationData("Morph Ball Bomb cho_Burn_Dome x152 y160", "(Chozo Ruins) Energy Core"),
    "(Chozo Ruins) Burn Dome - Back Room": LocationData("Missiles Max cho_Burn_Dome_subB x208 y112", "(Chozo Ruins) Energy Core"),
    "(Chozo Ruins) Crossway": LocationData("Missiles Max cho_Crossway x16 y48", "(Chozo Ruins) Crossway"),
    "(Chozo Ruins) Dynamo - Top": LocationData("Missiles Max cho_Dynamo x224 y32", "(Chozo Ruins) Dynamo"),
    "(Chozo Ruins) Dynamo - Bottom": LocationData("Missiles Max cho_Dynamo x272 y368", "(Chozo Ruins) Dynamo"),
    "(Chozo Ruins) Gathering Hall": LocationData("Missiles Max cho_Gathering_Hall x280 y24", "(Chozo Ruins) Gathering Hall"),
    "(Chozo Ruins) Transport Access North": LocationData("Energy Tanks Max cho_Transport_Access_North x152 y134", "(Chozo Ruins) West Chozo Ruins"),
    "(Chozo Ruins) Hive Totem": LocationData("Missiles Max cho_Hive_Totem x152 y144", "(Chozo Ruins) West Chozo Ruins"),
    "(Chozo Ruins) Main Plaza - Lower Ledge": LocationData("Energy Tanks Max cho_Main_Plaza x104 y256", "(Chozo Ruins) West Chozo Ruins"),
    "(Chozo Ruins) Main Plaza - Boost Ball Ramp": LocationData("Missiles Max cho_Main_Plaza x120 y520", "(Chozo Ruins) West Chozo Ruins"),
    "(Chozo Ruins) Main Plaza - Super Missile Blocks": LocationData("Missiles Max cho_Main_Plaza x584 y456", "(Chozo Ruins) West Chozo Ruins"),
    "(Chozo Ruins) Main Plaza - Top Ledge": LocationData("Missiles Max cho_Main_Plaza x64 y80", "(Chozo Ruins) West Chozo Ruins"),
    "(Chozo Ruins) Ruined Gallery - Left Wall": LocationData("Missiles Max cho_Ruined_Gallery x48 y336", "(Chozo Ruins) West Chozo Ruins"),
    "(Chozo Ruins) Ruined Gallery - Right Tunnel": LocationData("Missiles Max cho_Ruined_Gallery x592 y248", "(Chozo Ruins) West Chozo Ruins"),
    "(Chozo Ruins) Ruined Nursery": LocationData("Missiles Max cho_Ruined_Nursery x352 y320", "(Chozo Ruins) West Chozo Ruins"),
    "(Chozo Ruins) Ruined Fountain": LocationData("Missiles Max cho_Ruined_Fountain x576 y160", "(Chozo Ruins) Central Ruins"),
    "(Chozo Ruins) Ruined Shrine - Ceiling": LocationData("Missiles Max cho_Ruined_Shrine x272 y32", "(Chozo Ruins) Ruined Shrine"),
    "(Chozo Ruins) Ruined Shrine - Tunnel": LocationData("Missiles Max cho_Ruined_Shrine x904 y168", "(Chozo Ruins) Ruined Shrine"),
    "(Chozo Ruins) Training Chamber": LocationData("Energy Tanks Max cho_Training_Chamber x392 y72", "(Chozo Ruins) Past the Magma Pool"),
    "(Chozo Ruins) Training Chamber Access": LocationData("Missiles Max cho_Training_Chamber_Access x288 y144", "(Chozo Ruins) Past the Magma Pool"),
    "(Chozo Ruins) Magma Pool": LocationData("Power Bombs Max cho_Magma_Pool x584 y168", "(Chozo Ruins) Past the Magma Pool"),
    "(Chozo Ruins) Vault": LocationData("Missiles Max cho_Vault x192 y112", "(Chozo Ruins) Upper West Chozo Ruins"),
    "(Chozo Ruins) Watery Hall - Underwater Tunnel": LocationData("Missiles Max cho_Watery_Hall x560 y288", "(Chozo Ruins) Gathering Hall"),
    "(Chozo Ruins) Watery Hall Access": LocationData("Missiles Max cho_Watery_Hall_Access x151 y135", "(Chozo Ruins) Gathering Hall"),
    "(Magmoor Caverns) Warrior Shrine - Statue": LocationData("Artifact 2 mag_Warrior_Shrine x112 y64"),
    "(Magmoor Caverns) Lava Lake - Rock Spire": LocationData("Artifact 8 mag_Lava_Lake_subC x274 y78"),
    "(Magmoor Caverns) Shore Tunnel - Glass Tube": LocationData("Ice Spreader mag_Shore_Tunnel x152 y148"),
    "(Magmoor Caverns) Plasma Processing": LocationData("Plasma Beam mag_Plasma_Processing x192 y128"),
    "(Magmoor Caverns) Magmoor Workstation": LocationData("Energy Tanks Max mag_Magmoor_Workstation x568 y377"),
    "(Magmoor Caverns) Transport Tunnel A": LocationData("Energy Tanks Max mag_Transport_Tunnel_A x160 y48"),
    "(Magmoor Caverns) Fiery Shores - Top Left": LocationData("Missiles Max mag_Fiery_Shores x48 y64"),
    "(Magmoor Caverns) Fiery Shores - from Warrior Shrine": LocationData("Power Bombs Max mag_Fiery_Shores x576 y32"),
    "(Magmoor Caverns) Storage Cavern": LocationData("Missiles Max mag_Storage_Cavern x48 y80"),
    "(Magmoor Caverns) Triclops Pit": LocationData("Missiles Max mag_Triclops_Pit x512 y64"),
    "(Phazon Mines) Elite Research - Elite Fight Reward": LocationData("Artifact 6 pha_Elite_Research x112 y96"),
    "(Phazon Mines) Elite Research - Stone Block": LocationData("Missiles Max pha_Elite_Research_subB x128 y32"),
    "(Phazon Mines) Phazon Mining Tunnel": LocationData("Artifact 12 pha_Phazon_Mining_Tunnel x104 y347"),
    "(Phazon Mines) Storage Depot A": LocationData("Incinerator pha_Storage_Depot_A x160 y120"),
    "(Phazon Mines) Storage Depot B": LocationData("Grapple Beam pha_Storage_Depot_B x208 y139"),
    "(Phazon Mines) Elite Quarters - Omega Pirate Fight Reward": LocationData("Phazon Suit pha_Elite_Quarters x320 y352"),
    "(Phazon Mines) Processing Center Access": LocationData("Energy Tanks Max pha_Processing_Center_Access x72 y120"),
    "(Phazon Mines) Ventilation Shaft": LocationData("Energy Tanks Max pha_Ventilation_Shaft x152 y352"),
    "(Phazon Mines) Elite Control Access": LocationData("Missiles Max pha_Elite_Control_Access x224 y48"),
    "(Phazon Mines) Fungal Hall Access": LocationData("Missiles Max pha_Fungal_Hall_Access x208 y400"),
    "(Phazon Mines) Fungal Hall B": LocationData("Missiles Max pha_Fungal_Hall_B x912 y240"),
    "(Phazon Mines) Main Quarry": LocationData("Missiles Max pha_Main_Quarry x592 y48"),
    "(Phazon Mines) Metroid Quarantine A": LocationData("Missiles Max pha_Metroid_Quarantine_A x512 y48"),
    "(Phazon Mines) Metroid Quarantine B": LocationData("Missiles Max pha_Metroid_Quarantine_B x888 y304"),
    "(Phazon Mines) Phazon Processing Center": LocationData("Missiles Max pha_Phazon_Processing_Center x568 y632"),
    "(Phazon Mines) Security Access A": LocationData("Missiles Max pha_Security_Access_A x192 y176"),
    "(Phazon Mines) Central Dynamo": LocationData("Power Bombs Max pha_Central_Dynamo x312 y296"),
    "(Phendrana Drifts) Control Tower": LocationData("Artifact 3 phe_Control_Tower_subC x240 y128"),
    "(Phendrana Drifts) Chozo Ice Temple - Frozen Floor": LocationData("Artifact 9 phe_Chozo_Ice_Temple_subD x168 y152"),
    "(Phendrana Drifts) Storage Cave": LocationData("Artifact 11 phe_Storage_Cave x184 y120"),
    "(Phendrana Drifts) Quarantine Cave - Thardus Reward": LocationData("Spider Ball phe_Quarantine_Cave x320 y298.67"),
    "(Phendrana Drifts) Phendrana Canyon": LocationData("Boost Ball phe_Phendrana_Canyon_subB x144 y112"),
    "(Phendrana Drifts) Research Core": LocationData("Spazer phe_Research_Core x160 y552"),
    "(Phendrana Drifts) Chapel of the Elders": LocationData("Wave Beam phe_Chapel_of_the_Elders_subB x144 y136"),
    "(Phendrana Drifts) Gravity Chamber": LocationData("Gravity Suit phe_Gravity_Chamber x80 y96"),
    "(Phendrana Drifts) Observatory": LocationData("Super Missile phe_Observatory x304 y56"),
    "(Phendrana Drifts) Research Lab Aether - Display Case": LocationData("Energy Tanks Max phe_Research_Lab_Aether_subB x169 y144"),
    "(Phendrana Drifts) Research Lab Aether - Hidden Passage": LocationData("Missiles Max phe_Research_Lab_Aether x352 y192"),
    "(Phendrana Drifts) Ruined Courtyard": LocationData("Energy Tanks Max phe_Ruined_Courtyard x16 y400"),
    "(Phendrana Drifts) Transport Access": LocationData("Energy Tanks Max phe_Transport_Access x160 y160"),
    "(Phendrana Drifts) Frost Cave": LocationData("Missiles Max phe_Frost_Cave x296 y392"),
    "(Phendrana Drifts) Gravity Chamber - Spike Tunnel": LocationData("Missiles Max phe_Gravity_Chamber_subB x56 y32"),
    "(Phendrana Drifts) Ice Ruins East - Tunnel": LocationData("Missiles Max phe_Ice_Ruins_East x16 y32"),
    "(Phendrana Drifts) Ice Ruins East - Ice Cube": LocationData("Missiles Max phe_Ice_Ruins_East x368 y256"),
    "(Phendrana Drifts) Phendrana Shorelines - Underwater Ice Cube": LocationData("Missiles Max phe_Phendrana_Shorelines_subB x112 y832"),
    "(Phendrana Drifts) Phendrana Shorelines - Hidden Tunnel": LocationData("Missiles Max phe_Phendrana_Shorelines_subB x544 y256"),
    "(Phendrana Drifts) Quarantine Monitor": LocationData("Missiles Max phe_Quarantine_Monitor x184 y128"),
    "(Phendrana Drifts) Research Lab Hydra": LocationData("Missiles Max phe_Research_Lab_Hydra_subB x376 y160"),
    "(Phendrana Drifts) Ice Ruins West": LocationData("Power Bombs Max phe_Ice_Ruins_West x360 y248"),
    "(Phendrana Drifts) Security Cave": LocationData("Power Bombs Max phe_Security_Cave x168 y120"),
    "(Tallon Overworld) Cipher Site - Podium": LocationData("Artifact 1 tal_Cipher_Site x288 y371", "(Tallon Overworld) Artifact Temple"),
    "(Tallon Overworld) Life Grove - Lake": LocationData("Artifact 7 tal_Life_Grove x488 y320", "(Tallon Overworld) Life Grove"),
    "(Tallon Overworld) Life Grove - Cave": LocationData("Screw Attack tal_Life_Grove x72 y344", "(Tallon Overworld) Life Grove"),
    "(Tallon Overworld) Life Grove Tunnel": LocationData("Missiles Max tal_Life_Grove_Tunnel x304 y96", "(Tallon Overworld) Life Grove"),
    "(Tallon Overworld) Cargo Freight Lift to Deck Gamma": LocationData("Energy Tanks Max tal_Cargo_Freight_Lift_to_Deck_Gamma x233 y124", "(Tallon Overworld) Inside Frigate"),
    "(Tallon Overworld) Hydro Access Tunnel": LocationData("Energy Tanks Max tal_Hydro_Access_Tunnel x576 y144", "(Tallon Overworld) Inside Frigate"),
    "(Tallon Overworld) Biohazard Containment": LocationData("Missiles Max tal_Biohazard_Containment x265 y384", "(Tallon Overworld) Inside Frigate"),
    "(Tallon Overworld) Arbor Chamber": LocationData("Missiles Max tal_Arbor_Chamber x144 y80", "(Tallon Overworld) West Tallon"),
    "(Tallon Overworld) Root Cave": LocationData("Missiles Max tal_Root_Cave x48 y208", "(Tallon Overworld) West Tallon"),
    "(Tallon Overworld) Transport Tunnel B": LocationData("Missiles Max tal_Transport_Tunnel_B x152 y160", "(Tallon Overworld) West Tallon"),
    "(Tallon Overworld) Crash Site - Underwater Ledge": LocationData("Missiles Max tal_Crash_Site x616 y296", "(Tallon Overworld) Crash Site Left of Lake"),
    "(Tallon Overworld) Great Tree Chamber": LocationData("Missiles Max tal_Great_Tree_Chamber x152 y136", "(Tallon Overworld) Gated East Tallon"),
    "(Tallon Overworld) Alcove - Above Landing Site": LocationData("Space Jump Boots tal_Alcove x224 y128", "(Tallon Overworld) Landing Site"),
    "(Tallon Overworld) Landing Site - Grass": LocationData("Missiles Max tal_Landing_Site x800 y528", "(Tallon Overworld) Landing Site"),
    "(Tallon Overworld) Overgrown Cavern": LocationData("Missiles Max tal_Overgrown_Cavern x144 y128", "(Tallon Overworld) Overgrown Cavern"),
}

LOCATION_NAME_TO_ID = { name: i + 1 for i, name in enumerate(LOCATION_TABLE.keys()) }

def get_location_names_with_ids(location_names: list[str]):
    return { name: LOCATION_NAME_TO_ID[name] for name in location_names }

def create_locations(world: MetroidPrimeOriginsWorld):
    locations_by_region: dict[str, list[str]] = {}
    for name, data in LOCATION_TABLE.items():
        locations_by_region.setdefault(data.region, []).append(name)
    for region, locations in locations_by_region.items():
        world_region = world.get_region(region)
        world_region.add_locations(get_location_names_with_ids(locations), MetroidPrimeOriginsLocation)
