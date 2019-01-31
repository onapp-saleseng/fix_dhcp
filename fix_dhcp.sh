#!/bin/bash

CPIP=$1

if [[ /onapp/configuration/dhcp/dhcpd.conf -nt /etc/dhcp/dhcpd.conf ]] ; then
  sed -e "s/next-server $CPIP/next-server relay.local/g" /onapp/configuration/dhcp/dhcpd.conf > /etc/dhcp/dhcpd.conf
  systemctl restart dhcpd
fi
