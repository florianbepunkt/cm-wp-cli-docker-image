FROM wordpress:cli

USER root

# increase memory limit
ENV PHP_INI_MEMORY_LIMIT 1024M
RUN echo 'memory_limit = ${PHP_INI_MEMORY_LIMIT}' > "$PHP_INI_DIR/php.ini"

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

USER www-data

RUN wp package install front/wp-cli-build
