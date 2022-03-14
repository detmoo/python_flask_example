"""bowdata.test.flask.

flask app + API test fixtures
"""
from bowdata.test.flask.main import hello_world as hw

from . import _version
__version__ = _version.get_versions()['version']
