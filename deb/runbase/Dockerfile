FROM debian:stable-slim

LABEL  author = "Paul Harrison" \
       description = "base run environment for debian" \
       registry = "jbo/astrorun-deb"

WORKDIR /usr/local/src

RUN apt-get update && apt-get install -y apt-utils gnupg2 curl python3 \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
