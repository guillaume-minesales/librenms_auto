#! /usr/bin/env bash

#################################
#### Installation prereq.    ####
#### Ubuntu Server -- Apache ####
#################################


# Installation of pre requisites
apt -y install software-properties-common
add-apt-repository universe
apty update
apt install curl apache2 composer fping git graphviz imagemagick libapache2-mod-php7.2 mariadb-client mariadb-server mtr-tiny nmap php7.2-cli php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-mysql php7.2-snmp php7.2-xml php7.2-zip python-memcache python-mysqldb rrdtool snmp snmpd whois


# Add user librenms
useradd librenms -d /opt/librenms -M -r
usermod -a -G librenms www-data

# Begin installation
cd /opt
git clone https://github.com/librenms/librenms.git
cp /opt/script/config.php /opt/librenms/config.php
chown -R librenms:librenms /opt/librenms
chmod 770 /opt/librenms
setfacl -d -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/
setfacl -R -m g::rwx /opt/librenms/rrd /opt/librenms/logs /opt/librenms/bootstrap/cache/ /opt/librenms/storage/

# SNMP copy
cp /opt/librenms/snmpd.conf.example /etc/snmp/snmpd.conf
curl -o /usr/bin/distro https://raw.githubusercontent.com/librenms/librenms-agent/master/snmp/distro
chmod +x /usr/bin/distro
systemctl restart snmpd
