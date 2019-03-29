How to use Fedora Server to create a router / gateway
======

![](https://fedoramagazine.org/wp-content/uploads/2018/07/buildingarouter-816x345.jpg)

Building a router (or gateway) using Fedora Server is an interesting project for users wanting to learn more about Linux system administration and networking. In this article, learn how to configure a Fedora Server minimal install to act as an internet router / gateway.

This guide is based on [Fedora 28][1] and assumes you have already installed Fedora Server (minimal install). Additionally, you require a suitable network card / modem for the incoming internet connection. In this example, the [DrayTek VigorNIC 132][2] NIC was used to create the router.

### Why build your own router

There are many benefits for building your own router over buying a standalone box (or using the one supplied by your internet provider):

  * Easily update and run latest software versions
  * May be less prone to be part of larger hacking campaign as its not a common consumer device
  * Run your own VMs or containers on same host/router
  * Build OpenShift on top of router (future story in this series)
  * Include your own VPN, Tor, or other tunnel paths along with correct routing



The downside is related to time and knowledge.

  * You have to manage your own security
  * You need to have the knowledge to troubleshoot if an issue happens or find it through the web (no support calls)
  * Costs more in most cases than hardware provided by an internet provider



Basic network topology

The diagram below describes the basic topology used in this setup. The machine running Fedora Server has a PCI Express modem for VDSL. Alternatively, if you use a [Raspberry Pi][3] with external modem the configuration is mostly similar.

![topology][4]

### Initial Setup

First of all, install the packages needed to make the router. Bash auto-complete is included to make things easier when later configuring. Additionally, install packages to allow you to host your own VMs on the same router/hosts via KVM-QEMU.
```
dnf install -y bash-completion NetworkManager-ppp qemu-kvm qemu-img virt-manager libvirt libvirt-python libvirt-client virt-install virt-viewer

```

Next, use **nmcli** to set the MTU on the WAN(PPPoE) interfaces to align with DSL/ATM MTU and create **pppoe** interface. This [link][5] has a great explanation on how this works. The username and password will be provided by your internet provider.
```
nmcli connection add type pppoe ifname enp2s0 username 00xxx5511yyy0001@t-online.de password XXXXXX 802-3-ethernet.mtu 1452

```

Now, set up the firewall with the default zone as external and remove incoming SSH access.
```
firewall-cmd --set-default-zone=external
firewall-cmd --permanent --zone=external --remove-service=ssh

```

Add LAN interface(br0) along with preferred LAN IP address and then add your physical LAN interface to the bridge.
```
nmcli connection add ifname br0 type bridge con-name br0 bridge.stp no ipv4.addresses 10.0.0.1/24 ipv4.method manual
nmcli connection add type bridge-slave ifname enp1s0 master br0

```

Remember to use a subnet that does not overlap with your works VPN subnet. For example my work provides a 10.32.0.0/16 subnet when I VPN into the office so I need to avoid using this in my home network. If you overlap addressing then the route provided by your VPN will likely have lower priority and you will not route through the VPN tunnel.

Now create a file called bridge.xml, containing a bridge definition that **virsh** will consume to create a bridge in **QEMU**.
```
cat > bridge.xml <<EOF
<network>
    <name>host-bridge</name>
    <forward mode="bridge"/>
    <bridge name="br0"/>
</network>
EOF

```

Start and enable your libvirt-guests service so you can add the bridge in your virtual environment for the VMs to use.
```
systemctl start libvirt-guests.service
systemctl enable libvirt-guests.service

```

Add your “host-bridge” to QEMU via virsh command and the XML file you created earlier.
```
virsh net-define bridge.xml

```

virsh net-start host-bridge virsh net-autostart host-bridge

Add br0 to internal zone and allow DNS and DHCP as we will be setting up our own services on this router.
```
firewall-cmd --permanent --zone=internal --add-interface=br0
firewall-cmd --permanent --zone=internal --add-service=dhcp
firewall-cmd --permanent --zone=internal --add-service=dns

```

Since many DHCP clients including Windows and Linux don’t take into account the MTU attribute in DHCP, we will need to allow TCP based protocols to set MSS based on PMTU size.
```
firewall-cmd --permanent --direct --add-passthrough ipv4 -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

```

Now we reload the firewall to take permanent changes into account.
```
nmcli connection reload

```

### Install and Configure DHCP

DHCP configuration depends on your home network setup. Use your own desired domain name and and the subnet was defined during the creation of **br0**. Be sure to note the MAC address in the config file below can either be capture from the command below once you have DHCP services up and running or you can pull it off the label externally on the device you want to set to static addressing.
```
cat /var/lib/dhcpd/dhcpd.leases

dnf -y install dhcp
vi /etc/dhcp/dhcpd.conf

option domain-name "lajoie.org";
option domain-name-servers 10.0.0.1;
default-lease-time 600;
max-lease-time 7200;
authoritative;
subnet 10.0.0.0 netmask 255.255.255.0 {
 range dynamic-bootp 10.0.0.100 10.0.0.254;
 option broadcast-address 10.0.0.255;
 option routers 10.0.0.1; option interface-mtu 1452;
}
host ubifi {
 option host-name "ubifi.lajoie.org";
 hardware ethernet f0:9f:c2:1f:c1:12;
 fixed-address 10.0.0.2;
}

```

Now enable and start your DHCP server
```
systemctl start dhcpd
systemctl enable dhcpd

```

### DNS Install and Configure

Next, install **bind** and and **bind-utils** for tools like **nslookup** and **dig**.
```
dnf -y install bind bind-utils

```

Configure your bind server with listening address (LAN interface in this case) and the forward/reverse zones.
```
$ vi /etc/named.conf

options {
 listen-on port 53 { 10.0.0.1; };
 listen-on-v6 port 53 { none; };
 directory "/var/named";
 dump-file "/var/named/data/cache_dump.db";
 statistics-file "/var/named/data/named_stats.txt";
 memstatistics-file "/var/named/data/named_mem_stats.txt";
 secroots-file "/var/named/data/named.secroots";
 recursing-file "/var/named/data/named.recursing";
 allow-query { 10.0.0.0/24; };
 recursion yes;
 forwarders {8.8.8.8; 8.8.4.4; };
 dnssec-enable yes;
 dnssec-validation yes;
 managed-keys-directory "/var/named/dynamic";
 pid-file "/run/named/named.pid";
 session-keyfile "/run/named/session.key";
 include "/etc/crypto-policies/back-ends/bind.config";
};
controls { };
logging {
 channel default_debug {
 file "data/named.run";
 severity dynamic;
 };
};
view "internal" {
 match-clients { localhost; 10.0.0.0/24; };
 zone "lajoie.org" IN {
 type master;
 file "lajoie.org.db";
 allow-update { none; };
 };
 zone "0.0.10.in-addr.arpa" IN {
 type master;
 file "0.0.10.db";
 allow-update { none; };
 };
};

```

Here is a zone file for example and make sure to update the serial number after each edit of the bind service will assume no changes took place.
```
$ vi /var/named/lajoie.org.db

$TTL 86400
@ IN SOA gw.lajoie.org. root.lajoie.org. (
 2018040801 ;Serial
 3600 ;Refresh
 1800 ;Retry
 604800 ;Expire
 86400 ;Minimum TTL )
IN NS gw.lajoie.org.
IN A 10.0.0.1
gw IN A 10.0.0.1
ubifi IN A 10.0.0.2

```

Here is a reverse zone file for example and make sure to update the serial number after each edit of the bind service will assume no changes took place.
```
$ vi /var/named/0.0.10.db

$TTL 86400
@ IN SOA gw.lajoie.org. root.lajoie.org. (
 2018040801 ;Serial
 3600 ;Refresh
 1800 ;Retry
 604800 ;Expire
 86400 ;Minimum TTL )
IN NS gw.lajoie.org.
IN PTR lajoie.org.
IN A 255.255.255.0
1 IN PTR gw.lajoie.org.
2 IN PTR ubifi.lajoie.org.

```

Now enable and start your DNS server
```
systemctl start named
systemctl enable named

```

# Secure SSH

Last simple step is to make SSH service listen only on your LAN segment. Run this command to see whats listening at this moment. Remember we did not allow SSH on the external firewall zone but this step is still best practice in my opinion.
```
ss -lnp4

```

Now edit the SSH service to only listen on your LAN segment.
```
vi /etc/ssh/sshd_config

AddressFamily inet
ListenAddress 10.0.0.1

```

Restart your SSH service for changes to take effect.
```
systemctl restart sshd.service

```


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-fedora-server-create-router-gateway/

作者：[Eric Lajoie][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/elajoie/
[1]:https://getfedora.org/en/server/
[2]:https://www.draytek.com/en/products/products-a-z/router.all/vigornic-132-series/
[3]:https://fedoraproject.org/wiki/Architectures/ARM/Raspberry_Pi
[4]:https://ericlajoie.com/photo/FedoraRouter.png
[5]:https://www.sonicwall.com/en-us/support/knowledge-base/170505851231244
