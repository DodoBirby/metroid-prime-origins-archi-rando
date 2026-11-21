from enum import Enum

class ElevatorNames(Enum):
    LandingSiteWest = 0
    CrashSite = 1
    WestRuins = 2
    ReflectingPoolWest = 3
    ReflectingPoolEast = 4
    WestTallon = 5
    CentralMagmoor = 6
    WestEastTallon = 7
    EastEastTallon = 8
    WestPhazon = 9
    EastPhazon = 10
    UpperWestRuins = 11
    MonitorStation = 12
    EastMagmoor = 13
    EastWestMagmoor = 14
    WestWestMagmoor = 15
    EastPhendrana = 16
    WestPhendrana = 17

ELEVATOR_NAME_MAPPING = {
    ElevatorNames.LandingSiteWest: "Landing Site West Elevator",
    ElevatorNames.CrashSite: "Crash Site Elevator",
    ElevatorNames.WestRuins: "West Ruins Elevator",
    ElevatorNames.ReflectingPoolWest: "Reflecting Pool West Elevator",
    ElevatorNames.ReflectingPoolEast: "Reflecting Pool East Elevator",
    ElevatorNames.WestTallon: "West Tallon Elevator",
    ElevatorNames.CentralMagmoor: "Central Magmoor Elevator",
    ElevatorNames.WestEastTallon: "East Tallon West Elevator",
    ElevatorNames.EastEastTallon: "East Tallon East Elevator",
    ElevatorNames.WestPhazon: "West Phazon Elevator",
    ElevatorNames.EastPhazon : "East Phazon Elevator",
    ElevatorNames.UpperWestRuins : "Upper West Ruins Elevator",
    ElevatorNames.MonitorStation : "Monitor Station Elevator",
    ElevatorNames.EastMagmoor : "East Magmoor Elevator",
    ElevatorNames.EastWestMagmoor : "West Magmoor East Elevator",
    ElevatorNames.WestWestMagmoor : "West Magmoor West Elevator",
    ElevatorNames.EastPhendrana : "East Phendrana Elevator",
    ElevatorNames.WestPhendrana : "West Phendrana Elevator",
}

ELEVATOR_KEY_MAPPING = {
    ElevatorNames.LandingSiteWest: "tal_Transport_to_Chozo_Ruins_West",
    ElevatorNames.CrashSite: "tal_Transport_to_Chozo_Ruins_East",
    ElevatorNames.WestRuins: "cho_Transport_to_Tallon_Overworld_North",
    ElevatorNames.ReflectingPoolWest: "cho_Transport_to_Tallon_Overworld_East",
    ElevatorNames.ReflectingPoolEast: "cho_Transport_to_Tallon_Overworld_South",
    ElevatorNames.WestTallon: "tal_Transport_to_Magmoor_Caverns_East",
    ElevatorNames.CentralMagmoor: "mag_Transport_to_Tallon_Overworld_West",
    ElevatorNames.WestEastTallon: "tal_Transport_to_Chozo_Ruins_South",
    ElevatorNames.EastEastTallon: "tal_Transport_to_Phazon_Mines_East",
    ElevatorNames.WestPhazon: "pha_Transport_to_Magmoor_Caverns_South",
    ElevatorNames.EastPhazon : "pha_Transport_to_Tallon_Overworld_South",
    ElevatorNames.UpperWestRuins : "cho_Transport_to_Magmoor_Caverns_North",
    ElevatorNames.MonitorStation : "mag_Transport_to_Phendrana_Drifts_North",
    ElevatorNames.EastMagmoor : "mag_Transport_to_Chozo_Ruins_North",
    ElevatorNames.EastWestMagmoor : "mag_Transport_to_Phendrana_Drifts_South",
    ElevatorNames.WestWestMagmoor : "mag_Transport_to_Phazon_Mines_West",
    ElevatorNames.EastPhendrana : "phe_Transport_to_Magmoor_Caverns_West",
    ElevatorNames.WestPhendrana : "phe_Transport_to_Magmoor_Caverns_South",
}

ELEVATOR_NAME_KEY_MAPPING = { v: ELEVATOR_KEY_MAPPING[k] for k, v in ELEVATOR_NAME_MAPPING.items() }
