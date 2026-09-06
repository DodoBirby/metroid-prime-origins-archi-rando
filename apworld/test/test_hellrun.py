from .bases import MPOTestBase

class TestHellrun(MPOTestBase):
    options = {
        "hellruns_in_logic": True
    }

    def test_hellrun_to_phendrana(self):
        self.assertAccessDependency(
            ["(Phendrana Drifts) Phendrana Shorelines - Underwater Ice Cube"],
            [["Varia Suit"], ["Energy Tank"]],
            only_check_listed=True
        )

    def test_hellrun_to_phazon(self):
        _ = self.collect_by_name(["Energy Tank", "Morph Ball", "Power Bomb", "Missile Tank", "Wave Beam", "Ice Beam", "Grapple Beam", "Charge Beam"])
        self.assertTrue(self.can_reach_region("(Phazon Mines) West Phazon Mines Elevator"))
