FROM httpd

EXPOSE 8080

RUN mkdir /usr/local/apache2/share \
    && chmod 777 /usr/local/apache2/share

COPY httpd.conf /usr/local/apache2/conf/
COPY index.html /usr/local/apache2/share/

