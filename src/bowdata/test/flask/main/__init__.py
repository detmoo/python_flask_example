from flask import Blueprint

bp = Blueprint('main', __name__)

from bowdata.test.flask.main import routes
