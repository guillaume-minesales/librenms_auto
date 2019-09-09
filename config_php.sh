#!/usr/bin/env bash

# PHP config to set Europe/Paris timezone. You can change this by your own
cd /opt/librenms
./scripts/composer_wrapper.php install --no-dev
sed -i -e "s@;date.timezone =@date.timezone = Europe/Paris@g" /etc/php/7.2/cli/php.ini
sed -i -e "s@;date.timezone =@date.timezone = Europe/Paris@g" /etc/php/7.2/apache2/php.ini
a2enmod php7.2
a2dismod mpm_event
a2enmod mpm_prefork
