FROM wordpress:cli

USER root

ENV PHP_INI_MEMORY_LIMIT 1024M
RUN echo 'memory_limit = ${PHP_INI_MEMORY_LIMIT}' > "$PHP_INI_DIR/docker-env.ini"

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

USER www-data

RUN php -d memory_limit=1024M "$(which wp)" package install front/wp-cli-build
