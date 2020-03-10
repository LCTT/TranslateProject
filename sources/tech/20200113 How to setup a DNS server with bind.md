[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to setup a DNS server with bind)
[#]: via: (https://fedoramagazine.org/how-to-setup-a-dns-server-with-bind/)
[#]: author: (Curt Warfield https://fedoramagazine.org/author/rcurtiswarfield/)

How to setup a DNS server with bind
======

![][1]

The Domain Name System, or DNS, as it’s more commonly known, translates or converts domain names into the IP addresses associated with that domain. DNS is the reason you are able to find your favorite website by name instead of typing an IP address into your browser. This guide shows you how to configure a Master DNS system and one client.

Here are system details for the example used in this article:

```
dns01.fedora.local     (192.168.1.160 ) - Master DNS server
client.fedora.local    (192.168.1.136 ) - Client
```

### DNS server configuration

Install the bind packages using sudo:

```
$ sudo dnf install bind bind-utils -y
```

The _/etc/named.conf_ configuration file is provided by the _bind_ package to allow you to configure the DNS server.

Edit the _/etc/named.conf_ file:

```
sudo vi /etc/named.conf
```

Look for the following line:

```
listen-on port 53 { 127.0.0.1; };
```

Add the IP address of your Master DNS server as follows:

```
listen-on port 53 { 127.0.0.1; 192.168.1.160; };
```

Look for the next line:

```
allow-query  { localhost; };
```

Add your local network range. The example system uses IP addresses in the 192.168.1.X range. This is specified as follows:

```
allow-query  { localhost; 192.168.1.0/24; };
```

Specify a forward and reverse zone. Zone files are simply text files that have the DNS information, such as IP addresses and host-names, on your system. The forward zone file makes it possible for the translation of a host-name to its IP address. The reverse zone file does the opposite. It allows a remote system to translate an IP address to the host name.

Look for the following line at the bottom of the /etc/named.conf file:

```
include "/etc/named.rfc1912.zones";
```

Here, you’ll specify the zone file information _**directly above that line**_ as follows:

```
zone "dns01.fedora.local" IN {
type master;
file "forward.fedora.local";
allow-update { none; };
};

zone "1.168.192.in-addr.arpa" IN {
type master;
file "reverse.fedora.local";
allow-update { none; };
};
```

The _forward.fedora.local_ and the file _reverse.fedora.local_ are just the names of the zone files you will be creating. They can be called anything you like.

Save and exit.

#### Create the zone files

Create the forward and reverse zone files you specified in the /etc/named.conf file:

```
$ sudo vi /var/named/forward.fedora.local
```

Add the following lines:

```
$TTL 86400
@   IN  SOA     dns01.fedora.local. root.fedora.local. (
        2011071001  ;Serial
        3600        ;Refresh
        1800        ;Retry
        604800      ;Expire
        86400       ;Minimum TTL
)
@       IN  NS          dns01.fedora.local.
@       IN  A           192.168.1.160
dns01           IN  A   192.168.1.160
client          IN  A   192.168.1.136
```

Everything in _**bold**_ is specific to your environment. Save the file and exit. Next, edit the _reverse.fedora.local_ file:

```
$ sudo vi /var/named/reverse.fedora.local
```

Add the following lines:

```
$TTL 86400
@   IN  SOA     dns01.fedora.local. root.fedora.local. (
        2011071001  ;Serial
        3600        ;Refresh
        1800        ;Retry
        604800      ;Expire
        86400       ;Minimum TTL
)
@       IN  NS          dns01.fedora.local.
@       IN  PTR         fedora.local.
dns01           IN  A   192.168.1.160
client          IN  A   192.168.1.136
160     IN  PTR         dns01.fedora.local.
136     IN  PTR         client.fedora.local.
```

Everything in _**bold**_ is also specific to your environment. Save the file and exit.

You’ll also need to configure SELinux and add the correct ownership for the configuration files.

```
sudo chgrp named -R /var/named
sudo chown -v root:named /etc/named.conf
sudo restorecon -rv /var/named
sudo restorecon /etc/named.conf
```

Configure the firewall:

```
sudo firewall-cmd --add-service=dns --perm
sudo firewall-cmd --reload
```

#### Check the configuration for any syntax errors

```
sudo named-checkconf /etc/named.conf
```

Your configuration is valid if no output or errors are returned.

Check the forward and reverse zone files.

```
$ sudo named-checkzone forward.fedora.local /var/named/forward.fedora.local

$ sudo named-checkzone reverse.fedora.local /var/named/reverse.fedora.local
```

You should see a response of OK:

```
zone forward.fedora.local/IN: loaded serial 2011071001
OK

zone reverse.fedora.local/IN: loaded serial 2011071001
OK
```

#### Enable and start the DNS service

```
$ sudo systemctl enable named
$ sudo systemctl start named
```

#### Configuring the resolv.conf file

Edit the _/etc/resolv.conf_ file:

```
$ sudo vi /etc/resolv.conf
```

Look for your current name server line or lines. On the example system, a cable modem/router is serving as the name server and so it currently looks like this:

```
nameserver 192.168.1.1
```

This needs to be changed to the IP address of the Master DNS server:

```
nameserver 192.168.1.160
```

Save your changes and exit.

Unfortunately there is one caveat to be aware of. NetworkManager overwrites the _/etc/resolv.conf_ file if the system is rebooted or networking gets restarted. This means you will lose all of the changes that you made.

To prevent this from happening, make _/etc/resolv.conf_ immutable:

```
$ sudo chattr +i /etc/resolv.conf
```

If you want to set it back and allow it to be overwritten again:

```
$ sudo chattr -i /etc/resolv.conf
```

#### Testing the DNS server

```
$ dig fedoramagazine.org
```

```
; <<>> DiG 9.11.13-RedHat-9.11.13-2.fc30 <<>> fedoramagazine.org
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 8391
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 3, ADDITIONAL: 6

;; OPT PSEUDOSECTION:
 ; EDNS: version: 0, flags:; udp: 4096
 ; COOKIE: c7350d07f8efaa1286c670ab5e13482d600f82274871195a (good)
 ;; QUESTION SECTION:
 ;fedoramagazine.org.        IN  A

;; ANSWER SECTION:
 fedoramagazine.org.    50  IN  A   35.197.52.145

;; AUTHORITY SECTION:
 fedoramagazine.org.    86150   IN  NS  ns05.fedoraproject.org.
 fedoramagazine.org.    86150   IN  NS  ns02.fedoraproject.org.
 fedoramagazine.org.    86150   IN  NS  ns04.fedoraproject.org.

;; ADDITIONAL SECTION:
 ns02.fedoraproject.org.    86150   IN  A   152.19.134.139
 ns04.fedoraproject.org.    86150   IN  A   209.132.181.17
 ns05.fedoraproject.org.    86150   IN  A   85.236.55.10
 ns02.fedoraproject.org.    86150   IN  AAAA    2610:28:3090:3001:dead:beef:cafe:fed5
 ns05.fedoraproject.org.    86150   IN  AAAA    2001:4178:2:1269:dead:beef:cafe:fed5

 ;; Query time: 830 msec
 ;; SERVER: 192.168.1.160#53(192.168.1.160)
 ;; WHEN: Mon Jan 06 08:46:05 CST 2020
 ;; MSG SIZE  rcvd: 266
```

There are a few things to look at to verify that the DNS server is working correctly. Obviously getting the results back are important, but that by itself doesn’t mean the DNS server is actually doing the work.

The QUERY, ANSWER, and AUTHORITY fields at the top should show non-zero as it in does in our example:

```
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 3, ADDITIONAL: 6
```

And the SERVER field should have the IP address of your DNS server:

```
;; SERVER: 192.168.1.160#53(192.168.1.160)
```

In case this is the first time you’ve run the _dig_ command, notice how it took 830 milliseconds for the query to complete:

```
;; Query time: 830 msec
```

If you run it again, the query will run much quicker:

```
$ dig fedoramagazine.org
```

```
;; Query time: 0 msec
;; SERVER: 192.168.1.160#53(192.168.1.160)
```

### Client configuration

The client configuration will be a lot simpler.

Install the bind utilities:

```
$ sudo dnf install bind-utils -y
```

Edit the /etc/resolv.conf file and configure the Master DNS as the only name server:

```
$ sudo vi /etc/resolv.conf
```

This is how it should look:

```
nameserver 192.168.1.160
```

Save your changes and exit. Then, make the _/etc/resolv.conf_ file immutable to prevent it from be overwritten and going back to its default settings:

```
$ sudo chattr +i /etc/resolv.conf
```

#### Testing the client

You should get the same results as you did from the DNS server:

```
$ dig fedoramagazine.org
```

```
; <<>> DiG 9.11.13-RedHat-9.11.13-2.fc30 <<>> fedoramagazine.org
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 8391
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 3, ADDITIONAL: 6

;; OPT PSEUDOSECTION:
 ; EDNS: version: 0, flags:; udp: 4096
 ; COOKIE: c7350d07f8efaa1286c670ab5e13482d600f82274871195a (good)
 ;; QUESTION SECTION:
 ;fedoramagazine.org.        IN  A

;; ANSWER SECTION:
 fedoramagazine.org.    50  IN  A   35.197.52.145

;; AUTHORITY SECTION:
 fedoramagazine.org.    86150   IN  NS  ns05.fedoraproject.org.
 fedoramagazine.org.    86150   IN  NS  ns02.fedoraproject.org.
 fedoramagazine.org.    86150   IN  NS  ns04.fedoraproject.org.

;; ADDITIONAL SECTION:
 ns02.fedoraproject.org.    86150   IN  A   152.19.134.139
 ns04.fedoraproject.org.    86150   IN  A   209.132.181.17
 ns05.fedoraproject.org.    86150   IN  A   85.236.55.10
 ns02.fedoraproject.org.    86150   IN  AAAA    2610:28:3090:3001:dead:beef:cafe:fed5
 ns05.fedoraproject.org.    86150   IN  AAAA    2001:4178:2:1269:dead:beef:cafe:fed5

 ;; Query time: 1 msec
 ;; SERVER: 192.168.1.160#53(192.168.1.160)
 ;; WHEN: Mon Jan 06 08:46:05 CST 2020
 ;; MSG SIZE  rcvd: 266
```

Make sure the SERVER output has the IP Address of your DNS server.

Your DNS server is now ready to use and all requests from the client should be going through your DNS server now!

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-setup-a-dns-server-with-bind/

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rcurtiswarfield/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/01/dns-server-bind-1-816x345.png
