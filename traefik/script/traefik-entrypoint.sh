#!/bin/sh
set -e

supervisorctl -c /etc/traefik.conf start traefik
