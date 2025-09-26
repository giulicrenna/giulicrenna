# Universidad Técnológica Nacional
## Arquitectura y Sistemas Operativos
### Docente: Giuliano Crenna

---

# Comando Docker

Docker es una plataforma que permite desarrollar, enviar y ejecutar aplicaciones en contenedores. Los contenedores son entornos ligeros y portátiles que incluyen todo lo necesario para ejecutar una aplicación.

## Comandos Comunes

1. **docker run**: Ejecuta un contenedor a partir de una imagen.
   ```bash
   docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
   ```

2. **docker ps**: Lista los contenedores en ejecución.
   ```bash
   docker ps
   ```

3. **docker images**: Muestra las imágenes disponibles en el sistema.
   ```bash
   docker images
   ```

4. **docker stop**: Detiene un contenedor en ejecución.
- `--config <dir>` → Usar un directorio de configuración distinto.  
- `--help` → Muestra ayuda.  
- `--version` → Muestra la versión de Docker.

**Ejemplo:**
```bash
docker -D ps -a
```

*Ejecuta `docker ps -a` en modo debug.*

---

## Comando `docker run`

Crea y ejecuta un nuevo contenedor.

### Flags comunes

* `-d` → Detached, corre en segundo plano.
* `--name <nombre>` → Nombre al contenedor.
* `-it` → Interactivo con TTY.
* `--rm` → Eliminar contenedor al salir.
* `-p HOST:CONT` → Publicar puerto.
* `-v SRC:DEST[:ro]` → Montar volumen/bind mount.
* `-e CLAVE=VAL` → Definir variables de entorno.
* `--network <nombre>` → Seleccionar red.
* `--cpus <n>` / `-m <memoria>` → Limitar recursos.

### Ejemplo

```bash
docker run -d --name web -p 8080:80 nginx:alpine
```

*Levanta Nginx en segundo plano accesible en `http://localhost:8080`.*

---

## Comando `docker ps`

Lista contenedores en ejecución.

### Flags comunes

* `-a` → Incluye contenedores detenidos.
* `-q` → Muestra solo IDs.
* `--filter "status=exited"` → Filtra por estado.
* `--format` → Personaliza salida.

### Ejemplo

```bash
docker ps -a --filter "name=web"
```

*Muestra todos los contenedores con "web" en su nombre.*

---

## Comando `docker logs`

Ver logs de un contenedor.

### Flags comunes

* `-f` → Seguir logs en tiempo real.
* `--tail N` → Últimas N líneas.
* `--since 10m` → Logs desde hace 10 minutos.
* `-t` → Incluir timestamps.

### Ejemplo

```bash
docker logs -f --tail 50 web
```

*Ve los últimos 50 logs y sigue mostrando en vivo.*

---

## Comando `docker exec`

Ejecuta comandos dentro de un contenedor.

### Flags comunes

* `-it` → Sesión interactiva con TTY.
* `-u UID:GID` → Ejecutar como usuario específico.
* `-w <dir>` → Directorio de trabajo.
* `-e VAR=VAL` → Variables de entorno adicionales.

### Ejemplo

```bash
docker exec -it web sh
```

*Abre una shell dentro del contenedor `web`.*

---

## Comando `docker images`

Lista imágenes disponibles localmente.

### Flags comunes

* `-a` → Incluye capas intermedias.
* `-q` → Solo IDs.
* `--digests` → Muestra hash de digest.
* `--filter "dangling=true"` → Imágenes huérfanas.

### Ejemplo

```bash
docker images --filter "reference=nginx*"
```

*Muestra imágenes locales de Nginx.*

---

## Comando `docker pull` y `docker push`

### Ejemplo pull

```bash
docker pull --platform linux/amd64 nginx:alpine
```

*Descarga Nginx para arquitectura amd64.*

### Ejemplo push

```bash
docker tag webapp:latest usuario/webapp:v1
docker push usuario/webapp:v1
```

*Sube imagen etiquetada al registro.*

---

## Comando `docker build`

Construye una imagen desde un `Dockerfile`.

### Flags comunes

* `-t nombre:tag` → Etiquetar imagen.
* `-f Dockerfile` → Dockerfile alternativo.
* `--build-arg CLAVE=VAL` → Argumentos de build.
* `--no-cache` → Sin usar caché.
* `--platform` → Multi-arch.

### Ejemplo

```bash
docker build -t miapp:dev --build-arg ENV=dev .
```

*Crea la imagen `miapp:dev` con argumento `ENV=dev`.*

---

## Comando `docker network`

Administrar redes.

### Ejemplo crear y usar

```bash
docker network create labnet
docker run -d --name s1 --network labnet alpine sleep 1d
docker run -d --name s2 --network labnet alpine sleep 1d
docker exec s1 ping -c1 s2
```

---

## Comando `docker volume`

Gestionar volúmenes.

### Ejemplo

```bash
docker volume create datos_pg
docker run -d --name pg -e POSTGRES_PASSWORD=123 \
  -v datos_pg:/var/lib/postgresql/data postgres:16
```

*Se crea un volumen persistente para la DB.*

---

## Comando `docker inspect`

Muestra detalles en formato JSON.

### Ejemplo

```bash
docker inspect -f '{{.NetworkSettings.IPAddress}}' web
```

*Muestra IP interna del contenedor `web`.*

---

## Comando `docker stats`

Monitoreo en tiempo real de recursos.

### Ejemplo

```bash
docker stats
```

*Muestra CPU, memoria y red en tiempo real.*

---

## Comando `docker system prune`

Limpieza de recursos no usados.

### Flags comunes

* `-f` → Forzar.
* `-a` → Incluye imágenes sin referencia.
* `--volumes` → Borra volúmenes no usados.

### Ejemplo

```bash
docker system prune -af --volumes
```

*Limpia todo lo no usado.*

---
