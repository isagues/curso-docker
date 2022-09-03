docker run --name static-nginx -p 80:80 -v ${PWD}/html:/usr/share/nginx/html:ro -d nginx
