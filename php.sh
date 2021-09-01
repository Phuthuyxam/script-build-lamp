#!/bin/bash

yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

https://rpms.remirepo.net/enterprise/remi-release-7.rpm

yum -y install yum-utils

yum-config-manager --enable remi-php74

yum -y install yum-utils

yum-config-manager --enable remi-php74

yum update

yum install php php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json php-dom php-exif php-mysqli php-openssl php-pcre php-imagick php-xml php-zip php-filter php-gd php-iconv php-mcrypt php-simplexml php-xmlreader php-zlib 
