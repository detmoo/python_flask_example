FROM python:3.9-slim

RUN useradd bowdata.test.flask

WORKDIR /home/bowdata.test.flask

COPY run.py boot.sh ./
COPY ./dist ./dist
RUN chmod +x boot.sh

RUN /usr/local/bin/python -m venv .venv
RUN .venv/bin/pip install -U pip
RUN .venv/bin/python -m pip install --find-links=./dist bowdata.test.flask
RUN .venv/bin/pip install gunicorn

ENV FLASK_APP run.py

RUN chown -R bowdata.test.flask:bowdata.test.flask ./
USER bowdata.test.flask

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
