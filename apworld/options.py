from dataclasses import dataclass

from Options import PerGameCommonOptions, Range, Toggle


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

class UseVanillaItemPool(Toggle):
    """
    Choose whether to use the vanilla item pool. If this setting is enabled then the filler percent options won't be used.
    """
    display_name = "Use vanilla item pool"


class MissileFillerPercent(Range):
    """Change the percentage of missiles in the filler item pool. Higher values will make missiles more common, lower values will make them rarer. Setting this to 0 will remove missiles from the filler item pool."""
    display_name = "Missile filler percent"
    range_start = 0
    range_end = 100
    default = 50

class PowerBombFillerPercent(Range):
    """Change the percentage of power bombs in the filler item pool. Higher values will make power bombs more common, lower values will make them rarer. Setting this to 0 will remove power bombs from the filler item pool."""
    display_name = "Power Bomb filler percent"
    range_start = 0
    range_end = 100
    default = 10

class EnergyTankFillerPercent(Range):
    """Change the percentage of energy tanks in the filler item pool. Higher values will make energy tanks more common, lower values will make them rarer. Setting this to 0 will remove energy tanks from the filler item pool."""
    display_name = "Energy Tank filler percent"
    range_start = 0
    range_end = 100
    default = 10

@dataclass
class MPOOptions(PerGameCommonOptions):
    ibj_in_logic: IBJInLogic
    end_at_ridley: EndAtRidley
    use_vanilla_pool: UseVanillaItemPool
    missile_filler_percent: MissileFillerPercent
    power_bomb_filler_percent: PowerBombFillerPercent
    energy_tank_filler_percent: EnergyTankFillerPercent
