from .bases import MPOTestBase

class TestArtifacts(MPOTestBase):
    options = {
        "artifacts_required": 12
    }

    def test_goal(self):
        self.assertAccessDependency(["Victory"], [["Artifact of Truth", "Artifact of Strength", "Artifact of Elder", "Artifact of Wild", "Artifact of Lifegiver", "Artifact of Chozo", "Artifact of Warrior", "Artifact of Nature", "Artifact of Nature", "Artifact of Sun", "Artifact of World", "Artifact of Spirit", "Artifact of Newborn"]])
