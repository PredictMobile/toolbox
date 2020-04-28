FROM node:lts-alpine as node

FROM predictmobile/php:latest

# add compsoer
COPY ./composer-install.sh /composer-install.sh
RUN . /composer-install.sh

# add node
COPY --from=node /usr/local/bin /usr/local/bin
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /opt /opt

WORKDIR /var/www