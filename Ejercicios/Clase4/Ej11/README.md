# Ej 11

Para ejecutar el deployment con los 3 pods basta con correr `kubectl apply -f deployment.yml`.

Para verificar el funcionamiento hay que conectarrse al container `kubectl exec -it <pod_id> --  bash` y hacer un curl.

    ~/curso-docker/Ejercicios/Clase4/Ej11 ❯ kubectl exec -it pod/password-api-5f7dc647df-z42t4 --  bash
    root@password-api-5f7dc647df-z42t4:/usr/src/app# curl localhost:3000/password
    {"password":"!256Aa<<==Hh"}