echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080
#(iptables -t nat -L PREROUTING) verifikation!
iptables -I INPUT 1 -p tcp --dport 8080 -j ACCEPT