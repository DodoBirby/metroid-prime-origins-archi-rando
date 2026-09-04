from dataclasses import dataclass

from Options import DefaultOnToggle, PerGameCommonOptions, Range, Toggle


class IBJInLogic(Toggle):
    """
    Choose whether you want IBJs (Infinite Bomb Jumps) to be considered as possible for progression.
    """
    display_name = "IBJs in logic"

class EndAtRidley(Toggle):
    """
    Choose whether you want to end the game when defeating Ridley at the Artifact temple (Instead of when you reach your ship after defeating Metroid Prime).
    """
    display_name = "End at Ridley"

class ProgressiveGrappleBeam(Toggle):
    """
    Choose whether you want grapple beam to be a progressive item (Space Jump -> Grapple Beam).
    """
    display_name = "Progressive Grapple Beam"

class UseVanillaItemPool(DefaultOnToggle):
    """
    Choose whether to use the vanilla item pool. If this setting is enabled then the filler percent options won't be used.
    """
    display_name = "Use vanilla item pool"

class PowerBombFillerPercent(Range):
    """
    Change the percentage of power bombs in the filler item pool. Higher values will make power bombs more common, lower values will make them rarer. Setting this to 0 will remove power bombs from the filler item pool.
    Leftover filler percent will be missile tanks.
    If energy tank and power bomb filler is > 100% then there will be no missiles in the filler item pool and e-tanks will take priority over power bombs.
    """
    display_name = "Power Bomb filler percent"
    range_start = 0
    range_end = 100
    default = 20

class EnergyTankFillerPercent(Range):
    """
    Change the percentage of energy tanks in the filler item pool. Higher values will make energy tanks more common, lower values will make them rarer. Setting this to 0 will remove energy tanks from the filler item pool.
    Leftover filler percent will be missile tanks.
    If energy tank and power bomb filler is > 100% then there will be no missiles in the filler item pool and e-tanks will take priority over power bombs.
    """
    display_name = "Energy Tank filler percent"
    range_start = 0
    range_end = 100
    default = 30

@dataclass
class MPOOptions(PerGameCommonOptions):
    ibj_in_logic: IBJInLogic
    end_at_ridley: EndAtRidley
    progressive_grapple_beam: ProgressiveGrappleBeam
    use_vanilla_pool: UseVanillaItemPool
    power_bomb_filler_percent: PowerBombFillerPercent
    energy_tank_filler_percent: EnergyTankFillerPercent
