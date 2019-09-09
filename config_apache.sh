#!/usr/bin/env bash

# Apache 
cp librenms.conf /etc/apache2/sites-available/librenms.conf
hostn=$(hostname) 
sed -i -e "s@librenms.example.com@$hostn@g" /etc/apache2/sites-available/librenms.conf
a2dissite 000-default
a2ensite librenms.conf
a2enmod rewrite
systemctl restart apache2


# Cron
cp /opt/librenms/librenms.nonroot.cron /etc/cron.d/librenms


# LogRotate
cp /opt/librenms/misc/librenms.logrotate /etc/logrotate.d/librenms
mkdir /opt/librenms/log


# Permissions
chown -R librenms:librenms /opt/librenms
setfacl -d -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/
setfacl -R -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/