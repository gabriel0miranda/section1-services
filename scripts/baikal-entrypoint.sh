#!/bin/bash
set -e

supervisorctl start php-fpm
supervisorctl start nginx
