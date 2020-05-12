FROM predictmobile/php:7.4

# add compsoer
COPY ./composer-installer.sh /composer-installer.sh
RUN . /composer-installer.sh

WORKDIR /var/www
