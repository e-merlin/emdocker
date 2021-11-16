FROM jbo/rhe-buildbase as builder

LABEL  author = "Paul Harrison" \
       description = "casa deployment" \
       registry = "jbo/casa"

#see https://casadocs.readthedocs.io/en/v6.4.0/notebooks/introduction.html?highlight=modular#Modular-Packages
# needed at runtime 
RUN yum install -y python3 libgfortran openmpi-devel

RUN useradd -ms /bin/bash casauser

# needed for calc install
RUN yum install -y python3-devel
# not needed if we get rid of casaplotms
#RUN yum install -y xorg-x11-server-Xvfb

USER casauser
WORKDIR /home/casauser

RUN pip3 install --user casatasks==6.4.0.16
RUN pip3 install --user  casatools
RUN pip3 install --user ipython wheel astropy
#NRAO recommend not doing this for casa6 - needs the dummy X server use xvfb-run casa - literally does not work at the moment
#RUN pip3 install --user  casaplotms==1.3.2


#mpi not working in docker.....
RUN source /etc/profile.d/modules.sh && module load mpi && \
    pip3 install --user  casampi


RUN git clone https://gitlab.com/ska-telescope/external/almacalc.git && cd almacalc && pip3 install --user .[highlevel] \
    && pip3 install --user  attr pandas uncertainties

#get rid of the pip cache
RUN  pip3 install --user --upgrade pip && pip3 cache purge

#runtime build below
FROM jbo/rhe-runbase

RUN yum install -y python3 libgfortran openmpi \
    && yum clean all

RUN useradd -ms /bin/bash casauser
COPY --from=builder /home/casauser/ /home/casauser
COPY --from=builder /usr/local/ /usr/local
USER casauser
WORKDIR /home/casauser

#setup environments
COPY bashenv .bashenv
RUN echo "[[ -s ~/.bashenv ]] && source ~/.bashenv" >> .bash_profile \
    && echo "[[ -s ~/.bashenv ]] && source ~/.bashenv" >> .bashrc
ENV BASH_ENV=/home/casauser/.bashenv

#does not (yet?) work in modularised casa
#RUN curl -fSL ftp://ftp.cv.nrao.edu/pub/casaguides/analysis_scripts.tar | tar xvf - 
COPY startup.py .casa/config.py


RUN mkdir data
VOLUME /home/casauser/data







      
