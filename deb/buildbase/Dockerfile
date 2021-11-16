FROM debian:bullseye-slim

LABEL  author = "Paul Harrison" \
       description = "base build environment for debian" \
       registry = "jbo/deb-astrobuild"

WORKDIR /usr/local/src

RUN apt-get update && apt-get install -y apt-utils patch g++ make wget pkg-config \
 autoconf automake autotools-dev file gfortran gfortran-9 gnupg2 git subversion cmake \
 bison flex doxygen \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
#https://software.intel.com/content/www/us/en/develop/articles/installing-intel-free-libs-and-python-apt-repo.html
RUN wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && rm  GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB \
      && echo deb https://apt.repos.intel.com/ipp all main > /etc/apt/sources.list.d/intel-ipp.list \
      && apt-get update && apt-get install -y intel-ipp-2019.5-075
    