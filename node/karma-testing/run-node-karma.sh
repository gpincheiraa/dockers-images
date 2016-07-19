echo "Ingrese el nombre de su imagen docker de node:"
read imagename
echo "Ingrese un nombre para el contenedor:"
read containername

docker run -it --net='host' -v $(pwd):/home/dev/app --name='$containername' --privileged "$imagename"