# Orquestadores y Kubernetes

Desafios de docker en prod.

- Single point of failure
- Manejar instancias distribuidas no viene incluido
- Escalabilidad limitada

Para resolver esta problematica => orquestadores.

Los orquestadores manejan una pool de nodos y se encargan de hacer el deploy de las aplicaciones. Brindan disponibilidad, escalabilidad y organizacion.

- Kubernetes
- Docker Swarm => itento de la compañia docker.
  - Nativo de docker.
  - Util para el caso que se usa compose.
  - Bastante simple de empezar a utilizar.
- Apache Mesos
- Rancher
- Nomad

## Kubernetes

Actualmente funciona con Docker pero sepodria migrar a otro motor de contenedores

Opciones cloud: EKS, GKE, AKS, OpenShift, KaaS

K8s ofrece alguns puntos de expansion que se pueden definir en la instalacion.
OpenShift, fork de kubernetes.

- kubeadmin
- kubectl => kube control

`.kube/config` => confiuracion de conexion del kubectl. `KUBECONFIG` sino.

`alias k='kubectl'`

- **Pod
  - Pod agrupa contenedores. Tipicamente tiene un solo contenedor. Si tengo mas de un contenedor suelen ser para dar servicio a la aplicacion, ej: exportar logs de la aplicacion.
  - Un pod esta en un unico nodo.
  - `k run pingapp --image=nicopaez/pingapp:2.1.0` Genera un pod que adentro tiene un contendor
  - Puedo modificar la imagen que utiliza un pod `k set image pod/pingap pingapp=nicopaez/pingapp:2.0.1`.
  - Puedo analizar el pod `k describe pod/pingapp`
- Replica Set
- **Service
- Ingress
- **Configmap => Definir configuracion.
- **Secret
- Namespace => Dividir logicamente el cluster. Aislamiento. Asociar recursos, permisos, politicas.
  - Deberia definirse de antemano en base a los equipos o caso de uso. Despues no se modificaria mucho.
  - `kubectl create namespace <nombre>`
  - Puedo usarlo en otros pedidos como `kubectl get all` con el parametro `-n <nombre>` o cambiar el namespace default de mi conexion `kubectl config set-context --current --namespace=balanz2`
- *Daemon Set
- *Jobs / Cron
- *Volumes
- *Sateful Sets
- **Deployments

Kubectl analiza el comando y lo envia al daemon. Kubectl siempre devuelve bien y encola el pedido. Hay que revisar mas alla del success que nos devuelve el kubectl y verificar que en el daemon esten las cosas como espero.

Recursos. Pod es un tipo de recurso, namespaces es otro.

Minikube permite trabajar con Docker, VirtualBox, VMWare, etc. Esta bueno usar VMs para hacer pruebas. Si algo se rompe se borra la VM y chau.

## Infrastructure as Code

Kubernetes se suele manejar con archivos de configuracion. Infrastructure as Code.

`k apply -f deployment.yaml`

- Kind => tipo de recurso que estamos deccribiendo. Ej: deployment (permite agrupar replica sets con pods)
- Metadata => nombre, labels, etc.
- Spec => Especifiacion del recurso en si
  - Replicas
    - Tiene un selector que le indica que pods mantener replicados
  - Template => descripcion del pod a generar con sus containers a usar y la config del mismo. Tambien tiene metadata que permite ser encontrado por el replica-set.

En el deployment genere un replicaset de 1 instancia y le asocie un pod. Si yo borro el pod a mano, el replicaset va a causar que se genere otro pod equivalente. El deployment representa recursos que quiero deployear de forma similar, por lo general un pod y su replica set.

Si modifico la configuracion, se van a aplicar las diferencias.

Los pods son volatiles, puede caerse el nodo, puede kubectl cambiar de nodo y matar el pod.

Los labels permiten agrupar muchos recursos y analizarlos o manejarlos en conjunto.

Puedo definir variables de entorno en el deployment.

## Extra

`winpty kubectl exec -it pingapp -- "bash"`