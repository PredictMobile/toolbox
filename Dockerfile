FROM node:lts-alpine as node

FROM predictmobile/php:latest

# add compsoer
COPY ./composer-installer.sh /composer-installer.sh
RUN . /composer-installer.sh

# add node
COPY --from=node /usr/local/bin /usr/local/bin
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /opt /opt

WORKDIR /var/www