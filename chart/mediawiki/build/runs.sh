#!/bin/bash

#mysql --protocol tcp < /mnt/data.sql
mysql -h mysql.mysql.svc.cluster.local -uroot -ppassword < /mnt/data.sql
