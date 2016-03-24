translating by ezio



Securi-Pi: Using the Raspberry Pi as a Secure Landing Point
================================================================================

Like many LJ readers these days, I've been leading a bit of a techno-nomadic lifestyle as of the past few years—jumping from network to network, access point to access point, as I bounce around the real world while maintaining my connection to the Internet and other networks I use on a daily basis. As of late, I've found that more and more networks are starting to block outbound ports like SMTP (port 25), SSH (port 22) and others. It becomes really frustrating when you drop into a local coffee house expecting to be able to fire up your SSH client and get a few things done, and you can't, because the network's blocking you.

However, I have yet to run across a network that blocks HTTPS outbound (port 443). After a bit of fiddling with a Raspberry Pi 2 I have at home, I was able to get a nice clean solution that lets me hit various services on the Raspberry Pi via port 443—allowing me to walk around blocked ports and hobbled networks so I can do the things I need to do. In a nutshell, I have set up this Raspberry Pi to act as an OpenVPN endpoint, SSH endpoint and Apache server—with all these services listening on port 443 so networks with restrictive policies aren't an issue.

### Notes
This solution will work on most networks, but firewalls that do deep packet inspection on outbound traffic still can block traffic that's tunneled using this method. However, I haven't been on a network that does that...yet. Also, while I use a lot of cryptography-based solutions here (OpenVPN, HTTPS, SSH), I haven't done a strict security audit of this setup. DNS may leak information, for example, and there may be other things I haven't thought of. I'm not recommending this as a way to hide all your traffic—I just use this so that I can connect to the Internet in an unfettered way when I'm out and about.

### Getting Started
Let's start off with what you need to put this solution together. I'm using this on a Raspberry Pi 2 at home, running the latest Raspbian, but this should work just fine on a Raspberry Pi Model B, as well. It fits within the 512MB of RAM footprint quite easily, although performance may be a bit slower, because the Raspberry Pi Model B has a single-core CPU as opposed to the Pi 2's quad-core. My Raspberry Pi 2 is behind my home's router/firewall, so I get the added benefit of being able to access my machines at home. This also means that any traffic I send to the Internet appears to come from my home router's IP address, so this isn't a solution designed to protect anonymity. If you don't have a Raspberry Pi, or don't want this running out of your home, it's entirely possible to run this out of a small cloud server too. Just make sure that the server's running Debian or Ubuntu, as these instructions are targeted at Debian-based distributions.

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1002061/11913f1.jpg)

Figure 1. The Raspberry Pi, about to become an encrypted network endpoint.

### Installing and Configuring BIND
Once you have your platform up and running—whether it's a Raspberry Pi or otherwise—next you're going to install BIND, the nameserver that powers a lot of the Internet. You're going to install BIND as a caching nameserver only, and not have it service incoming requests from the Internet. Installing BIND will give you a DNS server to point your OpenVPN clients at, once you get to the OpenVPN step. Installing BIND is easy; it's just a simple `apt-get `command to install it:

```
root@test:~# apt-get install bind9
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following extra packages will be installed:
  bind9utils
Suggested packages:
  bind9-doc resolvconf ufw
The following NEW packages will be installed:
  bind9 bind9utils
0 upgraded, 2 newly installed, 0 to remove and 
 ↪0 not upgraded.
Need to get 490 kB of archives.
After this operation, 1,128 kB of additional disk 
 ↪space will be used.
Do you want to continue [Y/n]? y
```

There are a couple minor configuration changes that need to be made to one of the config files of BIND before it can operate as a caching nameserver. Both changes are in `/etc/bind/named.conf.options`. First, you're going to uncomment the "forwarders" section of this file, and you're going to add a nameserver on the Internet to which to forward requests. In this case, I'm going to add Google's DNS (8.8.8.8). The "forwarders" section of the file should look like this:

```
forwarders {
    8.8.8.8;
};
```

The second change you're going to make allows queries from your internal network and localhost. Simply add this line to the bottom of the configuration file, right before the `}`; that ends the file:

```
allow-query { 192.168.1.0/24; 127.0.0.0/16; };
```

That line above allows this DNS server to be queried from the network it's on (in this case, my network behind my firewall) and localhost. Next, you just need to restart BIND:

```
root@test:~# /etc/init.d/bind9 restart
[....] Stopping domain name service...: bind9waiting 
 ↪for pid 13209 to die
. ok
[ ok ] Starting domain name service...: bind9.
```

Now you can test `nslookup` to make sure your server works:

```
root@test:~# nslookup
> server localhost
Default server: localhost
Address: 127.0.0.1#53
> www.google.com
Server:		localhost
Address:	127.0.0.1#53
	
Non-authoritative answer:
Name:	www.google.com
Address: 173.194.33.176
Name:	www.google.com
Address: 173.194.33.177
Name:	www.google.com
Address: 173.194.33.178
Name:	www.google.com
Address: 173.194.33.179
Name:	www.google.com
Address: 173.194.33.180
```

That's it! You've got a working nameserver on this machine. Next, let's move on to OpenVPN.

### Installing and Configuring OpenVPN

OpenVPN is an open-source VPN solution that relies on SSL/TLS for its key exchange. It's also easy to install and get working under Linux. Configuration of OpenVPN can be a bit daunting, but you're not going to deviate from the default configuration by much. To start, you're going to run an apt-get command and install OpenVPN:

```
root@test:~# apt-get install openvpn
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following extra packages will be installed:
  liblzo2-2 libpkcs11-helper1
Suggested packages:
  resolvconf
The following NEW packages will be installed:
  liblzo2-2 libpkcs11-helper1 openvpn
0 upgraded, 3 newly installed, 0 to remove and 
 ↪0 not upgraded.
Need to get 621 kB of archives.
After this operation, 1,489 kB of additional disk 
 ↪space will be used.
Do you want to continue [Y/n]? y
```

Now that OpenVPN is installed, you're going to configure it. OpenVPN is SSL-based, and it relies on both server and client certificates to work. To generate these certificates, you need to configure a Certificate Authority (CA) on the machine. Luckily, OpenVPN ships with some wrapper scripts known as "easy-rsa" that help to bootstrap this process. You'll start by making a directory on the filesystem for the easy-rsa scripts to reside in and by copying the scripts from the template directory there:

```
root@test:~# mkdir /etc/openvpn/easy-rsa
root@test:~# cp -rpv 
 ↪/usr/share/doc/openvpn/examples/easy-rsa/2.0/* 
 ↪/etc/openvpn/easy-rsa/
 ```
 
Next, copy the vars file to a backup copy:

```
root@test:/etc/openvpn/easy-rsa# cp vars vars.bak
```

Now, edit vars so it's got information pertinent to your installation. I'm going specify only the lines that need to be edited, with sample data, below:

```
KEY_SIZE=4096
KEY_COUNTRY="US"
KEY_PROVINCE="CA"
KEY_CITY="Silicon Valley"
KEY_ORG="Linux Journal"
KEY_EMAIL="bill.childers@linuxjournal.com"
```

The next step is to source the vars file, so that the environment variables in the file are in your current environment:

```
root@test:/etc/openvpn/easy-rsa# source ./vars
NOTE: If you run ./clean-all, I will be doing a 
 ↪rm -rf on /etc/openvpn/easy-rsa/keys
 ```
 
### Building the Certificate Authority

You're now going to run clean-all to ensure a clean working environment, and then you're going to build the CA. Note that I'm changing changeme prompts to something that's appropriate for this installation:

```
root@test:/etc/openvpn/easy-rsa# ./clean-all
root@test:/etc/openvpn/easy-rsa# ./build-ca
Generating a 4096 bit RSA private key
...................................................++
...................................................++
writing new private key to 'ca.key'
-----
You are about to be asked to enter information that 
will be incorporated into your certificate request.
What you are about to enter is what is called a 
Distinguished Name or a DN.
There are quite a few fields but you can leave some 
blank. For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [US]:
State or Province Name (full name) [CA]:
Locality Name (eg, city) [Silicon Valley]:
Organization Name (eg, company) [Linux Journal]:
Organizational Unit Name (eg, section) 
 ↪[changeme]:SecTeam
Common Name (eg, your name or your server's hostname) 
 ↪[changeme]:test.linuxjournal.com
Name [changeme]:test.linuxjournal.com
Email Address [bill.childers@linuxjournal.com]:
```

### Building the Server Certificate

Once the CA is created, you need to build the OpenVPN server certificate:

```root@test:/etc/openvpn/easy-rsa# 
 ↪./build-key-server test.linuxjournal.com
Generating a 4096 bit RSA private key
...................................................++
writing new private key to 'test.linuxjournal.com.key'
-----
You are about to be asked to enter information that 
will be incorporated into your certificate request.
What you are about to enter is what is called a 
Distinguished Name or a DN.
There are quite a few fields but you can leave some 
blank. For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [US]:
State or Province Name (full name) [CA]:
Locality Name (eg, city) [Silicon Valley]:
Organization Name (eg, company) [Linux Journal]:
Organizational Unit Name (eg, section) 
 ↪[changeme]:SecTeam
Common Name (eg, your name or your server's hostname) 
 ↪[test.linuxjournal.com]:
Name [changeme]:test.linuxjournal.com
Email Address [bill.childers@linuxjournal.com]:
	
Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
Using configuration from 
 ↪/etc/openvpn/easy-rsa/openssl-1.0.0.cnf
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
countryName           :PRINTABLE:'US'
stateOrProvinceName   :PRINTABLE:'CA'
localityName          :PRINTABLE:'Silicon Valley'
organizationName      :PRINTABLE:'Linux Journal'
organizationalUnitName:PRINTABLE:'SecTeam'
commonName            :PRINTABLE:'test.linuxjournal.com'
name                  :PRINTABLE:'test.linuxjournal.com'
emailAddress          
 ↪:IA5STRING:'bill.childers@linuxjournal.com'
Certificate is to be certified until Sep  1 
 ↪06:23:59 2025 GMT (3650 days)
Sign the certificate? [y/n]:y
	
1 out of 1 certificate requests certified, commit? [y/n]y
Write out database with 1 new entries
Data Base Updated
```

The next step may take a while—building the Diffie-Hellman key for the OpenVPN server. This takes several minutes on a conventional desktop-grade CPU, but on the ARM processor of the Raspberry Pi, it can take much, much longer. Have patience, as long as the dots in the terminal are proceeding, the system is building its Diffie-Hellman key (note that many dots are snipped in these examples):

```
root@test:/etc/openvpn/easy-rsa# ./build-dh
Generating DH parameters, 4096 bit long safe prime, 
 ↪generator 2
This is going to take a long time
....................................................+
<snipped out many more dots>
```

### Building the Client Certificate

Now you're going to generate a client key for your client to use when logging in to the OpenVPN server. OpenVPN is typically configured for certificate-based auth, where the client presents a certificate that was issued by an approved Certificate Authority:

```
root@test:/etc/openvpn/easy-rsa# ./build-key 
 ↪bills-computer
Generating a 4096 bit RSA private key
...................................................++
...................................................++
writing new private key to 'bills-computer.key'
-----
You are about to be asked to enter information that 
will be incorporated into your certificate request.
What you are about to enter is what is called a 
Distinguished Name or a DN. There are quite a few 
fields but you can leave some blank.
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [US]:
State or Province Name (full name) [CA]:
Locality Name (eg, city) [Silicon Valley]:
Organization Name (eg, company) [Linux Journal]:
Organizational Unit Name (eg, section) 
 ↪[changeme]:SecTeam
Common Name (eg, your name or your server's hostname) 
 ↪[bills-computer]:
Name [changeme]:bills-computer
Email Address [bill.childers@linuxjournal.com]:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
Using configuration from 
 ↪/etc/openvpn/easy-rsa/openssl-1.0.0.cnf
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
countryName           :PRINTABLE:'US'
stateOrProvinceName   :PRINTABLE:'CA'
localityName          :PRINTABLE:'Silicon Valley'
organizationName      :PRINTABLE:'Linux Journal'
organizationalUnitName:PRINTABLE:'SecTeam'
commonName            :PRINTABLE:'bills-computer'
name                  :PRINTABLE:'bills-computer'
emailAddress          
 ↪:IA5STRING:'bill.childers@linuxjournal.com'
Certificate is to be certified until 
 ↪Sep  1 07:35:07 2025 GMT (3650 days)
Sign the certificate? [y/n]:y
	
1 out of 1 certificate requests certified, 
 ↪commit? [y/n]y
Write out database with 1 new entries
Data Base Updated
root@test:/etc/openvpn/easy-rsa#
```

Now you're going to generate an HMAC code as a shared key to increase the security of the system further:

```
root@test:~# openvpn --genkey --secret 
 ↪/etc/openvpn/easy-rsa/keys/ta.key
```

### Configuration of the Server

Finally, you're going to get to the meat of configuring the OpenVPN server. You're going to create a new file, /etc/openvpn/server.conf, and you're going to stick to a default configuration for the most part. The main change you're going to do is to set up OpenVPN to use TCP rather than UDP. This is needed for the next major step to work—without OpenVPN using TCP for its network communication, you can't get things working on port 443. So, create a new file called /etc/openvpn/server.conf, and put the following configuration in it: Garrick, shrink below.

```
port 1194
proto tcp
dev tun
ca easy-rsa/keys/ca.crt
cert easy-rsa/keys/test.linuxjournal.com.crt ## or whatever 
 ↪your hostname was
key easy-rsa/keys/test.linuxjournal.com.key  ## Hostname key 
 ↪- This file should be kept secret
management localhost 7505
dh easy-rsa/keys/dh4096.pem
tls-auth /etc/openvpn/certs/ta.key 0
server 10.8.0.0 255.255.255.0 # The server will use this 
 ↪subnet for clients connecting to it
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp" # Forces clients 
 ↪to redirect all traffic through the VPN
push "dhcp-option DNS 192.168.1.1" # Tells the client to 
 ↪use the DNS server at 192.168.1.1 for DNS - 
 ↪replace with the IP address of the OpenVPN 
 ↪machine and clients will use the BIND 
 ↪server setup earlier
keepalive 30 240
comp-lzo # Enable compression
persist-key
persist-tun
status openvpn-status.log
verb 3
```

And last, you're going to enable IP forwarding on the server, configure OpenVPN to start on boot and start the OpenVPN service:

```
root@test:/etc/openvpn/easy-rsa/keys# echo 
 ↪"net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
root@test:/etc/openvpn/easy-rsa/keys# sysctl -p 
 ↪/etc/sysctl.conf
net.core.wmem_max = 12582912
net.core.rmem_max = 12582912
net.ipv4.tcp_rmem = 10240 87380 12582912
net.ipv4.tcp_wmem = 10240 87380 12582912
net.core.wmem_max = 12582912
net.core.rmem_max = 12582912
net.ipv4.tcp_rmem = 10240 87380 12582912
net.ipv4.tcp_wmem = 10240 87380 12582912
net.core.wmem_max = 12582912
net.core.rmem_max = 12582912
net.ipv4.tcp_rmem = 10240 87380 12582912
net.ipv4.tcp_wmem = 10240 87380 12582912
net.ipv4.ip_forward = 0
net.ipv4.ip_forward = 1
	
root@test:/etc/openvpn/easy-rsa/keys# update-rc.d 
 ↪openvpn defaults
update-rc.d: using dependency based boot sequencing
	
root@test:/etc/openvpn/easy-rsa/keys# 
 ↪/etc/init.d/openvpn start
[ ok ] Starting virtual private network daemon:.
```

### Setting Up OpenVPN Clients

Your client installation depends on the host OS of your client, but you'll need to copy your client certs and keys created above to your client, and you'll need to import those certificates and create a configuration for that client. Each client and client OS does it slightly differently and documenting each one is beyond the scope of this article, so you'll need to refer to the documentation for that client to get it running. Refer to the Resources section for OpenVPN clients for each major OS.

### Installing SSLH—the "Magic" Protocol Multiplexer

The really interesting piece of this solution is SSLH. SSLH is a protocol multiplexer—it listens on port 443 for traffic, and then it can analyze whether the incoming packet is an SSH packet, HTTPS or OpenVPN, and it can forward that packet onto the proper service. This is what enables this solution to bypass most port blocks—you use the HTTPS port for all of this traffic, since HTTPS is rarely blocked.

To start, `apt-get` install SSLH:

```
root@test:/etc/openvpn/easy-rsa/keys# apt-get 
 ↪install sslh
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following extra packages will be installed:
  apache2 apache2-mpm-worker apache2-utils 
   ↪apache2.2-bin apache2.2-common
  libapr1 libaprutil1 libaprutil1-dbd-sqlite3 
   ↪libaprutil1-ldap libconfig9
Suggested packages:
  apache2-doc apache2-suexec apache2-suexec-custom 
   ↪openbsd-inetd inet-superserver
The following NEW packages will be installed:
  apache2 apache2-mpm-worker apache2-utils 
   ↪apache2.2-bin apache2.2-common
  libapr1 libaprutil1 libaprutil1-dbd-sqlite3 
   ↪libaprutil1-ldap libconfig9 sslh
0 upgraded, 11 newly installed, 0 to remove 
 ↪and 0 not upgraded.
Need to get 1,568 kB of archives.
After this operation, 5,822 kB of additional 
 ↪disk space will be used.
Do you want to continue [Y/n]? y
```

After SSLH is installed, the package installer will ask you if you want to run it in inetd or standalone mode. Select standalone mode, because you want SSLH to run as its own process. If you don't have Apache installed, the Debian/Raspbian package of SSLH will pull it in automatically, although it's not strictly required. If you already have Apache running and configured, you'll want to make sure it only listens on localhost's interface and not all interfaces (otherwise, SSLH can't start because it can't bind to port 443). After installation, you'll receive an error that looks like this:

```
[....] Starting ssl/ssh multiplexer: sslhsslh disabled, 
 ↪please adjust the configuration to your needs
[FAIL] and then set RUN to 'yes' in /etc/default/sslh 
 ↪to enable it. ... failed!
failed!
```

This isn't an error, exactly—it's just SSLH telling you that it's not configured and can't start. Configuring SSLH is pretty simple. Its configuration is stored in `/etc/default/sslh`, and you just need to configure the `RUN` and `DAEMON_OPTS` variables. My SSLH configuration looks like this:

```
# Default options for sslh initscript
# sourced by /etc/init.d/sslh
	
# Disabled by default, to force yourself
# to read the configuration:
# - /usr/share/doc/sslh/README.Debian (quick start)
# - /usr/share/doc/sslh/README, at "Configuration" section
# - sslh(8) via "man sslh" for more configuration details.
# Once configuration ready, you *must* set RUN to yes here
# and try to start sslh (standalone mode only)
	
RUN=yes

# binary to use: forked (sslh) or single-thread 
 ↪(sslh-select) version
DAEMON=/usr/sbin/sslh
	
DAEMON_OPTS="--user sslh --listen 0.0.0.0:443 --ssh 
 ↪127.0.0.1:22 --ssl 127.0.0.1:443 --openvpn 
 ↪127.0.0.1:1194 --pidfile /var/run/sslh/sslh.pid"
 ```
 
 Save the file and start SSLH:
 
```
 root@test:/etc/openvpn/easy-rsa/keys# 
 ↪/etc/init.d/sslh start
[ ok ] Starting ssl/ssh multiplexer: sslh.
```

Now, you should be able to ssh to port 443 on your Raspberry Pi, and have it forward via SSLH:

```
$ ssh -p 443 root@test.linuxjournal.com
root@test:~#
```

SSLH is now listening on port 443 and can direct traffic to SSH, Apache or OpenVPN based on the type of packet that hits it. You should be ready to go!

### Conclusion

Now you can fire up OpenVPN and set your OpenVPN client configuration to port 443, and SSLH will route it to the OpenVPN server on port 1194. But because you're talking to your server on port 443, your VPN traffic won't get blocked. Now you can land at a strange coffee shop, in a strange town, and know that your Internet will just work when you fire up your OpenVPN and point it at your Raspberry Pi. You'll also gain some encryption on your link, which will improve the privacy of your connection. Enjoy surfing the Net via your new landing point!

Resources

Installing and Configuring OpenVPN: [https://wiki.debian.org/OpenVPN](https://wiki.debian.org/OpenVPN) and [http://cryptotap.com/articles/openvpn](http://cryptotap.com/articles/openvpn)

OpenVPN client downloads: [https://openvpn.net/index.php/open-source/downloads.html](https://openvpn.net/index.php/open-source/downloads.html)

OpenVPN Client for iOS: [https://itunes.apple.com/us/app/openvpn-connect/id590379981?mt=8](https://itunes.apple.com/us/app/openvpn-connect/id590379981?mt=8)

OpenVPN Client for Android: [https://play.google.com/store/apps/details?id=net.openvpn.openvpn&hl=en](https://play.google.com/store/apps/details?id=net.openvpn.openvpn&hl=en)

Tunnelblick for Mac OS X (OpenVPN client): [https://tunnelblick.net](https://tunnelblick.net)

SSLH—Protocol Multiplexer: [http://www.rutschle.net/tech/sslh.shtml](http://www.rutschle.net/tech/sslh.shtml) and [https://github.com/yrutschle/sslh](https://github.com/yrutschle/sslh)


----------
via: http://www.linuxjournal.com/content/securi-pi-using-raspberry-pi-secure-landing-point?page=0,0 

作者：[Bill Childers][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/bill-childers


