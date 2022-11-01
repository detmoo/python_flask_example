FROM python:3.9-slim

RUN useradd bowdata-test-flask
USER bowdata-test-flask

WORKDIR /home/bowdata-test-flask

RUN chown -R bowdata-test-flask:bowdata-test-flask ./
RUN mkdir -p .ci
COPY .ci/install.py .ci/install.py
COPY requirements.txt requirements.txt
COPY /src/bowdata/test/flask /src/bowdata/test/flask
COPY bowdata-test-flask.py boot.sh ./
RUN chmod +x boot.sh

RUN pip install -U pip
RUN pip config --site set global.index-url https://pypi.org/simple
RUN pip config --site set global.extra-index-url {env:PIP_EXTRA_INDEX_URL:https://pkgs.dev.azure.com/BowData/_packaging/BowData/pypi/simple/}
RUN python -m venv .venv
RUN python .ci/install.py requirements.txt
RUN .venv/bin/pip install gunicorn

ENV FLASK_APP bowdata-test-flask.py

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
