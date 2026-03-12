#!/bin/bash

service docker start

mkdir -p /var/run/sshd
/usr/sbin/sshd

echo "Railway VPS Started"

tail -f /dev/null
