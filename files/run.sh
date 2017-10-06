#!/bin/bash

echo "1" >> /tmp/log
/usr/bin/stunnel /etc/stunnel/stunnel.conf >> /tmp/log 2>&1
echo "2" >> /tmp/log
