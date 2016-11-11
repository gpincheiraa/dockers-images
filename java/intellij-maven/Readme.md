**Intellij Docker**


Para generar la imagen en la máquina local ejecutar:

 `sh build.sh`


Para generar un container, primero debemos estar en el directorio en el cual tenemos nuestro código. Esto es de vital importancia ya que el script utilizará este directorio para montarlo como volumen dentro del container.

 `cd ~/my_project && sh ~/directorio_donde_estan_las_imagenes_docker/java/intellij-maven/run-intellij.sh`
