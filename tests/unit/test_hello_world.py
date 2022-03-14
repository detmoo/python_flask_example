import unittest

from bowdata.test.flask import hw


class TestHelloWorld(unittest.TestCase):

    def test_hello_world(self):
        result = hw("world")
        self.assertEqual(result, "hello world")
