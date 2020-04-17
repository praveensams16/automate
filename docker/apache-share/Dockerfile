FROM httpd
MAINTAINER PraveenSam
LABEL env=Prod \
      description="invoice production"
RUN mkdir /usr/local/apache/
COPY httpd.conf /usr/local/apache2/conf/
COPY .htpasswd /usr/local/apache
