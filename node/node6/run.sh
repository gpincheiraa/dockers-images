echo "Ingrese un nombre para el contenedor:"
read containername
docker run -it -p 7006:7006 -e "APP_PORT=7006" --name $containername -v $(pwd):/home/dev/app node6
