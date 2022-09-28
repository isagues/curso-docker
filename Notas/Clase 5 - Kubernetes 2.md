# Kubernetes

Sevicio => Pod consumible por otros. Es un proxy reverso / load balancer que maneja el trafico de entrada.

El servicio distribuye los pedidos en base al selector y los labels usados.

Cuando se genera el servicio se genera con una IP dentro del cluster de k8s, no tiene una IP publica por defecto.

Los servicios permiten rutear hacia los pods.

ClusterIP => IP adentro del cluster. (el mas usado)
NodePort => Exponer un puerto. Se le pega a cualquier nodo del cluster y todos escuchan en el mismo puerto.
LoadBalancer => LB externo.

En general clusterIP y otro servicio para sacar a internet.

Ingress => necesita un ingressController. Distribuir pedidos en base a reglas. Implementaciones basadas en nginx, trawfic(?), HAProxy, etc. En el mundo de la nube, esto lo provee el cloud provider.

Conf tipica:
Ingress => Service => Pods

Configmap => Cargar variables de entorno y archivos de config.

Daemon set => Un pod en cada uno de los nodos del cluster. Util para monitoreo o manejo de los nodos.

Jobs / Cron jobs => Jobs ejecucion unica. Por ejemplo, ejecutar una migracion de DB. Cron jobs => ejecucion recurrente. Se pueden poner reglas para hacer retries de la tarea, timeouts, etc.

Volumen => montar volumen a los containers. Puden ser distintas cosas dependiendo la implementacion.

Stateful Sets => aplicaciones con estado. Hacer un proceso mas especifico de como levantar y manejar los pods que se levantan.

Operators => usar kubernetes para correr aplicacions. Aplicaciones que quieren manipular kubernetes. Podria usarse para que jenkins corra los builds en pods especificos.

Recursos y quotas

- request => cantidad minima
- limit => cantidad maxima

Se puede usar recursos entre request y limit en base a la disponibilidad de los mismos. Se pueden definir a nivel namespace.

Probes => formas de que k8s sepa el estado de la aplicacion (healthchecks). Liveness, readiness, startup.

> IaaC => descriptores/manifestos
> No usar latest
> Definir Quotas
> Definir probes