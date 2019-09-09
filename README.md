# LibreNMS

## README

All scripts are bash scripts. 
It install a ready to play LibreNMS server on CentOS with Nginx

## Pre requisites

You need to change hostname, with the fqdn name.
Example : myserver.toto.fr

Networks parameters have to be updated.

## Execution auto

Exec requirements script with the following syntax and order : 

```bash 
./requirements_soft_install.sh | tee logs/install.log

./config_apache.sh | tee logs/apache.log

./config_php.sh | tee logs/php.log
```

Once everything is ok, you can set the change_permissions.sh executable by librenms user. With this script, you have the hability to update rights you need to update from validate.php.

## Configuration files

There is two files for auto configuration that are copied on the directory by scripts:

- config.php
- librenms.conf

## Manual changes

You need to do the following changes :

/etc/snmp/snmpd.conf --> replace RANDOMSTRINGGOESHERE


