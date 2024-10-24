#!/bin/bash
set -e

# Cambiar permisos para el directorio csweb-files
chown -R www-data:www-data /var/www/html/${PROXY_PATH}/files

# Iniciar cron en segundo plano
service cron start

exec "$@"