# Universidad Técnológica Nacional
## Arquitectura y Sistemas Operativos
### Docente: Giuliano Crenna

---

# Ejercicios de Docker y Docker-Compose

## Requisitos previos

- Docker Engine y Docker Compose Plugin instalados (`docker --version`, `docker compose version`).
- Usuario agregado al grupo `docker` (Linux) o ejecutar con privilegios.
- Carpeta de trabajo vacía para estos ejercicios.

---

# PARTE A — Ejercicios con `docker-compose`

### A01 — Nginx sirviendo HTML local
**Objetivo.** Publicar una carpeta local por HTTP.  
**Consigna.** Montá `./site` como raíz web y exponé en `http://localhost:8080`.  
**Pistas.** Imagen `nginx:alpine`, volumen de solo lectura.  
**Evaluación.** Abrir `index.html` desde el navegador.

---

### A02 — Redis con modo AOF
**Objetivo.** Ejecutar Redis con persistencia AOF.  
**Consigna.** Exponer 6379 y habilitar `appendonly yes`.  
**Pistas.** Usar `command` en compose.  
**Evaluación.** `redis-cli PING` → `PONG`.

---

### A03 — Postgres con volumen nombrado
**Objetivo.** DB persistente y usuario propio.  
**Consigna.** Crear DB `appdb`, user `appuser/appPass!`, puerto 5432.  
**Evaluación.** Conectarse y listar tablas.

---

### A04 — MongoDB + Mongo Express
**Objetivo.** DB + panel web.  
**Consigna.** Panel en `http://localhost:8081` con basic auth `admin/admin`.  
**Evaluación.** Crear colección desde UI.

---

### A05 — WordPress + MariaDB
**Objetivo.** CMS completo local.  
**Consigna.** Levantar WordPress en `http://localhost:8082`.  
**Evaluación.** Completar instalador inicial.

---

### A06 — MinIO (S3 compatible) con consola
**Objetivo.** Storage de objetos local.  
**Consigna.** UI en `http://localhost:9001` (admin/adminadmin).  
**Evaluación.** Crear bucket y subir archivo.

---

### A07 — RabbitMQ con Management
**Objetivo.** Mensajería con panel.  
**Consigna.** Panel en `http://localhost:15672` (admin/admin).  
**Evaluación.** Crear cola y publicar mensaje.

---

### A08 — Portainer CE
**Objetivo.** Administrar Docker por UI.  
**Consigna.** Acceso en `https://localhost:9443`.  
**Pistas.** Montar `docker.sock`.  
**Evaluación.** Crear usuario inicial.

---

### A09 — Prometheus + Grafana (mínimo)
**Objetivo.** Observabilidad local.  
**Consigna.** Grafana en `http://localhost:3000` (admin/admin).  
**Evaluación.** Datasource Prometheus apuntando a `http://prometheus:9090`.

---

### A10 — Traefik reverse proxy + whoami
**Objetivo.** Enrutamiento por hostname local.  
**Consigna.** Acceder a `http://whoami.localhost`.  
**Evaluación.** Respuesta del servicio con datos del request.

---

# PARTE B — Ejercicios con `docker run`

### B01 — Servir HTML con Nginx (bind mount)
**Consigna.** Publicar `./site` en `:8080`.  
**Evaluación.** Ver `index.html` en navegador.

---

### B02 — BusyBox HTTP estático
**Consigna.** Serví `./pub` con `busybox httpd` en `:8083`.  
**Pistas.** `--entrypoint` y `-f` foreground.  
**Evaluación.** `curl localhost:8083`.

---

### B03 — Postgres con límites de recursos
**Consigna.** Levantar PG16 con `--cpus 1.5` y `-m 1g`.  
**Evaluación.** Verificar con `docker stats` y conexión a la DB.

---

### B04 — Alpine interactivo con usuario no root
**Consigna.** Entrar con shell como UID:GID `1000:1000`.  
**Evaluación.** `id` dentro del contenedor.

---

### B05 — Red Bridge custom entre contenedores
**Consigna.** Crear red `labnet` y levantar 2 contenedores que se resuelvan por nombre.  
**Evaluación.** `ping` entre ambos.

---

### B06 — Variables de entorno y `--env-file`
**Consigna.** Levantar `nginx` con `APP_ENV=dev` definido en archivo `.envapp`.  
**Evaluación.** Inspeccionar variable de entorno.

---

### B07 — Montaje explícito con `--mount`
**Consigna.** Montar `./data` en `/data` modo solo-lectura con sintaxis `--mount`.  
**Evaluación.** Listar contenido dentro.

---

### B08 — Cambiar `--entrypoint` (diagnóstico)
**Consigna.** Ejecutar `nginx:alpine` con `--entrypoint sh` y revisar `/etc/nginx`.  
**Evaluación.** Listado exitoso.

---

### B09 — Healthcheck y `--restart`
**Consigna.** Levantar `nginx` con un healthcheck de `curl -f localhost`.  
**Evaluación.** `docker inspect` → `State.Health.Status`.

---

### B10 — GPU (opcional, si hay NVIDIA)
**Consigna.** Ejecutar `nvidia-smi` dentro de un contenedor CUDA.  
**Evaluación.** Ver listado de GPUs.
