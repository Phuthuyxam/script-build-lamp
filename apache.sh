#!/bin/bash

yum update httpd

yum install httpd

firewall-cmd --permanent --add-service=http

firewall-cmd --permanent --add-service=https

firewall-cmd --reload

systemctl start httpd

systemctl status httpd

systemctl enable httpd

# make source file
echo "Press your_domain to continue"
read your_domain

mkdir -p "/var/www/${your_domain}/html"

mkdir -p "/var/www/${your_domain}/log"

cp -r src/src_deploy/* "/var/www/${your_domain}/html"

chown -R apache:apache "/var/www/${your_domain}/html"

chmod -R 755 /var/www

# config apache
mkdir /etc/httpd/sites-available /etc/httpd/sites-enabled

echo "IncludeOptional sites-enabled/*.conf" >> /etc/httpd/conf/httpd.conf

cat << EOF >> "/etc/httpd/sites-available/${your_domain}.conf"
<VirtualHost *:80>
    ServerName www.${your_domain}
    ServerAlias ${your_domain}
    DocumentRoot /var/www/${your_domain}/html
    ErrorLog /var/www/${your_domain}/log/error.log
    CustomLog /var/www/${your_domain}/log/requests.log combined
</VirtualHost>
EOF

ln -s /etc/httpd/sites-available/${your_domain}.conf /etc/httpd/sites-enabled/${your_domain}.conf

# Adjusting SELinux Permissions for Virtual Hosts (Recommended)

setsebool -P httpd_unified 1
ls -dZ /var/www/${your_domain}/log/
semanage fcontext -a -t httpd_log_t "/var/www/${your_domain}/log(/.*)?"
restorecon -R -v /var/www/${your_domain}/log
ls -dZ /var/www/${your_domain}/log/

# reset apache
systemctl restart httpd

# cenbort ssl
yum install epel-release

yum install certbot python2-certbot-apache mod_ssl

certbot --apache -d ${your_domain}

certbot --apache -d ${your_domain} -d www.${your_domain}

certbot --apache

certbot renew --dry-run

crontab -e