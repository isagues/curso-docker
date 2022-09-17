# Ejercicio 9

Agrego un nginx como proxy para haprovechar que hay 2 redes.

Postgres me permite pasarle las variables de entorno via un archivo, para esto existen las variables `<VAR>_FILE`. Lo cual es util ya que los secretos estan guardados como archivos en `/run/secrets`.

Generando redes separadas poemos hacer que se vean entre si solo los servicios que lo necesitan.

Red del back:

    docker network inspect backend | jq '.[].Containers | to_entries | .[].value.Name'
    "ej9-web-1"
    "ej9-db-1"

Red del front:

    docker network inspect frontend | jq '.[].Containers | to_entries | .[].value.Name'
    "ej9-web-1"
    "ej9-proxy-1"