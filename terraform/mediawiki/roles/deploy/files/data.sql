create database mediawikidb;
grant all privileges on mediawikidb.* to mediawiki@'%' identified by 'redhat';
flush privileges;

