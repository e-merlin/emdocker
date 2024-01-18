FROM jbo/ubu-buildbase as builder

LABEL  author = "Paul Harrison" \
       description = "difx" \
       registry = "jbo/difx"



#see https://github.com/difx/difx
WORKDIR /usr/local/src

RUN apt-get update && apt-get install -y  pgplot5 libplplot-dev openmpi-bin libopenmpi-dev python2 libexpat1-dev libfftw3-dev libgsl-dev \
     && apt-get clean  

      
RUN git clone https://github.com/e-merlin/difx.git -b emubuntu



#RUN wget ftp://ftp.astro.caltech.edu/pub/pgplot/pgplot522.tar.gz && tar xvf pgplot522.tar.gz  && mkdir /usr/local/pgplot && cd /usr/local/pgplot \
#         && grep NUDRIV /usr/local/src/pgplot/drivers.list > drivers.list \
#         && perl -n -e 'if( /^! (GIDRIV|PNDRIV|PSDRIV)(.*)$/){print $1,$2,"\n"}' /usr/local/src/pgplot/drivers.list >>drivers.list \
#         &&  /usr/local/src/pgplot/makemake /usr/local/src/pgplot linux g77_gcc_aout \
#         && make FCOMPL=gfortran lib grfont.dat


#leave out hops for now
RUN cd difx &&  /bin/bash -c  "source setup.bash && IPPROOT=/opt/intel/oneapi/ ./install-difx --nodoc --withmonitor --withfb --withguiserver"
#RUN rm -rf difx
#
#
##TODO copy into own smaller as multi stage build
FROM jbo/ubu-runbase

COPY --from=builder /usr/local/ /usr/local/




      
