FROM jbo/deb-buildbase as builder

LABEL  author = "Paul Harrison" \
       description = "difx" \
       registry = "jbo/difx"



#see https://www.atnf.csiro.au/vlbi/dokuwiki/doku.php/difx/installation
WORKDIR /usr/local/src

RUN apt-get update && apt-get install -y  openmpi-bin libopenmpi-dev python libexpat1-dev fftw3-dev libgsl-dev \
     && apt-get clean  
# would want to install pgplot5 too for some of the optional stuff (interactive?)


      
RUN svn export https://svn.atnf.csiro.au/difx/master_tags/DiFX-2.6.2

# this complexity is  because vex2difx needs ./configure --prefix=${DIFXROOT}  LEXLIB= lex setup is wrong - could perhaps do with a copy of the Makefile.in

RUN cd DiFX-2.6.2 &&  perl -p -i -e 's/\$\{LEXLIB\}//g' applications/vex2difx/configure.ac
RUN cd DiFX-2.6.2 &&  /bin/bash -c  "source setup.bash && ./install-difx --nodoc"
RUN rm -rf DiFX-2.6.2


#TODO copy into own smaller as multi stage build
FROM jbo/deb-runbase
# try to install only the runtime
RUN curl -fSLO https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && rm  GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB \
      && echo deb https://apt.repos.intel.com/ipp all main > /etc/apt/sources.list.d/intel-ipp.list \
      && apt-get update && apt-get install -y intel-ipp-st-2019.5-281 intel-ipp-mt-2019.5-281 \
      && apt-get clean 
COPY --from=builder /usr/local/ /usr/local/




      
