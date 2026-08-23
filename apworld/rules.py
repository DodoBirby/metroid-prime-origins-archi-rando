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
CAN_DESTROY_BOMB_BLOCKS = CAN_BOMB | CAN_PB

# Frigate requires shooting conduits, traversing underwater ledges, and destroying bomb blocks + glass to reveal conduits
CAN_TRAVERSE_FRIGATE = Has("Wave Beam") & CAN_DESTROY_BOMB_BLOCKS & Has("Missile Tank") & (Has("Gravity Suit") | Has("Grapple Beam"))

# This rule should be used for overhangs where you can't swwj but you can get through with vertical movement or climbing up the side
CAN_TRAVERSE_LOW_OVERHANG = Has("Space Jump Boots") | CAN_SPIDER | Has("Grapple Beam") | CAN_IBJ

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
    set_entrance_rule("Crash Site Left to Right", Has("Grapple Beam") | (Has("Gravity Suit") & Has("Morph Ball")), world)
    # Get through the fire door, morph through the tunnel, get up the underwater ledge, shoot the conduit, break bomb blocks
    set_entrance_rule("Crash Site Right to Frigate", Has("Ice Beam") & Has("Morph Ball") & CAN_TRAVERSE_FRIGATE, world)
    set_entrance_rule("Inside Frigate to East Tallon", CAN_TRAVERSE_FRIGATE & CAN_BOOST, world)
    set_entrance_rule("East Tallon to Gated East Tallon", Has("Open East Tallon Gate"), world)
    set_entrance_rule("Gated East Tallon to Life Grove", CAN_TRAVERSE_LOW_OVERHANG & CAN_PB, world)
    set_entrance_rule("Crash Site Right to Overgrown Cavern", CAN_TRAVERSE_LOW_OVERHANG & Has("Ice Beam"), world)

def set_location_rules(world: MetroidPrimeOriginsWorld):
    # Tallon
    # Melt the ice then traverse the overhang
    set_location_rule("(Tallon Overworld) Arbor Chamber", Has("Plasma Beam") & CAN_TRAVERSE_LOW_OVERHANG, world)

    set_location_rule("(Tallon Overworld) Crash Site - Underwater Ledge", (Has("Gravity Suit") & CAN_TRAVERSE_LOW_OVERHANG) | Has("Grapple Beam"), world)
    set_location_rule("(Tallon Overworld) Cargo Freight Lift to Deck Gamma", Has("Missile Tank"), world)
    set_location_rule("(Tallon Overworld) Biohazard Containment", CAN_SUPER_MISSILE, world)
    set_location_rule("(Tallon Overworld) Hydro Access Tunnel", CAN_BOOST, world)
    set_location_rule("(Tallon Overworld) Great Tree Chamber", Has("Screw Attack"), world)
    set_location_rule("(Tallon Overworld) Life Grove Tunnel", CAN_BOOST & CAN_DESTROY_BOMB_BLOCKS, world)
    # Screw through the wall or blow up the secret path
    set_location_rule("(Tallon Overworld) Life Grove - Lake", CAN_BOOST & CAN_DESTROY_BOMB_BLOCKS & (Has("Screw Attack") | CAN_PB), world)
    set_location_rule("(Tallon Overworld) Overgrown Cavern", Has("Morph Ball"), world)
    

def set_completion_rule(world: MetroidPrimeOriginsWorld):
    pass
