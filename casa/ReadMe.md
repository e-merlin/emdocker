Casa 6 Docker Image
===================

This builds a docker image for casa 6 modular installation as per
https://casadocs.readthedocs.io/en/v6.4.0/notebooks/introduction.html?highlight=modular#Modular-Packages

Tried a multi-stage build, but it did not save that much really as all that 
is saved is the actual build tools

using
-----

The container is run as a "casauser" user and there is a volume declared that appears
as the "data" directory below that user's home, so to connect a directory outside the
container use something like

      docker run -it -v $HOME/Work/jb/emblinefit/:/home/casauser/data jbo/casa

then inside the contaer
run with ipython

      import casatools
      import casatasks
      help(casatools)
      
to run a script and then drop into ipython

      ipython -i script.py -- <any script args>
      

known problems
--------------

Note that the MPI configuration does not appear to be working in the docker container 

