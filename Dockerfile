FROM python:3.9-slim

RUN useradd bowdatatestuser

WORKDIR /home/bowdata-test-flask

RUN mkdir -p .ci
COPY .ci/install.py .ci/install.py
COPY requirements.txt requirements.txt
RUN python -m venv .venv
RUN python .ci/install.py requirements.txt
RUN venv/bin/pip install gunicorn

COPY /src/bowdata/test/flask /src/bowdata/test/flask
COPY migrations migrations
COPY bowdata-test-flask.py boot.sh ./
RUN chmod +x boot.sh

ENV FLASK_APP bowdata-test-flask.py

RUN chown -R bowdatatestuser:bowdatatestuser ./
USER bowdatatestuser

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
