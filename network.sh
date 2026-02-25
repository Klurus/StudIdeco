#!/bin/bash
hostnamectl set-hostname idc-dc.au.team; exec bash
echo "192.168.100.10/24" > /etc/net/ifaces/ens19/ipv4address
echo "default via 192.168.100.1" > /etc/net/ifaces/ens19/ipv4route 
echo "search au.team" > /etc/net/ifaces/ens19/resolv.conf
echo "nameserver 192.168.100.1" > /etc/net/ifaces/ens19/resolv.conf 
systemctl restart network
