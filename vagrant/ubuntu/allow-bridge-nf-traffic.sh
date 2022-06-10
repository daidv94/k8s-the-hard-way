#!/bin/bash
# sysctl net.bridge.bridge-nf-call-iptables=1
modprobe br_netfilter
sysctl -p /etc/sysctl.conf