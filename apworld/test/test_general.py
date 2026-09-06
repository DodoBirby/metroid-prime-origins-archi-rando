from .bases import MPOTestBase

class TestGeneral(MPOTestBase):
    def test_backdoor_elder_hall_ceiling(self):
        elder_hall_ceiling = self.world.get_location("(Chozo Ruins) Hall of the Elders - Ceiling")
        self.assertFalse(elder_hall_ceiling.can_reach(self.multiworld.state))

        _ = self.collect_by_name(["Morph Ball", "Spider Ball", "Screw Attack", "Missile Tank", "Ice Beam", "Space Jump Boots"])

        self.assertTrue(elder_hall_ceiling.can_reach(self.multiworld.state))

