FROM python:3.9-slim
ARG APP_NAME
ARG ARTIFACT_PATH=dist
ARG USER_NAME=$APP_NAME
ARG CONTAINER_PORT

RUN useradd $USER_NAME

WORKDIR /home/$USER_NAME

COPY run.py boot.sh ./
COPY $ARTIFACT_PATH $ARTIFACT_PATH
RUN chmod +x boot.sh

RUN /usr/local/bin/python -m venv .venv
RUN .venv/bin/pip install -U pip
RUN .venv/bin/python -m pip install --find-links=$ARTIFACT_PATH $APP_NAME
RUN .venv/bin/pip install gunicorn

ENV FLASK_APP run.py

RUN chown -R $USER_NAME:$USER_NAME ./
USER $USER_NAME

EXPOSE $CONTAINER_PORT
ENTRYPOINT ["./boot.sh"]
