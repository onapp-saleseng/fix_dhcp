#!/bin/bash

CPIP=$1

if [[ /onapp/configuration/dhcp/dhcpd.conf -nt /etc/dhcp/dhcpd.conf ]] ; then
  sed -e "s/next-server $CPIP;/next-server relay.local;/;s/domain-name-servers $CPIP;/domain-name-servers relay.local;/" /onapp/configuration/dhcp/dhcpd.conf > /etc/dhcp/dhcpd.conf
  touch /etc/dhcp/dhcpd.conf
  systemctl restart dhcpd
fi
