echo "Ingrese un nombre para su container"
read container_name
echo "Ingrese el nombre de la imagen base"
read image_name

#!/usr/bin/env bash
docker run -ti \
           -e DISPLAY=${DISPLAY} \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v ${HOME}/.IdeaIC2016.1_docker:/home/developer/.IdeaIC2016.1 \
           -v $(pwd):/home/dev/app \
           --name="$container_name" "$image_name"
           