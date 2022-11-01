FROM python:3.9-slim

RUN useradd bowdatatestuser

WORKDIR /home/bowdata-test-flask

RUN mkdir -p .ci
COPY .ci/install.py .ci/install.py
COPY requirements.txt requirements.txt
COPY /src/bowdata/test/flask /src/bowdata/test/flask
COPY bowdata-test-flask.py boot.sh ./

RUN chmod +x boot.sh
RUN chown -R bowdatatestuser:bowdatatestuser ./
USER bowdatatestuser

RUN python -m venv .venv
RUN python .ci/install.py requirements.txt
RUN .venv/bin/pip install gunicorn

ENV FLASK_APP bowdata-test-flask.py

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
