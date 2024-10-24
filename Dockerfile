FROM php:8.2-apache

ARG MYSQL_DATABASE=cspro
ARG MYSQL_USER=cspro
ARG MYSQL_PASSWORD=changeme
ARG API_URL=http://localhost/csweb/api
ARG PROXY_PATH=csweb
ARG TIMEZONE=UTC

ENV PROXY_PATH=${PROXY_PATH}
# Use production php settings
# RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY php.ini "$PHP_INI_DIR/php.ini"

# php-zip support
RUN set -eux; \
	apt-get update; \
	apt-get install -y zlib1g-dev libzip-dev unzip cron; \
	docker-php-ext-install zip; \
	docker-php-ext-install pdo_mysql 

# enable mod_rewrite and allow override from .htacess files
RUN set -eux; \
	a2enmod rewrite; \
	sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# download and unzip csweb source

RUN set -eux; \
	curl -o csweb.zip -fSL https://www.csprousers.org/downloads/cspro/csweb8.0.1.zip; \
	unzip csweb.zip -d /var/www/html/$PROXY_PATH/; \
	chown -R www-data:www-data /var/www/html/; \
	rm csweb.zip;\
	sed -i "/require __DIR__.'\/vendor\/autoload.php';/a\if (isset(\$_SERVER['HTTP_X_FORWARDED_PROTO']) && \$_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') {\n    \$_SERVER['HTTPS'] = 'on';\n}" /var/www/html/$PROXY_PATH/app.php; 


# configuration file
 RUN set -eux; \
 echo "<?php define('DBHOST', 'mysql'); define('DBUSER', '$MYSQL_USER'); define('DBPASS', '$MYSQL_PASSWORD'); define('DBNAME', '$MYSQL_DATABASE'); define('ENABLE_OAUTH', true); define('FILES_FOLDER', '/var/www/html/$PROXY_PATH/files'); define('DEFAULT_TIMEZONE', '$TIMEZONE'); define('MAX_EXECUTION_TIME', '300'); define('API_URL', '$API_URL'); define('CSWEB_LOG_LEVEL' , 'error'); define('CSWEB_PROCESS_CASES_LOG_LEVEL', 'error'); ?>" > /var/www/html/$PROXY_PATH/src/AppBundle/config.php

# Instalación de cron y otras dependencias necesarias
RUN set -eux; \
    apt-get update; \
    apt-get install -y cron; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*

# Configuración del cron job
RUN chmod 755 /var/www/html/$PROXY_PATH/bin/console

RUN echo "*/2 * * * * /usr/local/bin/php /var/www/html/${PROXY_PATH}/bin/console csweb:process-cases >> /var/log/cron.log 2>&1" > /etc/cron.d/process-cases && \
    chmod 0644 /etc/cron.d/process-cases && \
    crontab /etc/cron.d/process-cases 



# Script de inicio para Apache y cron
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["apache2-foreground"]


