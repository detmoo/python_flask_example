#!/bin/bash
source venv/bin/activate
exec gunicorn -b :5000 --access-logfile - --error-logfile - bowdata.test.flask:src/bowdata/test/flask