# If not working, first do: sudo rm -rf /tmp/.docker.xauth
# It still not working, try running the script as root.
## Build the image first
### docker build -t <yourDockerfile> .

xhost +local:docker
#xhost +si:localuser:root


docker run -it \
    --name=Container_HumbleZED_Rosie_V1 \
    --privileged \
    --net=host \
    --cap-add=NET_ADMIN \
    --cap-add=SYS_ADMIN \
    --device=/dev/net/tun \
    --gpus all \
    --runtime nvidia \
    --env NVIDIA_DRIVER_CAPABILITIES=all \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix/:/tmp/.X11-unix" \
    --volume /dev:/dev \
    --volume="/<RepertoryWhereYouWantShareWithDocker>:/root/Documents/Rosie_Project/ros-docker/share" \
    lmontagnon/project_rosie:Image_HumbleZed_Rosie_V1p \

echo "Done."
