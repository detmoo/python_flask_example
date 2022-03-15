"""Foundational web application routes."""
from bowdata.test.flask.main import bp


@bp.route('/', methods=['GET'])
@bp.route('/index', methods=['GET'])
def index():
    """Route of the generic home or index page."""
    return "Hello, World."
