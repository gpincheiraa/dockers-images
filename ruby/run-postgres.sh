echo "Ingrese un nombre para la imagen de la base de datos : "
read imagename
echo "Ingrese una version para postgres : "
read pgsqlversion

docker run --name "$imagename" -p 5432:5432 -e POSTGRESQL_USER="postgres" postgres:"$pgsqlversion"