xhost +local:docker
sudo docker run -it --net=host --ipc=host -e DISPLAY=$DISPLAY -v /tmp/.X11-unix --env="QT_X11_NO_MITSHM=1" --privileged --security-opt label:disable $1
