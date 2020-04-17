#!/bin/bash
(
cd /logs
sshpass -p 'S33ra#2020TAS' rsync -avz --progress  -e 'ssh -p 9922' tasadmin@10.65.30.34:/mnt/logs/archived .
sshpass -p 'S33ra#2020TAS' rsync -avz --progress  -e 'ssh -p 9922' tasadmin@10.65.30.34:/home/tasadmin/logs .
)
