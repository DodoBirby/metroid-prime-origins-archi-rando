from __future__ import annotations

from typing import TYPE_CHECKING, Any

from rule_builder.options import OptionFilter
from rule_builder.rules import CanReachRegion, Has, Rule

from .options import EndAtRidley, IBJInLogic

if TYPE_CHECKING:
    from .world import MetroidPrimeOriginsWorld

# Constants for anti-typo
MORPH = "Morph Ball"
MISSILE = "Missile Tank"

WAVE = "Wave Beam"
PLASMA = "Plasma Beam"
CHARGE = "Charge Beam"
ICE = "Ice Beam"

VARIA = "Varia Suit"
GRAVITY = "Gravity Suit"
PHAZON = "Phazon Suit"

SPACEJUMP = "Space Jump Boots"
GRAPPLE = "Grapple Beam"
SCREW = "Screw Attack"

CAN_SPIDER = Has("Spider Ball") & Has(MORPH)
CAN_IBJ = Has(MORPH) & Has("Morph Ball Bomb") & OptionFilter(IBJInLogic, True)
CAN_BOMB = Has(MORPH) & Has("Morph Ball Bomb")
CAN_SUPER_MISSILE = Has(MISSILE) & Has("Super Missile")
CAN_BOOST = Has(MORPH) & Has("Boost Ball")
CAN_PB = Has(MORPH) & Has("Power Bomb")
CAN_DESTROY_BOMB_BLOCKS = CAN_BOMB | CAN_PB | Has(SCREW)
CAN_DESTROY_BLOCKS_WHILE_MORPHED = CAN_BOMB | CAN_PB
CAN_TRAVERSE_UNDERWATER = Has(GRAVITY) | Has(GRAPPLE)

CAN_DESTROY_GLASS_BLOCK = Has(CHARGE) | Has(MISSILE)

# Frigate requires shooting conduits, traversing underwater ledges, and destroying bomb blocks + glass to reveal conduits
CAN_TRAVERSE_FRIGATE = Has(WAVE) & CAN_DESTROY_BLOCKS_WHILE_MORPHED & Has(MISSILE) & CAN_TRAVERSE_UNDERWATER

# This rule should be used for overhangs where you can't swwj but you can get through with vertical movement or climbing up the side
CAN_TRAVERSE_LOW_OVERHANG = Has(SPACEJUMP) | CAN_SPIDER | Has(GRAPPLE) | CAN_IBJ
CAN_TRAVERSE_HIGH_OVERHANG = Has(GRAPPLE) | CAN_SPIDER | CAN_IBJ

CAN_BEAT_THARDUS = Has("Energy Tank", 2) & Has(CHARGE)

CAN_BEAT_CRATER = Has("Energy Tank", 4) & Has(WAVE) & Has(PLASMA) & Has(ICE) & Has(CHARGE) & Has(PHAZON) & Has(GRAPPLE) & CAN_DESTROY_BLOCKS_WHILE_MORPHED & Has(MORPH) & Has(MISSILE)
# This is possibly too difficult as a base setting, open to changing it
CAN_BEAT_RIDLEY = Has("Energy Tank", 4) & Has(CHARGE) & Has(PLASMA)

CAN_BEAT_ENDGAME = OptionFilter(EndAtRidley, False) & CAN_BEAT_CRATER | OptionFilter(EndAtRidley, True) & CAN_BEAT_RIDLEY
def set_location_rule(name: str, rule: Rule[Any], world: MetroidPrimeOriginsWorld):
    world.set_rule(world.get_location(name), rule)

def set_entrance_rule(name: str, rule: Rule[Any], world: MetroidPrimeOriginsWorld):
    world.set_rule(world.get_entrance(name), rule)

def set_all_rules(world: MetroidPrimeOriginsWorld):
    set_region_connection_rules(world)
    set_location_rules(world)
    set_completion_rule(world)

def set_tallon_location_rules(world: MetroidPrimeOriginsWorld):
    # Life Grove
    set_location_rule("(Tallon Overworld) Life Grove - Lake", CAN_BOOST & CAN_DESTROY_BOMB_BLOCKS & (Has(SCREW) | CAN_PB), world)
    set_location_rule("(Tallon Overworld) Life Grove Tunnel", CAN_BOOST & CAN_DESTROY_BLOCKS_WHILE_MORPHED, world)

    # Inside Frigate
    set_location_rule("(Tallon Overworld) Cargo Freight Lift to Deck Gamma", Has(MISSILE), world)
    set_location_rule("(Tallon Overworld) Hydro Access Tunnel", CAN_BOOST, world)
    set_location_rule("(Tallon Overworld) Biohazard Containment", CAN_SUPER_MISSILE, world)
    set_location_rule("Open East Tallon Gate", CAN_BOOST, world)

    # West Tallon
    set_location_rule("(Tallon Overworld) Arbor Chamber", Has(PLASMA) & CAN_TRAVERSE_LOW_OVERHANG, world)

    # Crash Site Left
    set_location_rule("(Tallon Overworld) Crash Site - Underwater Ledge", (Has(GRAVITY) & CAN_TRAVERSE_LOW_OVERHANG) | Has(GRAPPLE), world)

    # Gated East Tallon
    set_location_rule("(Tallon Overworld) Great Tree Chamber", Has(SCREW), world)

    # Overgrown Cavern
    set_location_rule("(Tallon Overworld) Overgrown Cavern", Has(MORPH), world)

    # Artifact Temple
    set_location_rule("Victory", Has("Kill Flaahgra") & Has("Kill Thardus") & Has("Kill Omega Pirate") & CAN_BEAT_ENDGAME, world)

    # Landing Site
    set_location_rule("(Tallon Overworld) Landing Site - Grass", Has(MORPH), world)

def set_chozo_ruins_location_rules(world: MetroidPrimeOriginsWorld):
    # West Chozo Ruins
    set_location_rule("(Chozo Ruins) Main Plaza - Super Missile Blocks", Has(MISSILE) & CAN_TRAVERSE_LOW_OVERHANG, world)
    set_location_rule("(Chozo Ruins) Main Plaza - Boost Ball Ramp", CAN_BOOST | Has(SPACEJUMP), world)
    set_location_rule("(Chozo Ruins) Main Plaza - Lower Ledge", CAN_TRAVERSE_LOW_OVERHANG | CanReachRegion("(Chozo Ruins) Vault"), world)
    set_location_rule("(Chozo Ruins) Main Plaza - Top Ledge", Has(GRAPPLE) | CAN_IBJ, world)
    set_location_rule("(Chozo Ruins) Ruined Nursery", CAN_DESTROY_BLOCKS_WHILE_MORPHED & Has(MORPH), world)
    set_location_rule("(Chozo Ruins) Ruined Gallery - Right Tunnel", Has(MORPH), world)
    set_location_rule("(Chozo Ruins) Ruined Gallery - Left Wall", Has(MISSILE), world)
    set_location_rule("(Chozo Ruins) Transport Access North", Has(MISSILE), world)

    # Vault
    set_location_rule("(Chozo Ruins) Vault", CAN_BOMB & Has(MORPH), world)

    # Central Ruins
    set_location_rule("(Chozo Ruins) Ruined Fountain", CAN_BOOST | CAN_SPIDER | CAN_IBJ, world)

    # Gathering Hall
    set_location_rule("(Chozo Ruins) Watery Hall Access", Has(MISSILE), world)
    set_location_rule("(Chozo Ruins) Watery Hall - Top", Has(MISSILE), world)
    set_location_rule("(Chozo Ruins) Watery Hall - Underwater Tunnel", Has(MISSILE) & CAN_TRAVERSE_UNDERWATER, world)
    set_location_rule("(Chozo Ruins) Gathering Hall", Has(MORPH) & CAN_DESTROY_BOMB_BLOCKS, world)

    # Dynamo
    set_location_rule("(Chozo Ruins) Dynamo - Bottom", Has(MISSILE), world)
    set_location_rule("(Chozo Ruins) Dynamo - Top", CAN_TRAVERSE_LOW_OVERHANG, world)

    # Energy Core
    set_location_rule("(Chozo Ruins) Burn Dome - Fight Reward", Has(MORPH), world)
    set_location_rule("(Chozo Ruins) Burn Dome - Back Room", Has(MORPH) & CAN_DESTROY_BOMB_BLOCKS, world)

    # Furnace
    set_location_rule("(Chozo Ruins) Furnace - Chamber", Has(MORPH), world)

    # Upper Furnace
    set_location_rule("(Chozo Ruins) Furnace - Boost Ceiling", CAN_BOOST & (CAN_SPIDER | Has(GRAPPLE)) & CAN_DESTROY_BOMB_BLOCKS & CAN_PB, world)

    # Crossway
    set_location_rule("(Chozo Ruins) Crossway", Has(MORPH) & CAN_BOOST & CAN_BOMB, world)

    # Elder Hall
    set_location_rule("(Chozo Ruins) Hall of the Elders - Ceiling", Has(ICE) & CAN_BOMB & CAN_SPIDER, world)
    # TODO: On remix you can use the secret path
    set_location_rule("(Chozo Ruins) Elder Chamber", (Has(PLASMA) & CAN_BOMB), world)

    # Upper Reflecting Pool
    set_location_rule("(Chozo Ruins) Antechamber", Has(MISSILE) & CAN_BOMB, world)

    # Past Magma Pool
    set_location_rule("(Chozo Ruins) Magma Pool", CAN_PB & Has(VARIA), world)
    set_location_rule("(Chozo Ruins) Training Chamber Access", Has(MORPH), world)
    set_location_rule("(Chozo Ruins) Training Chamber", (CAN_BOOST | CAN_TRAVERSE_LOW_OVERHANG) & CAN_BOMB & Has(MORPH) & Has(ICE), world)

    # Ruined Shrine
    set_location_rule("(Chozo Ruins) Ruined Shrine - Ceiling", CAN_BOOST, world)
    set_location_rule("(Chozo Ruins) Ruined Shrine - Tunnel", CAN_DESTROY_BOMB_BLOCKS & Has(MORPH), world)

    # Tower of Light
    set_location_rule("(Chozo Ruins) Tower of Light", Has(MISSILE), world)
    set_location_rule("(Chozo Ruins) Tower Chamber", CAN_TRAVERSE_UNDERWATER & Has(WAVE), world)
    # Intentionally not CAN_SPIDER since this is about triggering the event flag

    # Flaahgra and ghost
    set_location_rule("(Chozo Ruins) Sunchamber - Ghost Reward", (Has("Spider Ball") | Has(ICE)) & Has(CHARGE), world)
    
def set_magmoor_location_rules(world: MetroidPrimeOriginsWorld):
    # East Magmoor
    set_location_rule("(Magmoor Caverns) Lava Lake - Rock Spire", Has(VARIA) & Has(MISSILE), world)

    # Central Magmoor
    set_location_rule("(Magmoor Caverns) Triclops Pit", Has(MISSILE) & Has(VARIA), world)
    set_location_rule("(Magmoor Caverns) Storage Cavern", Has(MORPH) & Has(VARIA), world)
    set_location_rule("(Magmoor Caverns) Transport Tunnel A", Has(MORPH) & Has(VARIA), world)
    set_location_rule("(Magmoor Caverns) Warrior Shrine - Statue", Has(VARIA) & ((CAN_BOOST & CAN_TRAVERSE_LOW_OVERHANG) | CAN_IBJ | Has(GRAPPLE)), world)
    set_location_rule("(Magmoor Caverns) Fiery Shores - from Warrior Shrine", CAN_PB & Has(MORPH) & Has(VARIA) & ((CAN_BOOST & CAN_TRAVERSE_LOW_OVERHANG) | CAN_IBJ | Has(GRAPPLE)), world)
    set_location_rule("(Magmoor Caverns) Shore Tunnel - Glass Tube", Has(VARIA) & CAN_PB, world)

    # Central Magmoor Elevator
    set_location_rule("(Magmoor Caverns) Fiery Shores - Top Left", Has(VARIA) & Has(MORPH), world)

    # Geothermal Core
    set_location_rule("(Magmoor Caverns) Plasma Processing", Has(MORPH) & Has(ICE) & Has(VARIA) & CAN_TRAVERSE_LOW_OVERHANG & CAN_BOOST & CAN_DESTROY_BLOCKS_WHILE_MORPHED & Has(GRAPPLE), world)

    # West Magmoor
    set_location_rule("(Magmoor Caverns) Magmoor Workstation", CAN_BOMB & CAN_SPIDER & Has(WAVE), world)

def set_phendrana_location_rules(world: MetroidPrimeOriginsWorld):
    # Shorelines
    set_location_rule("(Phendrana Drifts) Phendrana Shorelines - Underwater Ice Cube", Has(PLASMA), world)
    set_location_rule("(Phendrana Drifts) Ice Ruins East - Ice Cube", Has(PLASMA), world)
    set_location_rule("(Phendrana Drifts) Ice Ruins East - Tunnel", CAN_BOOST, world)
    set_location_rule("(Phendrana Drifts) Ice Ruins West", Has(PLASMA) & (Has(MISSILE) | CAN_TRAVERSE_LOW_OVERHANG), world)
    set_location_rule("(Phendrana Drifts) Phendrana Canyon", Has(MISSILE), world)
    set_location_rule("(Phendrana Drifts) Phendrana Shorelines - Hidden Tunnel", Has(MISSILE) & Has("Boost Ball"), world)

    # Ice Temple
    set_location_rule("(Phendrana Drifts) Chozo Ice Temple - Frozen Floor", Has(MORPH) & Has(PLASMA), world)
    set_location_rule("(Phendrana Drifts) Chapel of the Elders", Has(MORPH) & CAN_BOMB & Has(MISSILE), world)

    # Central Phendrana
    set_location_rule("(Phendrana Drifts) Ruined Courtyard", (Has(MORPH) & CAN_TRAVERSE_LOW_OVERHANG) | (CAN_BOOST & CAN_BOMB), world)

    # Thardus Area
    set_location_rule("(Phendrana Drifts) Quarantine Cave - Thardus Reward", CAN_TRAVERSE_LOW_OVERHANG, world)
    set_location_rule("(Phendrana Drifts) Quarantine Monitor", Has(MORPH) & (Has(GRAPPLE) | CAN_IBJ), world)

    # Research Lab Hydra
    set_location_rule("(Phendrana Drifts) Research Lab Hydra", CAN_SUPER_MISSILE, world)

    # Research Lab Aether
    set_location_rule("(Phendrana Drifts) Control Tower", Has(MISSILE) & CAN_DESTROY_GLASS_BLOCK & CAN_TRAVERSE_LOW_OVERHANG, world)
    set_location_rule("(Phendrana Drifts) Research Lab Aether - Hidden Passage", Has(MORPH), world)
    set_location_rule("(Phendrana Drifts) Research Lab Aether - Display Case", Has(MISSILE), world)

    # Lower Edge
    set_location_rule("(Phendrana Drifts) Transport Access", Has(PLASMA), world)

    # Frost Cave
    set_location_rule("(Phendrana Drifts) Frost Cave", Has(MISSILE) & (Has(SPACEJUMP) | CAN_IBJ | Has(GRAPPLE)), world)

    # True Edge
    set_location_rule("(Phendrana Drifts) Security Cave", Has(GRAPPLE) & Has(MORPH), world)
    set_location_rule("(Phendrana Drifts) Storage Cave", CAN_PB, world)

    # Hunter Cave
    set_location_rule("(Phendrana Drifts) Gravity Chamber - Spike Tunnel", Has(GRAPPLE), world)
    set_location_rule("(Phendrana Drifts) Gravity Chamber", CAN_TRAVERSE_UNDERWATER | Has(MISSILE) | Has(SPACEJUMP), world)

def set_phazon_location_rules(world: MetroidPrimeOriginsWorld):
    # Entrance
    set_location_rule("(Phazon Mines) Main Quarry", CAN_TRAVERSE_HIGH_OVERHANG & Has(WAVE), world)

    # Corridor to Elite Research
    set_location_rule("(Phazon Mines) Storage Depot A", CAN_PB & Has(PLASMA), world)
    set_location_rule("(Phazon Mines) Security Access A", CAN_PB, world)

    # Elite Research
    set_location_rule("(Phazon Mines) Elite Research - Elite Fight Reward", CAN_PB, world)
    set_location_rule("(Phazon Mines) Elite Research - Stone Block", CAN_BOOST & CAN_TRAVERSE_LOW_OVERHANG, world)

    # Elite Control Access
    set_location_rule("(Phazon Mines) Elite Control Access", Has(MORPH), world)

    # Ventilation Shaft
    set_location_rule("(Phazon Mines) Ventilation Shaft", CAN_PB, world)

    # Metroid Quarantine A
    set_location_rule("(Phazon Mines) Metroid Quarantine A", CAN_TRAVERSE_LOW_OVERHANG & Has(SCREW) & CAN_PB, world)

    # Fungal Hall Access
    set_location_rule("(Phazon Mines) Fungal Hall Access", Has(MORPH) & Has(PHAZON), world)

    # Phazon Mining Tunnel
    set_location_rule("(Phazon Mines) Phazon Mining Tunnel", Has(MORPH) & CAN_DESTROY_BLOCKS_WHILE_MORPHED & Has(PHAZON), world)

    # Fungal Hall B
    set_location_rule("(Phazon Mines) Fungal Hall B", CAN_TRAVERSE_LOW_OVERHANG & CAN_DESTROY_BLOCKS_WHILE_MORPHED, world)

    # Metroid Quarantine B
    set_location_rule("(Phazon Mines) Metroid Quarantine B", CAN_SUPER_MISSILE, world)

    # Phazon Processing Center
    set_location_rule("(Phazon Mines) Phazon Processing Center", CAN_PB, world)

def set_region_connection_rules(world: MetroidPrimeOriginsWorld):
    set_entrance_rule("Landing Site to West Tallon", Has(MISSILE), world)
    set_entrance_rule("Landing Site to Crash Site", Has(MORPH) & Has(MISSILE), world)

    set_entrance_rule("Crash Site Left to Right", Has(GRAPPLE) | (Has(GRAVITY) & Has(MORPH)) | CAN_IBJ | Has(SPACEJUMP), world)
    set_entrance_rule("Crash Site Left to Landing Site", Has(MORPH), world)

    set_entrance_rule("Crash Site Right to Frigate", Has(ICE) & Has(MORPH) & CAN_TRAVERSE_FRIGATE, world)
    set_entrance_rule("Crash Site Right to Overgrown Cavern", CAN_TRAVERSE_LOW_OVERHANG & Has(ICE), world)

    set_entrance_rule("Overgrown Cavern to Upper Reflecting Pool", Has(MORPH) & CAN_DESTROY_BOMB_BLOCKS, world)
    set_entrance_rule("Overgrown Cavern to Crash Site Right", Has(ICE), world)

    set_entrance_rule("Inside Frigate to East Tallon", CAN_TRAVERSE_FRIGATE & CAN_BOOST, world)

    set_entrance_rule("East Tallon to Gated East Tallon", Has("Open East Tallon Gate") | CAN_TRAVERSE_LOW_OVERHANG, world)
    set_entrance_rule("East Tallon to Upper Reflecting Pool", Has(ICE) & CAN_DESTROY_BOMB_BLOCKS, world)

    set_entrance_rule("Gated East Tallon to Life Grove", CAN_TRAVERSE_LOW_OVERHANG & CAN_PB, world)
    set_entrance_rule("Gated East Tallon to Phazon Entrance", Has("Open East Tallon Gate"), world)
    
    set_entrance_rule("West Ruins to Upper West Ruins", Has(MISSILE) & Has(MORPH), world)
    set_entrance_rule("West Ruins to Central Ruins", Has(MORPH), world)
    set_entrance_rule("West Ruins to Ruined Shrine", Has(MISSILE), world)
    set_entrance_rule("West Ruins to Past Magma Pool", Has(GRAPPLE) & Has(MORPH), world)
    set_entrance_rule("West Ruins to Vault", CAN_TRAVERSE_LOW_OVERHANG & Has(WAVE), world)

    set_entrance_rule("Vault to Upper West Ruins", Has(MORPH), world)

    set_entrance_rule("Upper West Ruins to Flaahgra", Has(MISSILE) & CAN_TRAVERSE_HIGH_OVERHANG & CAN_DESTROY_BOMB_BLOCKS, world)
    set_entrance_rule("Upper West Ruins to Vault", Has(MORPH), world)

    set_entrance_rule("Sun Tower to Upper West Ruins", Has(MORPH) & (CAN_BOMB | (CAN_PB & Has("Power Bomb", 2)) | Has(SCREW)), world)

    set_entrance_rule("Ruined Shrine to Tower of Light", Has(WAVE) & (CAN_SPIDER | Has(GRAPPLE)), world)

    # Lenient rule
    set_entrance_rule("Central Ruins to Past Magma Pool", Has(VARIA) & Has(WAVE) & Has(GRAPPLE), world)
    set_entrance_rule("Central Ruins to Arboretum", Has(MISSILE), world)
    set_entrance_rule("Central Ruins to West Ruins", Has(MORPH), world)
    
    set_entrance_rule("Arboretum to Gathering Hall", Has(MISSILE), world)
    set_entrance_rule("Arboretum to Flaahgra", Has(MORPH) & CAN_DESTROY_BOMB_BLOCKS & Has(MISSILE), world)

    set_entrance_rule("Gathering Hall to Dynamo", Has(MISSILE) & Has(MORPH) & CAN_DESTROY_BOMB_BLOCKS, world)
    set_entrance_rule("Gathering Hall to Energy Core", Has(MORPH), world)

    set_entrance_rule("Energy Core to Furnace", CAN_TRAVERSE_LOW_OVERHANG | CAN_BOMB, world)
    set_entrance_rule("Energy Core to Gathering Hall", Has(MORPH), world)

    set_entrance_rule("Furnace to Upper Furnace", Has(MORPH) & CAN_DESTROY_BOMB_BLOCKS & (CAN_SPIDER | Has(GRAPPLE)), world)

    set_entrance_rule("Upper Furnace to Crossway", Has(MORPH), world)
    set_entrance_rule("Upper Furnace to Elder Hall", Has(ICE), world)

    set_entrance_rule("Crossway to Elder Hall", CAN_BOOST & ((Has(ICE) & Has(MORPH)) | Has(MISSILE)), world)

    set_entrance_rule("Elder Hall to Lower Reflecting Pool", Has(WAVE) & CAN_BOMB & CAN_TRAVERSE_LOW_OVERHANG, world)

    set_entrance_rule("Lower Pool to Upper Pool", (CAN_DESTROY_BOMB_BLOCKS & CAN_BOOST) | Has(GRAPPLE) | CAN_IBJ, world)

    set_entrance_rule("Upper Reflecting Pool to Overgrown Cavern", Has(MISSILE) & CAN_BOMB, world)
    set_entrance_rule("Upper Reflecting Pool to East Tallon", CAN_BOMB & Has(ICE), world)

    set_entrance_rule("East Magmoor to Central Magmoor", Has(MORPH) & CAN_DESTROY_BLOCKS_WHILE_MORPHED & Has(VARIA), world)

    set_entrance_rule("Central Magmoor to East Magmoor", Has(MORPH) & CAN_DESTROY_BLOCKS_WHILE_MORPHED & Has(VARIA), world)
    set_entrance_rule("Central Magmoor to East Phendrana", Has(MORPH) & Has(VARIA), world)
    set_entrance_rule("Central Magmoor to Central Elevator", Has(MORPH) & Has(VARIA), world)

    set_entrance_rule("Central Elevator to Central Magmoor", Has(MORPH) & Has(VARIA), world)
    set_entrance_rule("Central Elevator to Geothermal Core", Has(VARIA) & Has(MORPH) & (Has(GRAPPLE) | CAN_SPIDER) & Has(WAVE), world)

    set_entrance_rule("Geothermal Core to Central Elevator", Has(VARIA) & Has(MORPH) & (Has(GRAPPLE) | CAN_SPIDER), world)

    set_entrance_rule("West Magmoor to Geothermal Core", Has(VARIA), world)
    set_entrance_rule("West Magmoor to West Phendrana", Has(VARIA), world)
    set_entrance_rule("West Magmoor to West Phazon", Has(VARIA) & CAN_PB & Has(ICE), world)

    set_entrance_rule("East Phendrana to Central Magmoor", Has(MORPH) & Has(VARIA), world)
    set_entrance_rule("East Phendrana to Shorelines", CAN_DESTROY_GLASS_BLOCK, world)

    set_entrance_rule("West Phendrana to West Magmoor", Has(VARIA), world)
    set_entrance_rule("West Phendrana to Thardus Area", Has(MORPH) & CAN_BEAT_THARDUS, world)
    set_entrance_rule("West Phendrana Elevator to Edge Lower", CAN_TRAVERSE_LOW_OVERHANG & Has(ICE) & Has(MORPH), world)

    set_entrance_rule("Shorelines to Ice Temple", CAN_DESTROY_GLASS_BLOCK & Has("Boost Ball"), world)
    set_entrance_rule("Shorelines to Central Phendrana", CAN_TRAVERSE_LOW_OVERHANG & Has(WAVE), world)
    set_entrance_rule("Shorelines to East Phendrana", CAN_DESTROY_GLASS_BLOCK, world)

    set_entrance_rule("West Phazon to West Magmoor", Has(VARIA) & CAN_PB & Has(ICE), world)
    set_entrance_rule("West Phazon to Processing Center", Has(ICE) & Has(MORPH), world)
    set_entrance_rule("West Phazon to Elite Control Access", Has(ICE) & Has(MORPH) & CAN_PB, world)

    set_entrance_rule("Central Phendrana to Thardus Area", Has(MORPH) & Has(MISSILE) & Has(WAVE) & CAN_BEAT_THARDUS & (CAN_TRAVERSE_LOW_OVERHANG | (CAN_BOOST & CAN_BOMB)), world)
    set_entrance_rule("Central Phendrana to Research Lab Hydra", Has(WAVE) & (CAN_TRAVERSE_LOW_OVERHANG | (CAN_BOOST & CAN_BOMB)), world)

    set_entrance_rule("Thardus Area to West Phendrana Elevator", Has(MORPH), world)
    set_entrance_rule("Thardus Area to Central Phendrana", Has(MORPH), world)

    set_entrance_rule("Hydra to Top Observatory", CAN_BOOST & CAN_BOMB, world)

    set_entrance_rule("Observatory to Aether", Has(MISSILE), world)

    set_entrance_rule("Aether to Observatory", Has(MISSILE), world)

    set_entrance_rule("Core to Aether", Has(WAVE), world)
    set_entrance_rule("Core to Upper Edge", Has(ICE) & Has(MORPH) & Has(WAVE), world)

    set_entrance_rule("Upper Edge to Core", Has(ICE) & Has(MORPH), world)
    set_entrance_rule("Upper Edge to Lower", Has(MORPH) | CAN_DESTROY_BOMB_BLOCKS, world)
    set_entrance_rule("Upper Edge to Frost Cave", Has(MORPH), world)

    set_entrance_rule("Lower Edge to Elevator", Has(ICE) & Has(MORPH), world)
    set_entrance_rule("Lower Edge to Upper", Has(MORPH) | CAN_DESTROY_BOMB_BLOCKS, world)
    set_entrance_rule("Lower Edge to Hunter Cave", CAN_TRAVERSE_UNDERWATER & Has(MORPH), world)

    set_entrance_rule("Frost Cave to True Edge", Has(MISSILE) & Has(MORPH), world)
    set_entrance_rule("Frost Cave to Upper Edge", Has(MORPH), world)

    set_entrance_rule("True Edge to Hunter Cave", Has(MORPH), world)
    set_entrance_rule("True Edge to Frost Cave", Has(MISSILE) & Has(MORPH), world)

    set_entrance_rule("Hunter Cave to Lower Edge", Has(MORPH), world)
    set_entrance_rule("Hunter Cave to True Edge", Has(MORPH) & CAN_TRAVERSE_UNDERWATER, world)

    set_entrance_rule("Phazon Entrance to Corridor", Has(ICE), world)
    set_entrance_rule("Phazon Entrance to Storage Depot B", Has(GRAPPLE) & Has(MORPH), world)
    set_entrance_rule("Phazon Entrance to Colored Blocks", (Has(GRAPPLE) | (CAN_TRAVERSE_UNDERWATER & CAN_IBJ)) & Has(MORPH), world)

    set_entrance_rule("Corridor to Elite Research", (Has(ICE) & Has(WAVE)) | (CAN_PB & Has("Power Bomb", 2)), world)

    set_entrance_rule("Elite Research to Colored Blocks", CAN_BOOST & CAN_TRAVERSE_LOW_OVERHANG, world)

    set_entrance_rule("Colored Blocks to Storage Depot", Has(MORPH) & CAN_BOMB & CAN_PB & CAN_DESTROY_BOMB_BLOCKS, world)
    set_entrance_rule("Colored Blocks to Elite Control Access", Has(MORPH) & (CAN_BOMB | CAN_PB) & CAN_DESTROY_BLOCKS_WHILE_MORPHED, world)
    set_entrance_rule("Colored Blocks to Phazon Entrance", Has(GRAPPLE) & CAN_PB & CAN_BOMB & Has(MORPH), world)

    set_entrance_rule("Elite Control Access to Ventilation Shaft", Has(WAVE) & Has(ICE) & (Has(SPACEJUMP) | Has(GRAPPLE) | CAN_IBJ), world)
    set_entrance_rule("Elite Control Access to Processing Center", Has(WAVE) & CAN_PB, world)
    set_entrance_rule("Elite Control Access to West Elevator", Has(WAVE) & CAN_PB & Has(MORPH) & Has(ICE), world)
    set_entrance_rule("Elite Control Access to Colored Blocks", Has(MORPH) & CAN_PB, world)

    # This connection feels really bad with no combat logic, so requiring some weapons for now
    set_entrance_rule("Ventilation Shaft to Central Dynamo", CAN_BOOST & Has(CHARGE) & Has(PLASMA) & Has("Energy Tank", 4), world)

    set_entrance_rule("Central Dynamo to Metroid Quarantine A", Has(ICE) & Has(WAVE) & CAN_PB, world)

    set_entrance_rule("Metroid Quarantine A to Fungal Hall Access", CAN_TRAVERSE_LOW_OVERHANG & Has(PLASMA) & (Has(SCREW) | CAN_DESTROY_BOMB_BLOCKS), world)

    set_entrance_rule("Fungal Hall Access to Phazon Mining Tunnel", Has(GRAPPLE) & CAN_PB & Has(ICE), world)

    set_entrance_rule("Phazon Mining Tunnel to Fungal Hall B", Has(MORPH) & CAN_DESTROY_BLOCKS_WHILE_MORPHED & (Has(GRAPPLE) | Has(PHAZON)), world)

    set_entrance_rule("Fungal Hall B to Metroid Quarantine B", Has(MORPH) & CAN_DESTROY_BOMB_BLOCKS & Has(GRAPPLE) & Has(PLASMA), world)

    set_entrance_rule("Metroid Quarantine B to Omega Pirate Area", Has(PLASMA), world)

    set_entrance_rule("Omega Pirate to Processing Center Access", Has(PHAZON) & (Has(GRAPPLE) | CAN_IBJ | Has(SPACEJUMP)), world)
    set_entrance_rule("Omega Pirate to Metroid Quarantine B", Has(PLASMA), world)

    set_entrance_rule("Processing Center Access to Processing Center", Has(PHAZON) & Has(PLASMA), world)
    set_entrance_rule("Processing Center Access to Omega Pirate Area", Has(PHAZON), world)

    set_entrance_rule("Processing Center to Processing Center Access", Has(PHAZON) & Has(PLASMA), world)
    set_entrance_rule("Processing Center to West Elevator", CAN_TRAVERSE_LOW_OVERHANG & Has(MORPH) & Has(ICE), world)
    set_entrance_rule("Processing Center to Elite Control Access", CAN_TRAVERSE_LOW_OVERHANG & CAN_PB & Has(MORPH), world)

def set_location_rules(world: MetroidPrimeOriginsWorld):
    set_tallon_location_rules(world)
    set_chozo_ruins_location_rules(world)
    set_magmoor_location_rules(world)
    set_phendrana_location_rules(world)
    set_phazon_location_rules(world)

def set_completion_rule(world: MetroidPrimeOriginsWorld):
    world.set_completion_rule(Has("Victory"))
