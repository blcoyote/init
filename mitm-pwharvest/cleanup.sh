echo 0 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -D PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 8080
#iptables -t nat -L PREROUTING # uncomment for verification printout!
iptables -D INPUT 1 -p tcp --dport 8080 -j ACCEPT