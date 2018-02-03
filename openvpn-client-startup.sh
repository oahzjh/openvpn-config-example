#!/bin/bash
set -e
set -x
set -u
set -o pipefail


# A sample OpenVPN startup script
# for Linux.

# openvpn config file directory
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )"

# load the firewall
${DIR}/firewall.sh

# load TUN/TAP kernel module
modprobe tun

# enable IP forwarding
# echo 1 > /proc/sys/net/ipv4/ip_forward

## Create tun0 interface
${DIR}/tun.down || true
${DIR}/tun.up

openvpn --daemon --script-security 2 --down ${DIR}/tun.down --cd ${DIR}/client --config ${DIR}/client/oahzjh-misc.conf
