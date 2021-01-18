FROM debian:stable-slim

LABEL  author = "Paul Harrison" \
       description = "base build environment for debian" \
       registry = "jbo/astrobuild-deb"

WORKDIR /usr/local/src

RUN apt-get update && apt-get install -y apt-utils patch g++ make wget pkg-config \
 autoconf automake autotools-dev file gfortran gfortran-8 gnupg2 git subversion cmake \
 bison flex doxygen \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*