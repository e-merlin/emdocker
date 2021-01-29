FROM centos:7

LABEL  author = "Paul Harrison" \
       description = "base run environment for centos-7"\
       registry="jbo/astrorun-rhe"

WORKDIR /usr/local/src


RUN yum -y update && yum install -y curl  python3 \
    && yum clean all
    
