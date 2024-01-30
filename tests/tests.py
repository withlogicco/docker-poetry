import os
import re
import subprocess
import unittest


class TestPoetrySetup(unittest.TestCase):
    def test_poetry_binary_available(self):
        """
        Test if Poetry binary is available.
        """

        result = subprocess.run(["which", "poetry"], capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, "Poetry binary is not available in PATH")

    def test_poetry_version(self):
        """
        Test if the installed Poetry version is correct.
        """

        expected_version = os.environ.get("POETRY_VERSION")
        result = subprocess.run(["poetry", "--version"], capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, "Error executing Poetry")
        version_match = re.search(r"Poetry \(version (\S+)\)", result.stdout)
        self.assertIsNotNone(version_match, "Unable to parse Poetry version")
        self.assertEqual(
            version_match.group(1),
            expected_version,
            f"Expected Poetry version {expected_version}, got {version_match.group(1)}",
        )

    def test_poetry_without_virtualenvs(self):
        """
        Test if Poetry is configured to work without virtual environments.
        """

        result = subprocess.run(
            ["poetry", "config", "virtualenvs.create"], capture_output=True, text=True
        )
        self.assertEqual(result.returncode, 0, "Error executing Poetry config command")
        self.assertEqual(
            result.stdout.strip(),
            "false",
            "Poetry is not configured to work without virtual environments",
        )


if __name__ == "__main__":
    unittest.main()
