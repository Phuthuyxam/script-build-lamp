#!/bin/bash

yum install mariadb-server

systemctl start mariadb

systemctl status mariadb

systemctl enable mariadb

mysql_secure_installation

