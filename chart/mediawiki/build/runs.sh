#!/bin/bash

sleep 120

mysql -h mysql.mysql.svc.cluster.local -uroot -ppassword < /mnt/data.sql
