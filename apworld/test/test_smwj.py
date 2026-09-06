from .bases import MPOTestBase

class TestSMWJ(MPOTestBase):
    options = {
        "sm_walljumps_in_logic": True,
    }

    def test_main_plaza_lower_ledge_is_sphere_1(self):
        lower_ledge = self.world.get_location("(Chozo Ruins) Main Plaza - Lower Ledge")
        self.assertTrue(lower_ledge.can_reach(self.multiworld.state))
