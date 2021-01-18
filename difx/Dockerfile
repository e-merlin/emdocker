FROM jbo/astrobuild-deb as builder

LABEL  author = "Paul Harrison" \
       description = "difx" \
       registry = "jbo/difx"



#see https://www.atnf.csiro.au/vlbi/dokuwiki/doku.php/difx/installation
WORKDIR /usr/local/src

RUN svn co https://svn.atnf.csiro.au/difx/master_tags/DiFX-2.6.2

RUN apt-get update && apt-get install -y  openmpi-bin libopenmpi-dev python libexpat1-dev fftw3-dev libgsl-dev \
     && apt-get clean  
# would want to install pgplot5 too for some of the optional stuff (interactive?)


#https://software.intel.com/content/www/us/en/develop/articles/installing-intel-free-libs-and-python-apt-repo.html
RUN wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB && rm  GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB \
      && echo deb https://apt.repos.intel.com/ipp all main > /etc/apt/sources.list.d/intel-ipp.list \
      && apt-get update && apt-get install -y intel-ipp-2019.5-075
      

# FIXME needs vex2difx> ./configure --prefix=${DIFXROOT}  LEXLIB=
RUN cd DiFX-2.6.2 && source setup.bash && cd applications/vex2difx/ && aclocal && libtoolize --copy --force && \
  autoconf && autoheader && automake -a && ./configure --prefix=${DIFXROOT} LEXLIB=
RUN cd DiFX-2.6.2 && source setup.bash && ./install-difx 


#TODO copy into own smaller as mult stage build




      
