"""Test fixture to interrogate an arbitrary API endpoint."""
from flask import jsonify

from bowdata.test.flask.api import bp


@bp.route('/capital-of-ukraine', methods=['GET'])
def capital_of_ukraine():
    """Get the capital of the Ukraine."""
    return jsonify({'capital-of-ukraine': 'Kyiv'})
