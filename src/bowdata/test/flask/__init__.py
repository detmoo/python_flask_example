"""bowdata.test.flask.

flask app + API test fixtures
"""
from . import _version
__version__ = _version.get_versions()['version']

from flask import Flask

from bowdata.test.flask.config import Config


def create_app(config_class=Config):
    """Flask Application Factory Pattern.

    Args:
        config_class (Config): object whose attributes provide parameters for the Flask app instance.
    """
    app = Flask(__name__)
    app.config.from_object(config_class)

    from bowdata.test.flask.main import bp as main_bp
    app.register_blueprint(main_bp)

    from bowdata.test.flask.api import bp as api_bp
    app.register_blueprint(api_bp, url_prefix='/api')

    return app
