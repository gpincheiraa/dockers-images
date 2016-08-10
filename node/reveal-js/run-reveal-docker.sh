echo "Ingrese el nombre de su imagen docker de reveal.js:"
read imagename
echo "Ingrese un nombre para el contenedor:"
read containername

docker run --net=host -d -v $(pwd):/slides/ --name="$containername" "$imagename"