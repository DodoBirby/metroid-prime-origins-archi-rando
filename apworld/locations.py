from __future__ import annotations
from typing import TYPE_CHECKING, NamedTuple

from BaseClasses import Location

if TYPE_CHECKING:
    from .world import MetroidPrimeOriginsWorld

class LocationData(NamedTuple):
    location_key: str

class MetroidPrimeOriginsLocation(Location):
    game = "Metroid Prime Origins"

LOCATION_TABLE: dict[str, LocationData] = {
    "": LocationData("Artifact 1 tal_Cipher_Site x288 y371"),
    "": LocationData("Artifact 2 mag_Warrior_Shrine x112 y64"),
    "": LocationData("Artifact 3 phe_Control_Tower_subC x240 y128"),
    "": LocationData("Artifact 4 cho_Sunchamber x320 y224"),
    "": LocationData("Artifact 5 cho_Tower_Chamber x160 y112"),
    "": LocationData("Artifact 6 pha_Elite_Research x112 y96"),
    "": LocationData("Artifact 7 tal_Life_Grove x488 y320"),
    "": LocationData("Artifact 8 mag_Lava_Lake_subC x274 y78"),
    "": LocationData("Artifact 9 phe_Chozo_Ice_Temple_subD x168 y152"),
    "": LocationData("Artifact 10 cho_Elder_Chamber x152 y72"),
    "": LocationData("Artifact 11 phe_Storage_Cave x184 y120"),
    "": LocationData("Artifact 12 pha_Phazon_Mining_Tunnel x104 y347"),
    "": LocationData("Morph Ball cho_Ruined_Shrine x672 y128"),
    "": LocationData("Morph Ball Bomb cho_Burn_Dome x152 y160"),
    "": LocationData("Spider Ball phe_Quarantine_Cave x320 y298.67"),
    "": LocationData("Boost Ball phe_Phendrana_Canyon_subB x144 y112"),
    "": LocationData("Space Jump Boots tal_Alcove x224 y128"),
    "": LocationData("Grapple Beam pha_Storage_Depot_B x208 y139"),
    "": LocationData("Charge Beam cho_Watery_Hall x480 y104"),
    "": LocationData("Spazer phe_Research_Core x160 y552"),
    "": LocationData("Ice Beam cho_Antechamber x152 y176"),
    "": LocationData("Ice Spreader mag_Shore_Tunnel x152 y148"),
    "": LocationData("Wave Beam phe_Chapel_of_the_Elders_subB x144 y136"),
    "": LocationData("Wavebuster cho_Tower_of_Light x151 y65"),
    "": LocationData("Plasma Beam mag_Plasma_Processing x192 y128"),
    "": LocationData("Incinerator pha_Storage_Depot_A x160 y120"),
    "": LocationData("Varia Suit cho_Sunchamber x56 y320"),
    "": LocationData("Gravity Suit phe_Gravity_Chamber x80 y96"),
    "": LocationData("Phazon Suit pha_Elite_Quarters x320 y352"),
    "": LocationData("Screw Attack tal_Life_Grove x72 y344"),
    "": LocationData("Super Missile phe_Observatory x304 y56"),
    "": LocationData("Energy Tanks Max cho_Furnace_subC x160 y112"),
    "": LocationData("Energy Tanks Max cho_Hall_of_the_Elders x384 y32"),
    "": LocationData("Energy Tanks Max cho_Main_Plaza x104 y256"),
    "": LocationData("Energy Tanks Max cho_Training_Chamber x392 y72"),
    "": LocationData("Energy Tanks Max cho_Transport_Access_North x152 y134"),
    "": LocationData("Energy Tanks Max mag_Magmoor_Workstation x568 y377"),
    "": LocationData("Energy Tanks Max mag_Transport_Tunnel_A x160 y48"),
    "": LocationData("Energy Tanks Max pha_Processing_Center_Access x72 y120"),
    "": LocationData("Energy Tanks Max pha_Ventilation_Shaft x152 y352"),
    "": LocationData("Energy Tanks Max phe_Research_Lab_Aether_subB x169 y144"),
    "": LocationData("Energy Tanks Max phe_Ruined_Courtyard x16 y400"),
    "": LocationData("Energy Tanks Max phe_Transport_Access x160 y160"),
    "": LocationData("Energy Tanks Max tal_Cargo_Freight_Lift_to_Deck_Gamma x233 y124"),
    "": LocationData("Energy Tanks Max tal_Hydro_Access_Tunnel x576 y144"),
    "": LocationData("Missiles Max cho_Burn_Dome_subB x208 y112"),
    "": LocationData("Missiles Max cho_Crossway x16 y48"),
    "": LocationData("Missiles Max cho_Dynamo x224 y32"),
    "": LocationData("Missiles Max cho_Dynamo x272 y368"),
    "": LocationData("Missiles Max cho_Furnace_subD x288 y32"),
    "": LocationData("Missiles Max cho_Gathering_Hall x280 y24"),
    "": LocationData("Missiles Max cho_Hive_Totem x152 y144"),
    "": LocationData("Missiles Max cho_Main_Plaza x120 y520"),
    "": LocationData("Missiles Max cho_Main_Plaza x584 y456"),
    "": LocationData("Missiles Max cho_Main_Plaza x64 y80"),
    "": LocationData("Missiles Max cho_Ruined_Fountain x576 y160"),
    "": LocationData("Missiles Max cho_Ruined_Gallery x48 y336"),
    "": LocationData("Missiles Max cho_Ruined_Gallery x592 y248"),
    "": LocationData("Missiles Max cho_Ruined_Nursery x352 y320"),
    "": LocationData("Missiles Max cho_Ruined_Shrine x272 y32"),
    "": LocationData("Missiles Max cho_Ruined_Shrine x904 y168"),
    "": LocationData("Missiles Max cho_Training_Chamber_Access x288 y144"),
    "": LocationData("Missiles Max cho_Vault x192 y112"),
    "": LocationData("Missiles Max cho_Watery_Hall x560 y288"),
    "": LocationData("Missiles Max cho_Watery_Hall_Access x151 y135"),
    "": LocationData("Missiles Max mag_Fiery_Shores x48 y64"),
    "": LocationData("Missiles Max mag_Storage_Cavern x48 y80"),
    "": LocationData("Missiles Max mag_Triclops_Pit x512 y64"),
    "": LocationData("Missiles Max pha_Elite_Control_Access x224 y48"),
    "": LocationData("Missiles Max pha_Elite_Research_subB x128 y32"),
    "": LocationData("Missiles Max pha_Fungal_Hall_Access x208 y400"),
    "": LocationData("Missiles Max pha_Fungal_Hall_B x912 y240"),
    "": LocationData("Missiles Max pha_Main_Quarry x592 y48"),
    "": LocationData("Missiles Max pha_Metroid_Quarantine_A x512 y48"),
    "": LocationData("Missiles Max pha_Metroid_Quarantine_B x888 y304"),
    "": LocationData("Missiles Max pha_Phazon_Processing_Center x568 y632"),
    "": LocationData("Missiles Max pha_Security_Access_A x192 y176"),
    "": LocationData("Missiles Max phe_Frost_Cave x296 y392"),
    "": LocationData("Missiles Max phe_Gravity_Chamber_subB x56 y32"),
    "": LocationData("Missiles Max phe_Ice_Ruins_East x16 y32"),
    "": LocationData("Missiles Max phe_Ice_Ruins_East x368 y256"),
    "": LocationData("Missiles Max phe_Phendrana_Shorelines_subB x112 y832"),
    "": LocationData("Missiles Max phe_Phendrana_Shorelines_subB x544 y256"),
    "": LocationData("Missiles Max phe_Quarantine_Monitor x184 y128"),
    "": LocationData("Missiles Max phe_Research_Lab_Aether x352 y192"),
    "": LocationData("Missiles Max phe_Research_Lab_Hydra_subB x376 y160"),
    "": LocationData("Missiles Max tal_Arbor_Chamber x144 y80"),
    "": LocationData("Missiles Max tal_Biohazard_Containment x265 y384"),
    "": LocationData("Missiles Max tal_Crash_Site x616 y296"),
    "": LocationData("Missiles Max tal_Great_Tree_Chamber x152 y136"),
    "": LocationData("Missiles Max tal_Landing_Site x800 y528"),
    "": LocationData("Missiles Max tal_Life_Grove_Tunnel x304 y96"),
    "": LocationData("Missiles Max tal_Overgrown_Cavern x144 y128"),
    "": LocationData("Missiles Max tal_Root_Cave x48 y208"),
    "": LocationData("Missiles Max tal_Transport_Tunnel_B x152 y160"),
    "": LocationData("Power Bombs Max cho_Magma_Pool x584 y168"),
    "": LocationData("Power Bombs Max mag_Fiery_Shores x576 y32"),
    "": LocationData("Power Bombs Max pha_Central_Dynamo x312 y296"),
    "": LocationData("Power Bombs Max phe_Ice_Ruins_West x360 y248"),
    "": LocationData("Power Bombs Max phe_Security_Cave x168 y120"),
}

LOCATION_NAME_TO_ID = { name: i + 1 for i, name in enumerate(LOCATION_TABLE.keys()) }

def get_location_names_with_ids(location_names: list[str]):
    return { name: LOCATION_NAME_TO_ID[name] for name in location_names }

def create_locations(world: MetroidPrimeOriginsWorld):
    overworld = world.get_region("Tallon Overworld")
    overworld.add_locations(get_location_names_with_ids(["Dummy1", "Dummy2", "Dummy3"]), MetroidPrimeOriginsLocation)
