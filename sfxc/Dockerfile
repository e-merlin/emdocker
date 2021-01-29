FROM jbo/astrobuild-rhe as builder

LABEL  author = "Paul Harrison" \
       description = "sfxc runtime environment"\
       registry="jbo/sfxc"


#see https://www.jive.eu/jivewiki/doku.php?id=sfxc
WORKDIR /usr/local/src

RUN svn checkout https://svn.astron.nl/sfxc/branches/stable-5.0 sfxc-5.0

RUN yum -y update && yum install -y openmpi-devel fftw3-devel gsl-devel \
          glibc-devel.i686 libgfortran.i686 libgcc.i686 libstdc++-devel.i686 \
         && yum clean all
         
RUN source /etc/profile.d/modules.sh && module load mpi && \
    cd sfxc-5.0/sfxc && ./compile.sh && ./configure CXX=mpicxx && make && make install
      
