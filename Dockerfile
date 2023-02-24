FROM php:7.3-apache

ARG MYSQL_DATABASE=cspro
ARG MYSQL_USER=cspro
ARG MYSQL_PASSWORD=changeme
ARG DEFAULT_TIMEZONE=UTC
ARG DEFAULT_TIMEZONE=UTC
ARG API_URL= http://localhost/csweb/api
ARG PROXY_PATH= csweb

# Use production php settings
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# php-zip support
RUN set -eux; \
	sed -i "s#deb http://deb.debian.org/debian buster main#deb http://deb.debian.org/debian buster main contrib non-free#g" /etc/apt/sources.list; \
	apt-get update; \
	apt-get install -y zlib1g-dev libzip-dev unzip; \
	docker-php-ext-install zip; \
	docker-php-ext-install pdo_mysql

# enable mod_rewrite and allow override from .htacess files
RUN set -eux; \
	a2enmod rewrite; \
	sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# download and unzip csweb source

RUN set -eux; \
	curl -o csweb.zip -fSL https://www2.census.gov/software/cspro/download/csweb.zip; \
	unzip csweb.zip -d /var/www/html/$PROXY_PATH/; \
	chown -R www-data:www-data /var/www/html/; \
	rm csweb.zip;\
	sed -i "/require __DIR__.'\/vendor\/autoload.php';/a\if (isset(\$_SERVER['HTTP_X_FORWARDED_PROTO']) && \$_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https') {\n    \$_SERVER['HTTPS'] = 'on';\n}" /var/www/html/$PROXY_PATH/app.php; 


# configuration file
# RUN set -eux; \
# echo "<?php \
# define('DBHOST', 'mysql');\
# define('DBUSER', '$MYSQL_USER');\
# define('DBPASS', '$MYSQL_PASSWORD');\
# define('DBNAME', '$MYSQL_DATABASE');\
# define('ENABLE_OAUTH', true);\
# define('FILES_FOLDER', '/var/www/html/files');\
# define('DEFAULT_TIMEZONE', '$TIMEZONE');\
# define('MAX_EXECUTION_TIME', '300');\
# define('API_URL', '$API_URL');\
# define('CSWEB_LOG_LEVEL' , 'error');\
# define('CSWEB_PROCESS_CASES_LOG_LEVEL', 'error');\
# ?>" > /var/www/html/src/AppBundle
