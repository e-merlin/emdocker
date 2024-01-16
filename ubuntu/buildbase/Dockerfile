FROM ubuntu:jammy

LABEL  author = "Paul Harrison" \
       description = "base build environment for ubuntu" \
       registry = "jbo/ubu-astrobuild"

WORKDIR /usr/local/src

RUN apt-get update && apt-get install -y apt-utils patch g++ make wget pkg-config \
 autoconf automake autotools-dev file gfortran gfortran-9 gnupg2 git subversion cmake \
 bison flex doxygen \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    
#https://www.intel.com/content/www/us/en/docs/oneapi/installation-guide-linux/2024-0/apt.html
RUN wget wget -O- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB|gpg --dearmor > /usr/share/keyrings/oneapi-archive-keyring.gpg \
      &&  echo "deb [signed-by=/usr/share/keyrings/oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main" >/etc/apt/sources.list.d/oneAPI.list \
      && apt-get update && apt-get install -y intel-ipp-2019.5-075
    