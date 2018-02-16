# Create Public key infrastructure keys
https://wiki.archlinux.org/index.php/Easy-RSA

# On server side setup tun0 interface

# On server iptables redirection:
https://askubuntu.com/questions/462533/route-all-traffic-through-openvpn

```bash
$ echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward
$ iptables -I FORWARD -i tun0 -o ens3 -s 10.0.0.0/24 -m conntrack --ctstate NEW -j ACCEPT
$ iptables -I FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
$ iptables -t nat -I POSTROUTING -o ens3 -s 10.0.0.0/24 -j MASQUERADE
$ openvpn --mktun --dev tun0
$ ip addr add 10.0.0.1 peer 10.0.0.2/24 dev tun0
```

# Server side keys:
- ca ca.crt
- cert oahzjh-misc.crt
- key oahzjh-misc.key
- dh dh.pem
- tls-crypt ta.key

# Client side keys:
- ca ca.crt
- cert client-carbonblack.crt
- key client-carbonblack.key
- tls-crypt ta.key

# Add Openvpn-update-resolve-conf to client side config
- https://wiki.archlinux.org/index.php/OpenVPN#DNS
- https://github.com/masterkorp/openvpn-update-resolv-conf

## Auto assign IP address to client device
- ifconfig-pool

# TODO:
## Create script to generate ovpn profile file

