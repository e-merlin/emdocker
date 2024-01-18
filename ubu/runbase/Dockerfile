FROM ubuntu:jammy

LABEL  author = "Paul Harrison" \
       description = "base run environment for ubuntu" \
       registry = "jbo/ubu-runbase"

WORKDIR /usr/local/src

RUN apt-get update && apt-get install -y apt-utils openmpi-bin wget gnupg2 curl python-is-python3 \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget  -O- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB|gpg --dearmor > /usr/share/keyrings/oneapi-archive-keyring.gpg \
      &&  echo "deb [signed-by=/usr/share/keyrings/oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main" >/etc/apt/sources.list.d/oneAPI.list \
      && apt-get update && apt-get install -y intel-oneapi-ipp
    