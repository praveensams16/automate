FROM centos 

MAINTAINER "praveen"

LABEL ENV="prod"

ARG PACK

ENV PATH "/usr/praveen:$PATH"

RUN yum install httpd -y \ 
    && yum install net-tools -y 


HEALTHCHECK CMD curl --fail http://192.168.56.11 || exit 1

COPY index.html  /var/www/html/

CMD ["httpd","-D","FOREGROUND"]


