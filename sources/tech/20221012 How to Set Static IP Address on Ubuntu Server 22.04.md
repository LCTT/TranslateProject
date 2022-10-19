[#]: subject: "How to Set Static IP Address on Ubuntu Server 22.04"
[#]: via: "https://www.linuxtechi.com/static-ip-address-on-ubuntu-server/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Set Static IP Address on Ubuntu Server 22.04
======
In this post, we will cover how to set static ip address on Ubuntu server 22.04.

It is highly recommended to have a static ip on linux server because it would be persistent across the reboot. Static IP plays an important role for servers like Mail Server, Web Server and File server etc.

##### Prerequisites

* Minimal Installed Ubuntu Server 22.04
* Regular User with sudo admin rights

In Ubuntu server 22.04, networking is controlled by netplan utility, so we will use netplan to configure static ip address on Ubuntu server.

Note: we cannot use [nmcli utiltity][1] as it is not the part of default installation on Ubuntu server.

### Setting up Static IP address on Ubuntu Server 22.04

Login to your Ubuntu server 22.04, look for the netplan configuration file. It is located under /etc/netplan directory.

```
$ cd /etc/netplan/
$ ls -l
total 4
-rw-r--r-- 1 root root 116 Oct 12 04:03 00-installer-config.yaml
$
```

Run below cat command to view the contents of ‘00-installer-config.yaml’

Note: Name of configuration file may differ as your per setup. As it is an yaml file, so make sure to maintain the indentation and syntax while editing.

```
$ cat 00-installer-config.yaml
```

Output,

![Default-Content-netplan-ubuntu-server][2]

As per above output, it says that we have ens33 interface and it is getting ip from dhcp server. Alternate way to view interface name is via ip command.

Now, to configure static ip in place of dhcp, edit netplan configuration file using vi or nano editor and add the following content.

```
$ sudo vi 00-installer-config.yaml
# This is the network config written by 'subiquity'
network:
  renderer: networkd
  ethernets:
    ens33:
      addresses:
        - 192.168.1.247/24
      nameservers:
        addresses: [4.2.2.2, 8.8.8.8]
      routes:
        - to: default
          via: 192.168.1.1
  version: 2
```

save and close the file.

![Updated-Netplan-Config-File-Content-Ubuntu-Server][3]

In the above file we have used following,

* ens33 is the interface name
* addresses are used to set the static ip
* nameservers used to specify the DNS server ips
* routes used to specify the default gateway

Note: Change the IP details and interface name as per your environment.

To make above changes into the effect the apply these changes using following netplan command,

```
$ sudo netplan apply
```

Run following ip command to view the ip address on interface,

```
$ ip addr show ens33
```

To view the default route, run

```
$ ip route show
```

Output of above commands,

![ip-addr-route-command-output-ubuntu-server][4]

Perfect, above commands’ output confirms that static ip and route has been configured successfully.

That’s all from this post. Kindly do post your queries and feedback in below comments section.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/static-ip-address-on-ubuntu-server/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/configure-ip-with-nmcli-command-linux/
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/10/Default-Content-netplan-ubuntu-server.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/10/Updated-Netplan-Config-File-Content-Ubuntu-Server.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/10/ip-addr-route-command-output-ubuntu-server.png
