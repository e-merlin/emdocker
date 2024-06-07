Docker build for the casa6 e-MERLIN pipeline with conda casa installtion
========================================================================

The command to build this container is as follows:

```
docker build . -t <docker_image_tag>
```

Subsequently, the container can be run with the following command

```
./docker_run_command.sh <docker_image_tag>
```

No data is included within the container so it will need to be added by 
altering the Dockerfile, docker_run_command.sh or other means. 
