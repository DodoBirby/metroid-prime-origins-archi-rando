from test.bases import WorldTestBase

from ..world import MetroidPrimeOriginsWorld

class MPOTestBase(WorldTestBase):
    game = "Metroid Prime Origins"
    world: MetroidPrimeOriginsWorld
