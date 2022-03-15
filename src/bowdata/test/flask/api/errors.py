"""Error handlers for API routes."""
from flask import jsonify
from werkzeug.http import HTTP_STATUS_CODES


def error_response(status_code, message=None):
    """Generic Error Response.

    Args:
        status_code (int): HTTP error code.
        message (str): message to display when the error occurs.
    """
    payload = {'error': HTTP_STATUS_CODES.get(status_code, 'Unknown Error')}
    if message:
        payload['message'] = message
    response = jsonify(payload)
    response.status_code = status_code
    return response


def bad_request(message):
    """Dedicated 400 Code Error Response.

    Args:
        message (str): message to display when the error occurs.
    """
    return error_response(400, message)
