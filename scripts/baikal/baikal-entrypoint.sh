#!/bin/sh
set -e

supervisorctl -c /etc/baikal.conf start php-fpm
supervisorctl -c /etc/baikal.conf start nginx
