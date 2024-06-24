FROM ubuntu:latest

WORKDIR /home
ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update -y
RUN apt-get install -y software-properties-common
RUN apt install -y python3-pip libopenmpi-dev
RUN apt-get update && apt-get install -y curl wget gcc build-essential libfuse2
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.5.12-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda
RUN apt-get install -y 
RUN /opt/conda/bin/conda config --append channels conda-forge
RUN /opt/conda/bin/conda create -y -n myenv python=3.8.16
RUN apt-get install -y wsclean
RUN apt-get install -y git
RUN git clone -b casa6 https://github.com/e-merlin/eMERLIN_CASA_pipeline.git /home/eMERLIN_CASA_pipeline
ENV PATH=/opt/conda/envs/myenv/bin:$PATH
RUN pip3 install protobuf==3.20.*
RUN pip3 install /home/eMERLIN_CASA_pipeline/.
