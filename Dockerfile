FROM python:3.8.12-alpine3.15

ADD ./requirements.txt /app/requirements.txt

RUN set -ex \
    && apk add --no-cache --virtual .build-deps build-base \
    && python -m venv /env \
    && /env/bin/pip install --upgrade pip \
    && /env/bin/pip install --no-cache-dir -r /app/requirements.txt \
    && runDeps="$(scanelf --needed --nobanner --recursive /env \
        | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
        | sort -u \
        | xargs -r apk info --installed \
        | sort -u)" \
    && apk add --virtual rundeps $runDeps \
    && apk del .build-deps

ADD . /app
WORKDIR /app

ENV PATH /env/bin:$PATH

EXPOSE 8000