# Create Public key infrastructure keys
https://wiki.archlinux.org/index.php/Easy-RSA

# On server iptables redirection:
https://askubuntu.com/questions/462533/route-all-traffic-through-openvpn

```bash
$ iptables -I FORWARD -i tun0 -o eth0 -s 10.8.0.0/24 -m conntrack --ctstate NEW -j ACCEPT
$ iptables -I FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
$ iptables -t nat -I POSTROUTING -o eth0 -s 10.8.0.0/24 -j MASQUERADE
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

# TODO:

## Add Openvpn-update-resolve-conf to client side config
- https://github.com/masterkorp/openvpn-update-resolv-conf
- https://wiki.archlinux.org/index.php/OpenVPN#DNS

## Create script to generate ovpn profile file

## Auto assign IP address to client device
