FROM centos:7

LABEL  author = "Paul Harrison" \
       description = "base build environment for centos-7"\
       registry="jbo/rhe-astrobuild"

WORKDIR /usr/local/src

RUN yum -y update && yum install -y epel-release autoconf automake binutils  \
    gcc gcc-c++ libtool make patch pkgconfig gcc-gfortran gnupg2 \
    git subversion bison-devel flex-devel doxygen python3 bzip2 \
    && yum clean all
    
RUN yum -y update && yum install -y cmake cmake3 \
    && yum clean all
    
#https://www.intel.com/content/www/us/en/developer/articles/guide/installing-free-libraries-and-python-yum-repo.html

RUN yum-config-manager --add-repo https://yum.repos.intel.com/ipp/setup/intel-ipp.repo \
    && rpm --import https://yum.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB \
    && yum install -y intel-ipp-2019.5-075
    
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py && python get-pip.py 