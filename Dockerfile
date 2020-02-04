FROM alpine:latest
MAINTAINER Jian Li <gunine@sk.com>

LABEL Description="Provides openstack client tools" Version="0.1"

# Alpine-based installation
RUN apk add --update \
  curl \
  python-dev \
  py-pip \
  py-setuptools \
  ca-certificates \
  gcc \
  libffi-dev \
  openssl-dev \
  musl-dev \
  linux-headers \
  jq \
  && pip install --upgrade --no-cache-dir pip setuptools python-openstackclient \
  && apk del gcc musl-dev linux-headers libffi-dev \
  && rm -rf /var/cache/apk/*

# Default is to start a shell.  A more common behavior would be to override
# the command when starting.
CMD ["/bin/sh"]
