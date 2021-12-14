FROM jbo/rhe-buildbase as builder

LABEL  author = "Paul Harrison" \
       description = "sfxc runtime environment"\
       registry="jbo/sfxc"
       
ARG SFXC_VERSION=5.1

#see https://www.jive.eu/jivewiki/doku.php?id=sfxc
WORKDIR /usr/local/src


RUN yum -y update && yum install -y openmpi-devel fftw3-devel gsl-devel \
          glibc-devel.i686 libgfortran.i686 libgcc.i686 libstdc++-devel.i686  blas-devel lapack-devel  \
         && yum clean all

RUN svn export https://svn.astron.nl/sfxc/branches/stable-${SFXC_VERSION} sfxc-${SFXC_VERSION}
 
#have to put the FLIBS in below otherwise the 32bit build fails as the autoconf stuff puts explicit 64bit paths in         
RUN source /etc/profile.d/modules.sh && module load mpi && \
    cd sfxc-${SFXC_VERSION}/sfxc && ./compile.sh && ./configure CXX=mpicxx && make FLIBS=-lgfortran -lm -lquadmath && make install
      
RUN pip2 install --prefix=/usr/local/ ply && cd sfxc-${SFXC_VERSION}/vex && pip2 install --prefix=/usr/local/ .


RUN curl -OL https://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio3380.tar.gz && tar xvf cfitsio3380.tar.gz && \
     cd cfitsio && ./configure --prefix=/usr/local  && make -j4 install


RUN curl -O ftp://ftp.atnf.csiro.au/pub/software/wcslib/wcslib-7.7.tar.bz2 && tar xvjf wcslib-7.7.tar.bz2 && cd wcslib-7.7 \
      && ./configure --prefix=/usr/local && make -j4 && make install

RUN curl -OL https://github.com/casacore/casacore/archive/refs/tags/casacore-1.7.0.tar.gz \
     && tar xvzf casacore-1.7.0.tar.gz && cd casacore-casacore-1.7.0 && mkdir build && cd build \
     && cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr/local .. && make -j4 && make install
     
RUN git clone https://code.jive.eu/verkout/myvex && mkdir myvex/build && cd myvex/build \
     && cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. && make install
     
RUN git clone https://code.jive.eu/verkout/jive-casa && mkdir jive-casa/build && cd jive-casa/build \
    &&  cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DVEX_ROOT_DIR=/usr/local .. && make -j4

