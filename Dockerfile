FROM debian
WORKDIR /var/www/html

copy html .

RUN apt update
RUN apt install -y apache2 && apt clean

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log


EXPOSE 80
CMD apachectl -D FOREGROUND
