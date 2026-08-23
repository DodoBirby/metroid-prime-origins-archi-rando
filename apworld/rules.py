from __future__ import annotations

from typing import TYPE_CHECKING, Any

from rule_builder.rules import Has, Rule

if TYPE_CHECKING:
    from .world import MetroidPrimeOriginsWorld

CAN_SPIDER = Has("Spider Ball") & Has("Morph Ball")
CAN_IBJ = Has("Morph Ball") & Has("Morph Ball Bomb")
CAN_BOMB = Has("Morph Ball") & Has("Morph Ball Bomb")
CAN_SUPER_MISSILE = Has("Missile Tank") & Has("Super Missile")
CAN_BOOST = Has("Morph Ball") & Has("Boost Ball")
CAN_PB = Has("Morph Ball") & Has("Power Bomb")
CAN_DESTROY_BOMB_BLOCKS = CAN_BOMB | CAN_PB | Has("Screw Attack")
CAN_DESTROY_BLOCKS_WHILE_MORPHED = CAN_BOMB | CAN_PB
CAN_TRAVERSE_UNDERWATER = Has("Gravity Suit") | Has("Grapple Beam")

CAN_DESTROY_GLASS_BLOCK = Has("Charge Beam") | Has("Missile Tank")

# Frigate requires shooting conduits, traversing underwater ledges, and destroying bomb blocks + glass to reveal conduits
CAN_TRAVERSE_FRIGATE = Has("Wave Beam") & CAN_DESTROY_BLOCKS_WHILE_MORPHED & Has("Missile Tank") & CAN_TRAVERSE_UNDERWATER


# This rule should be used for overhangs where you can't swwj but you can get through with vertical movement or climbing up the side
CAN_TRAVERSE_LOW_OVERHANG = Has("Space Jump Boots") | CAN_SPIDER | Has("Grapple Beam") | CAN_IBJ
CAN_TRAVERSE_HIGH_OVERHANG = Has("Grapple Beam") | CAN_SPIDER | CAN_IBJ

def set_location_rule(name: str, rule: Rule[Any], world: MetroidPrimeOriginsWorld):
    world.set_rule(world.get_location(name), rule)

def set_entrance_rule(name: str, rule: Rule[Any], world: MetroidPrimeOriginsWorld):
    world.set_rule(world.get_entrance(name), rule)

def set_all_rules(world: MetroidPrimeOriginsWorld):
    set_region_connection_rules(world)
    set_location_rules(world)
    set_completion_rule(world)

def set_region_connection_rules(world: MetroidPrimeOriginsWorld):
    set_entrance_rule("Landing Site to West Tallon", Has("Missile Tank"), world)
    set_entrance_rule("Landing Site to Crash Site", Has("Morph Ball") & Has("Missile Tank"), world)

    # Grapple across the top of the lake, or use gravity suit and morph + walljumps to go through the tunnel
    set_entrance_rule("Crash Site Left to Right", Has("Grapple Beam") | (Has("Gravity Suit") & Has("Morph Ball")) | CAN_IBJ | Has("Space Jump Boots"), world)

    # Get through the fire door, morph through the tunnel, get up the underwater ledge, shoot the conduit, break bomb blocks
    set_entrance_rule("Crash Site Right to Frigate", Has("Ice Beam") & Has("Morph Ball") & CAN_TRAVERSE_FRIGATE, world)
    set_entrance_rule("Crash Site Right to Overgrown Cavern", CAN_TRAVERSE_LOW_OVERHANG & Has("Ice Beam"), world)

    set_entrance_rule("Overgrown Cavern to Upper Reflecting Pool", Has("Morph Ball") & CAN_DESTROY_BOMB_BLOCKS, world)

    set_entrance_rule("Inside Frigate to East Tallon", CAN_TRAVERSE_FRIGATE & CAN_BOOST, world)

    set_entrance_rule("East Tallon to Gated East Tallon", Has("Open East Tallon Gate"), world)
    set_entrance_rule("East Tallon to Upper Reflecting Pool", Has("Ice Beam") & CAN_DESTROY_BOMB_BLOCKS, world)

    set_entrance_rule("Gated East Tallon to Life Grove", CAN_TRAVERSE_LOW_OVERHANG & CAN_PB, world)
    
    set_entrance_rule("West Ruins to Upper West Ruins", Has("Missile Tank") & Has("Morph Ball"), world)
    set_entrance_rule("West Ruins to Central Ruins", Has("Morph Ball"), world)
    set_entrance_rule("West Ruins to Ruined Shrine", Has("Missile Tank"), world)

    set_entrance_rule("Upper West Ruins to Flaahgra", CAN_SUPER_MISSILE & CAN_TRAVERSE_HIGH_OVERHANG, world)

    set_entrance_rule("Ruined Shrine to Tower of Light", Has("Wave Beam") & (CAN_SPIDER | Has("Grapple Beam")), world)

    # Lenient rule
    set_entrance_rule("Central Ruins to Past Magma Pool", Has("Varia Suit") & Has("Wave Beam") & Has("Grapple Beam"), world)
    set_entrance_rule("Central Ruins to Arboretum", Has("Missile Tank"), world)
    
    set_entrance_rule("Arboretum to Gathering Hall", Has("Missile Tank"), world)
    set_entrance_rule("Arboretum to Flaahgra", Has("Morph Ball") & CAN_DESTROY_BOMB_BLOCKS & Has("Missile Tank"), world)

    set_entrance_rule("Gathering Hall to Dynamo", Has("Missile Tank") & Has("Morph Ball") & CAN_DESTROY_BOMB_BLOCKS, world)
    set_entrance_rule("Gathering Hall to Energy Core", Has("Morph Ball"), world)

    set_entrance_rule("Energy Core to Furnace", CAN_TRAVERSE_LOW_OVERHANG | CAN_BOMB, world)

    set_entrance_rule("Furnace to Upper Furnace", Has("Morph Ball") & CAN_DESTROY_BOMB_BLOCKS & (CAN_SPIDER | Has("Grapple Beam")), world)

    set_entrance_rule("Upper Furnace to Crossway", Has("Morph Ball"), world)
    set_entrance_rule("Upper Furnace to Elder Hall", Has("Ice Beam"), world)

    set_entrance_rule("Crossway to Elder Hall", CAN_BOOST & ((Has("Ice Beam") & Has("Morph Ball")) | Has("Missile Tank")), world)

    set_entrance_rule("Elder Hall to Lower Reflecting Pool", Has("Wave Beam") & CAN_BOMB & CAN_TRAVERSE_LOW_OVERHANG, world)

    set_entrance_rule("Lower Pool to Upper Pool", (CAN_DESTROY_BOMB_BLOCKS & CAN_BOOST) | Has("Grapple Beam") | CAN_IBJ, world)

    set_entrance_rule("Upper Reflecting Pool to Overgrown Cavern", Has("Missile Tank") | CAN_BOMB, world)
    set_entrance_rule("Upper Reflecting Pool to East Tallon", CAN_BOMB & Has("Ice Beam"), world)

    set_entrance_rule("East Magmoor to Central Magmoor", Has("Morph Ball") & CAN_DESTROY_BLOCKS_WHILE_MORPHED & Has("Varia Suit"), world)

    set_entrance_rule("Central Magmoor to East Magmoor", Has("Morph Ball") & CAN_DESTROY_BLOCKS_WHILE_MORPHED & Has("Varia Suit"), world)
    set_entrance_rule("Central Magmoor to East Phendrana", Has("Morph Ball") & Has("Varia Suit"), world)
    set_entrance_rule("Central Magmoor to Central Elevator", Has("Morph Ball") & Has("Varia Suit"), world)

    set_entrance_rule("Central Elevator to Central Magmoor", Has("Morph Ball") & Has("Varia Suit"), world)
    set_entrance_rule("Central Elevator to Geothermal Core", Has("Varia Suit") & Has("Morph Ball") & (Has("Grapple Beam") | CAN_SPIDER) & Has("Wave Beam"), world)

    set_entrance_rule("Geothermal Core to Central Elevator", Has("Varia Suit") & Has("Morph Ball") & (Has("Grapple Beam") | CAN_SPIDER), world)

    set_entrance_rule("West Magmoor to Geothermal Core", Has("Varia Suit"), world)
    set_entrance_rule("West Magmoor to West Phendrana", Has("Varia Suit"), world)
    set_entrance_rule("West Magmoor to West Phazon", Has("Varia Suit") & CAN_PB & Has("Ice Beam"), world)

    set_entrance_rule("East Phendrana to Central Magmoor", Has("Morph Ball") & Has("Varia Suit"), world)
    set_entrance_rule("East Phendrana to Shorelines", CAN_DESTROY_GLASS_BLOCK, world)

    set_entrance_rule("West Phendrana to West Magmoor", Has("Varia Suit"), world)
    set_entrance_rule("West Phendrana to Thardus Area", Has("Morph Ball"), world)
    set_entrance_rule("West Phendrana Elevator to Edge Lower", CAN_TRAVERSE_LOW_OVERHANG & Has("Ice Beam"), world)

    set_entrance_rule("Shorelines to Ice Temple", CAN_DESTROY_GLASS_BLOCK & Has("Boost Ball"), world)
    set_entrance_rule("Shorelines to Central Phendrana", CAN_TRAVERSE_LOW_OVERHANG & Has("Wave Beam"), world)

    set_entrance_rule("West Phazon to West Magmoor", Has("Varia Suit") & CAN_PB & Has("Ice Beam"), world)

    set_entrance_rule("Central Phendrana to Thardus Area", Has("Morph Ball") & Has("Missile Tank") & Has("Wave Beam"), world)
    set_entrance_rule("Central Phendrana to Research Lab Hydra", Has("Wave Beam"), world)

    set_entrance_rule("Thardus Area to West Phendrana Elevator", Has("Morph Ball"), world)
    set_entrance_rule("Thardus Area to Central Phendrana", Has("Morph Ball"), world)

    set_entrance_rule("Hydra to Top Observatory", CAN_BOOST & CAN_BOMB, world)

    set_entrance_rule("Observatory to Aether", Has("Missile Tank"), world)

    set_entrance_rule("Core to Aether", Has("Wave Beam"), world)
    set_entrance_rule("Core to Upper Edge", Has("Ice Beam") & Has("Morph Ball") & Has("Wave Beam"), world)

    set_entrance_rule("Upper Edge to Core", Has("Ice Beam") & Has("Morph Ball"), world)
    set_entrance_rule("Upper Edge to Lower", Has("Morph Ball") | CAN_DESTROY_BOMB_BLOCKS, world)
    set_entrance_rule("Upper Edge to Frost Cave", Has("Morph Ball"), world)

    set_entrance_rule("Lower Edge to Elevator", Has("Ice Beam") & Has("Morph Ball"), world)
    set_entrance_rule("Lower Edge to Upper", Has("Morph Ball") | CAN_DESTROY_BOMB_BLOCKS, world)
    set_entrance_rule("Lower Edge to Hunter Cave", CAN_TRAVERSE_UNDERWATER & Has("Morph Ball"), world)

    set_entrance_rule("Frost Cave to True Edge", Has("Missile Tank") & Has("Morph Ball"), world)

    set_entrance_rule("True Edge to Hunter Cave", Has("Morph Ball"), world)

    set_entrance_rule("Hunter Cave to Lower Edge", Has("Morph Ball"), world)

def set_location_rules(world: MetroidPrimeOriginsWorld):
    # Tallon
    # Melt the ice then traverse the overhang
    set_location_rule("(Tallon Overworld) Life Grove - Lake", CAN_BOOST & CAN_DESTROY_BOMB_BLOCKS & (Has("Screw Attack") | CAN_PB), world)
    set_location_rule("(Tallon Overworld) Life Grove Tunnel", CAN_BOOST & CAN_DESTROY_BLOCKS_WHILE_MORPHED, world)

    set_location_rule("(Tallon Overworld) Cargo Freight Lift to Deck Gamma", Has("Missile Tank"), world)
    set_location_rule("(Tallon Overworld) Hydro Access Tunnel", CAN_BOOST, world)
    set_location_rule("(Tallon Overworld) Biohazard Containment", CAN_SUPER_MISSILE, world)

    set_location_rule("(Tallon Overworld) Arbor Chamber", Has("Plasma Beam") & CAN_TRAVERSE_LOW_OVERHANG, world)

    set_location_rule("(Tallon Overworld) Crash Site - Underwater Ledge", (Has("Gravity Suit") & CAN_TRAVERSE_LOW_OVERHANG) | Has("Grapple Beam"), world)

    set_location_rule("(Tallon Overworld) Great Tree Chamber", Has("Screw Attack"), world)

    # Screw through the wall or blow up the secret path
    set_location_rule("(Tallon Overworld) Overgrown Cavern", Has("Morph Ball"), world)

    set_location_rule("Open East Tallon Gate)", CAN_BOOST, world)

    # Chozo Ruins
    set_location_rule("(Chozo Ruins) Main Plaza - Super Missile Blocks", CAN_SUPER_MISSILE & CAN_TRAVERSE_LOW_OVERHANG, world)
    set_location_rule("(Chozo Ruins) Main Plaza - Boost Ball Ramp", CAN_BOOST | Has("Space Jump Boots"), world)
    set_location_rule("(Chozo Ruins) Main Plaza - Lower Ledge", CAN_TRAVERSE_LOW_OVERHANG | Has("Enter Main Plaza From Ledge"), world)
    set_location_rule("(Chozo Ruins) Main Plaza - Top Ledge", Has("Grapple Beam") | CAN_IBJ, world)
    set_location_rule("(Chozo Ruins) Ruined Nursery", CAN_DESTROY_BLOCKS_WHILE_MORPHED & Has("Morph Ball"), world)
    set_location_rule("(Chozo Ruins) Ruined Gallery - Right Tunnel", Has("Morph Ball"), world)
    set_location_rule("(Chozo Ruins) Ruined Gallery - Left Wall", Has("Missile Tank"), world)
    set_location_rule("(Chozo Ruins) Transport Access North", Has("Missile Tank"), world)

    set_location_rule("(Chozo Ruins) Vault", CAN_BOMB & Has("Morph Ball"), world)
    set_location_rule("Enter Main Plaza From Ledge", Has("Morph Ball"), world)

    set_location_rule("(Chozo Ruins) Ruined Fountain", CAN_BOOST | CAN_SPIDER | CAN_IBJ, world)

    set_location_rule("(Chozo Ruins) Watery Hall Access", Has("Missile Tank"), world)
    set_location_rule("(Chozo Ruins) Watery Hall - Top", Has("Missile Tank"), world)
    set_location_rule("(Chozo Ruins) Watery Hall - Underwater Tunnel", Has("Missile Tank") & CAN_TRAVERSE_UNDERWATER, world)
    set_location_rule("(Chozo Ruins) Gathering Hall", Has("Morph Ball") & CAN_DESTROY_BOMB_BLOCKS, world)

    set_location_rule("(Chozo Ruins) Dynamo - Bottom", Has("Missile Tank"), world)
    set_location_rule("(Chozo Ruins) Dynamo - Top", CAN_TRAVERSE_LOW_OVERHANG, world)

    set_location_rule("(Chozo Ruins) Burn Dome - Fight Reward", Has("Morph Ball"), world)
    set_location_rule("(Chozo Ruins) Burn Dome - Back Room", Has("Morph Ball") & CAN_DESTROY_BOMB_BLOCKS, world)

    set_location_rule("(Chozo Ruins) Furnace - Chamber", Has("Morph Ball"), world)
    set_location_rule("(Chozo Ruins) Furnace - Boost Ceiling", CAN_BOOST & (CAN_SPIDER | Has("Grapple Beam")) & CAN_DESTROY_BOMB_BLOCKS & CAN_PB, world)

    set_location_rule("(Chozo Ruins) Crossway", Has("Morph Ball") & CAN_BOOST & CAN_BOMB, world)

    set_location_rule("(Chozo Ruins) Hall of the Elders - Ceiling", Has("Ice Beam") & CAN_BOMB & CAN_SPIDER, world)
    # TODO: On remix you can use the secret path
    set_location_rule("(Chozo Ruins) Elder Chamber", (Has("Plasma Beam") & CAN_BOMB), world)

    set_location_rule("(Chozo Ruins) Antechamber", Has("Missile Tank") & CAN_BOMB, world)

    set_location_rule("(Chozo Ruins) Magma Pool", CAN_PB, world)
    set_location_rule("(Chozo Ruins) Training Chamber Access", Has("Morph Ball"), world)
    set_location_rule("(Chozo Ruins) Training Chamber", (CAN_BOOST | CAN_TRAVERSE_LOW_OVERHANG) & CAN_BOMB & Has("Morph Ball"), world)

    set_location_rule("(Chozo Ruins) Ruined Shrine - Ceiling", CAN_BOOST, world)
    set_location_rule("(Chozo Ruins) Ruined Shrine - Tunnel", CAN_DESTROY_BOMB_BLOCKS & Has("Morph Ball"), world)

    set_location_rule("(Chozo Ruins) Tower of Light", CAN_SUPER_MISSILE, world)
    set_location_rule("(Chozo Ruins) Tower Chamber", CAN_TRAVERSE_UNDERWATER & Has("Wave Beam"), world)
    # Intentionally not CAN_SPIDER since this is about triggering the event flag
    set_location_rule("(Chozo Ruins) Sunchamber - Ghost Reward", Has("Spider Ball"), world)

    # Magmoor Caverns
    set_location_rule("(Magmoor Caverns) Lava Lake - Rock Spire", Has("Varia Suit") & Has("Missile Tank"), world)

    set_location_rule("(Magmoor Caverns) Triclops Pit", Has("Missile Tank") & Has("Varia Suit"), world)
    set_location_rule("(Magmoor Caverns) Storage Cavern", Has("Morph Ball") & Has("Varia Suit"), world)

    set_location_rule("(Magmoor Caverns) Transport Tunnel A", Has("Morph Ball") & Has("Varia Suit"), world)
    set_location_rule("(Magmoor Caverns) Warrior Shrine - Statue", Has("Varia Suit") & ((CAN_BOOST & CAN_TRAVERSE_LOW_OVERHANG) | CAN_IBJ | Has("Grapple Beam")), world)
    set_location_rule("(Magmoor Caverns) Fiery Shores - from Warrior Shrine", CAN_PB & Has("Morph Ball") & Has("Varia Suit") & ((CAN_BOOST & CAN_TRAVERSE_LOW_OVERHANG) | CAN_IBJ | Has("Grapple Beam")), world)
    set_location_rule("(Magmoor Caverns) Shore Tunnel - Glass Tube", Has("Varia Suit") & CAN_PB, world)

    set_location_rule("(Magmoor Caverns) Fiery Shores - Top Left", Has("Varia Suit") & Has("Morph Ball"), world)

    set_location_rule("(Magmoor Caverns) Plasma Processing", Has("Morph Ball") & Has("Ice Beam") & Has("Varia Suit") & CAN_TRAVERSE_LOW_OVERHANG & CAN_BOOST & CAN_DESTROY_BLOCKS_WHILE_MORPHED & Has("Grapple Beam"), world)

    set_location_rule("(Magmoor Caverns) Magmoor Workstation", CAN_BOMB & CAN_SPIDER & Has("Wave Beam"), world)

    # Phendrana Drifts
    set_location_rule("(Phendrana Drifts) Phendrana Shorelines - Underwater Ice Cube", Has("Plasma Beam"), world)
    set_location_rule("(Phendrana Drifts) Ice Ruins East - Ice Cube", Has("Plasma Beam"), world)
    set_location_rule("(Phendrana Drifts) Ice Ruins East - Tunnel", CAN_BOOST, world)
    set_location_rule("(Phendrana Drifts) Ice Ruins West", Has("Plasma Beam") & (Has("Missile Tank") | CAN_TRAVERSE_LOW_OVERHANG), world)
    set_location_rule("(Phendrana Drifts) Phendrana Canyon", Has("Missile Tank"), world)
    set_location_rule("(Phendrana Drifts) Phendrana Shorelines - Hidden Tunnel", Has("Missile Tank") & Has("Boost Ball"), world)

    set_location_rule("(Phendrana Drifts) Chozo Ice Temple - Frozen Floor", Has("Morph Ball") & Has("Plasma Beam"), world)
    set_location_rule("(Phendrana Drifts) Chapel of the Elders", Has("Morph Ball") & CAN_BOMB & Has("Missile Tank"), world)

    set_location_rule("(Phendrana Drifts) Ruined Courtyard", (Has("Morph Ball") & CAN_TRAVERSE_LOW_OVERHANG) | (CAN_BOOST & CAN_BOMB), world)

    set_location_rule("(Phendrana Drifts) Quarantine Cave - Thardus Reward", CAN_TRAVERSE_LOW_OVERHANG, world)
    set_location_rule("(Phendrana Drifts) Quarantine Monitor", Has("Morph Ball") & (Has("Grapple Beam") | CAN_IBJ), world)

    set_location_rule("(Phendrana Drifts) Research Lab Hydra", CAN_SUPER_MISSILE, world)

    set_location_rule("(Phendrana Drifts) Control Tower", CAN_DESTROY_GLASS_BLOCK & CAN_TRAVERSE_LOW_OVERHANG, world)
    set_location_rule("(Phendrana Drifts) Research Lab Aether - Hidden Passage", Has("Morph Ball"), world)
    set_location_rule("(Phendrana Drifts) Research Lab Aether - Display Case", Has("Missile Tank"), world)

    set_location_rule("(Phendrana Drifts) Transport Access", Has("Plasma Beam"), world)

    set_location_rule("(Phendrana Drifts) Frost Cave", Has("Missile Tank") & (Has("Space Jump Boots") | CAN_IBJ | Has("Grapple Beam")), world)

    set_location_rule("(Phendrana Drifts) Security Cave", Has("Grapple Beam") & Has("Morph Ball"), world)
    set_location_rule("(Phendrana Drifts) Storage Cave", CAN_PB, world)

    set_location_rule("(Phendrana Drifts) Gravity Chamber - Spike Tunnel", Has("Grapple Beam"), world)
    set_location_rule("(Phendrana Drifts) Gravity Chamber", CAN_TRAVERSE_UNDERWATER | Has("Missile Tank") | Has("Space Jump Boots"), world)

def set_completion_rule(world: MetroidPrimeOriginsWorld):
    pass
