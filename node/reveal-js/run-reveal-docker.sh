echo "Ingrese el nombre de su imagen docker de reveal.js:"
read imagename
echo "Ingrese un nombre para el contenedor:"
read containername

docker run -d -v $(pwd):/slides/ -p 8000:8000 --name="$containername" "$imagename"