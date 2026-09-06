from .bases import MPOTestBase

class TestGeneral(MPOTestBase):
    def test_backdoor_elder_hall_ceiling(self):
        self.assertAccessDependency(
            ["(Chozo Ruins) Hall of the Elders - Ceiling"],
            [
                [
                    "Morph Ball",
                    "Missile Tank",
                    "Ice Beam",
                    "Screw Attack",
                    "Spider Ball"
                ]
            ],
            only_check_listed=True)
