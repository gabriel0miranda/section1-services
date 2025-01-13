#!/bin/sh
set -e

supervisorctl -c /etc/coredns.conf start coredns
