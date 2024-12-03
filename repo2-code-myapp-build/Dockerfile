FROM python:3.11-slim

ARG ROLE_ID
ARG VERSION

ENV ROLE_ID=${ROLE_ID}
ENV VERSION=${VERSION}

WORKDIR /code

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
COPY ./requirements.txt /code/requirements.txt

RUN apt-get update \
  && apt-get install -y --no-install-recommends awscli curl jq \
  && pip install --no-cache-dir --upgrade -r /code/requirements.txt \
  && chmod +x /docker-entrypoint.sh \
  && rm -rf /var/lib/apt/lists/*

COPY ./app /code/app
COPY ./.env /code/.env

EXPOSE 8080

ENTRYPOINT [ "/docker-entrypoint.sh" ]