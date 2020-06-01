#!/bin/bash

sleep 120

if [ -e /mnt/mysql.pid ]
then
  while true
  do
    sleep 120
    pass
  done
else
  mysql -h mysql.mysql.svc.cluster.local -uroot -ppassword < /mnt/data.sql
  touch /mnt/mysql.pid
fi
