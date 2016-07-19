echo "Ingrese el nombre de su imagen docker de ruby on rails:"
read imagename
echo "Ingrese un nombre para el contenedor:"
read containername
echo "Ingrese el nombre de su imagen postgres:"
read postgresimage

docker run -it --name="$containername" --link "$postgresimage":db -p 3000:3000 -v $(pwd):/home/dev/app "$imagename"