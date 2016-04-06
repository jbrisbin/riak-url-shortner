FROM alpine
MAINTAINER Jon Brisbin <jon@jbrisbin.com>

RUN \
  apk add --update ca-certificates build-base openssl-dev libffi-dev python-dev py-pip && \
  pip install --upgrade pip && \
  pip install Flask riak
RUN \
  apk del --purge build-base $(apk info|egrep "dev$")

VOLUME /var/flask

ENV PYTHONPATH /var/flask:${PYTHONPATH}
ENTRYPOINT ["python", "-m"]
