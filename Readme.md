
# CSWeb con Docker-Compose para el INE GT
Este repositorio guarda una implementación de csweb por medio de contenedores de docker. Está hecho a la medida de la necesidad del INE. 

## Requisitos
Tener instalado docker y docker compose, clonar este repositorio. 

## Configuración
El archivo .env-example sirve como base para la configuración. Se puede hacer una copia y colocar los valores apropiados en el archivo. 
 ``` 
cp .env-example .env
```

## Ejecución 
Despues de haber configurado el archivo .env y nginx se ejecutar el comando: 
``` 
docker compose up -d
```

## Volumenes
Despues de desplegar el codigo la información  de la **base de datos** y los documentos en **csweb/files** se puede encontrar montados en la carpeta **".vols"**, db_data y csweb-files respectivamente. Esto con el fin de que los datos sean persistentes. Es probables que se deban establecer los permisos correctos a la carpeta .vols/csweb-files/ para esto se debe ejecutar el siguiente comando: 
```
sudo chown -R www-data:www-data ./.vols/csweb-files 
```


## Configuración de NGINX
CsWeb utiliza Symfony, pero carece de algunos estándares dentro de su código, por lo que unicamente se permite un nivel de profundidad en su ubicación de dominio. Para esta implementación se debe configurar el proxy server con el dominio que se desea. **Prestar especial atención a cuando se coloca la diagonal "/" como en */phpmyadmin/* y cuando no */csweb.*** La configuración necesaria para colocar dentro de *server{_}* : 
 ```
 location /phpmyadmin/ {
    proxy_pass         http://serverip:8080/;
    proxy_set_header   Host $host;
    proxy_set_header   X-Real-IP  $remote_addr;
    proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header   X-Forwarded-Proto $scheme;
    proxy_set_header   X-Forwarded-Host $host;
}
location /csweb {
    proxy_pass   http://serverip:85;
    proxy_set_header   Host              $host;
    proxy_set_header   X-Real-IP         $remote_addr;
    proxy_set_header   X-Forwarded-For   $proxy_add_x_forwarded_for;
    proxy_set_header   X-Forwarded-Proto $scheme;
    proxy_set_header   X-Forwarded-Host  $host;
    proxy_set_header   X-Forwarded-Port  $server_port;
}
 ```

