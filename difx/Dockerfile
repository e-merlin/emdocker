FROM jbo/ubu-buildbase as builder

LABEL  author = "Paul Harrison" \
       description = "difx" \
       registry = "jbo/difx"



#see https://github.com/difx/difx
WORKDIR /usr/local/src

RUN apt-get update && apt-get install -y  pgplot5 openmpi-bin libopenmpi-dev python2 libexpat1-dev libfftw3-dev libgsl-dev \
     && apt-get clean  

      
RUN git clone https://github.com/difx/difx -b dev


RUN wget ftp://ftp.astro.caltech.edu/pub/pgplot/pgplot522.tar.gz && tar xvf pgplot522.tar.gz  && mkdir /usr/local/pgplot && cd /usr/local/pgplot \
         && grep NUDRIV /usr/local/src/pgplot/drivers.list > drivers.list \
         && perl -n -e 'if( /^! (GIDRIV|PNDRIV|PSDRIV)(.*)$/){print $1,$2,"\n"}' /usr/local/src/pgplot/drivers.list >>drivers.list \
         &&  /usr/local/src/pgplot/makemake /usr/local/src/pgplot linux g77_gcc_aout \
         && make FCOMPL=gfortran lib grfont.dat

# this complexity is  because vex2difx needs ./configure --prefix=${DIFXROOT}  LEXLIB= lex setup is wrong - could perhaps do with a copy of the Makefile.in

#RUN cd DiFX-2.6.2 &&  perl -p -i -e 's/\$\{LEXLIB\}//g' applications/vex2difx/configure.ac
RUN cd DiFX-2.6.2 &&  /bin/bash -c  "source setup.bash && ./install-difx --nodoc --withmonitor --withfb --withguiserver --withhops"
RUN rm -rf DiFX-2.6.2


#TODO copy into own smaller as multi stage build
FROM jbo/deb-runbase
# try to install only the runtime
RUN curl -fSLO https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && rm  GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB \
      && echo deb https://apt.repos.intel.com/ipp all main > /etc/apt/sources.list.d/intel-ipp.list \
      && apt-get update && apt-get install -y intel-ipp-st-2019.5-281 intel-ipp-mt-2019.5-281 \
      && apt-get clean 
COPY --from=builder /usr/local/ /usr/local/




      
