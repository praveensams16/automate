FROM httpd

ARG HOST

ENV HOST $HOST

COPY $HOST.html /usr/local/apache2/htdocs/index.html

COPY $HOST /usr/local/apache2/conf/httpd.conf

