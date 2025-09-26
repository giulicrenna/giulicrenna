# Universidad Técnológica Nacional
## Arquitectura y Sistemas Operativos
### Docente: Giuliano Crenna

---
Ir escribiendo los comandos utilizados en un archivo `ejercicio_volumenes.txt`.


# Ejercicio 1

Crear un volumen llamado, `mysql`, `mongodb`, etc.

# Ejercicio 2

Inspeccionar los volúmenes creados e ingresar al punto de montaje de los mismos y crear archivos de ejemplos.

# Ejercicio 3

Crear una instancia de MySql usando el volumen `mysql` montando en `/var/lib/mysqk`.

# Ejercicio 4

Simular un fallo, deteniendo y removiendo el contenedor, volver a crearlo con el mismo volumen y verificar la existencia de los datos.

# Ejercicio 5

Realizar los mismos pasos anteriores, con una instancia de MongoDB, haciendo un bind a una carpeta local en `/home/mongodb/data`.

# Ejercicio 6

Crear un script llamado `listar_volumen_mysql.sh` que liste los archivos del volumen.

# Ejercicio 7

Crear un script llamado `limpiar_volumen.sh` que reciba el nombre de un volumen y lo elimine por completo.