#!/bin/bash

[ -d /share/ ] || { mkdir /share ; chmod 777 /share ; }

cd /share

git clone https://github.com/praveensams/praveensams-jenkins-jobs.git

chmod 777 -R /share/*
