FROM centos:7

LABEL  author = "Paul Harrison" \
       description = "base build environment for centos-7"\
       registry="jbo/astrobuild-rhe"

WORKDIR /usr/local/src

RUN yum -y update && yum install -y autoconf automake binutils  \
    gcc gcc-c++ libtool make patch pkgconfig gcc-fortran gnupg2 \
    cmake git subversion bison flex doxygen  \
    && yum clean all
    
