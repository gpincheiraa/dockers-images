echo "Ingrese el nombre de su imagen docker de node:"
read imagename
echo "Ingrese el nombre del container:"
read containername
echo "Ingrese nombre para su contenedor mongodb"
read mdbname
echo "Construyendo el contenedor para mongodb..."
docker run -d --name $mdbname mongo:3.2.9 
echo "Iniciando el contenedor por primera vez..."
docker run -it --name $containername -v $(pwd):/home/dev/app -p 3000:3000 -p 7006:7006 --link $mdbname:db $imagename
