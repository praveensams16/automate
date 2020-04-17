FROM  centos

MAINTAINER praveen

LABEL app=worpress \
      VERSION=v1

RUN {  echo 'nameserver 8.8.8.8' ; cat /etc/resolv.conf ; } > /tmp/dns \
    && cat /tmp/dns > /etc/resolv.conf

RUN yum install epel-release yum-utils -y \
     && yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm

RUN    yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysqlnd -y

RUN yum install httpd httpd-tools -y


CMD ["httpd","-D","FOREGROUND"]


