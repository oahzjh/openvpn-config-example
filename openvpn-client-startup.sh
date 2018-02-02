#!/bin/bash
set -e
set -x
set -u
set -o pipefail


# A sample OpenVPN startup script
# for Linux.

# openvpn config file directory
# dir=/etc/openvpn/
dir=$(pwd)

# load the firewall
$dir/firewall.sh

# load TUN/TAP kernel module
modprobe tun

# enable IP forwarding
# echo 1 > /proc/sys/net/ipv4/ip_forward

## Create tun0 interface
#dir/tun.up

# openvpn --cd $dir --daemon --config /etc/openvpn/client/oahzjh-misc.conf
openvpn --script-security 2 --down $dir/tun.down --cd $dir --config /etc/openvpn/client/oahzjh-misc.conf
