import json
import unittest

from bowdata.test.flask import create_app
from bowdata.test.flask.config import Config


class TestConfig(Config):
    TESTING = True


class TestMockFixtures(unittest.TestCase):

    def setUp(self):
        self.app = create_app(TestConfig)
        self.client = self.app.test_client()

    def test_capital_of_ukraine(self):
        response = self.client.get("/api/capital-of-ukraine")
        response_dict = json.loads(response.data)
        self.assertEqual(response.status, '200 OK')
        self.assertEqual(response_dict['capital-of-ukraine'], 'Kyiv')
