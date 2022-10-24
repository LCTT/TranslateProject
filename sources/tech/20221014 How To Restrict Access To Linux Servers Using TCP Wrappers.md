[#]: subject: "How To Restrict Access To Linux Servers Using TCP Wrappers"
[#]: via: "https://ostechnix.com/restrict-access-linux-servers-using-tcp-wrappers/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Restrict Access To Linux Servers Using TCP Wrappers
======
In this guide, we are going to learn **what is TCP Wrappers**, what is it used for, how to **install TCP Wrappers in Linux**, and how to **restrict access to Linux servers using TCP Wrappers**.

### What is TCP Wrappers?

**TCP Wrappers** (also known as **tcp_wrapper**) is an open source host-based ACL (Access Control List) system, which is used to restrict the TCP network services based on the hostname, IP address, network address, and so on. It decides which host should be allowed to access a specific network service.

TCP Wrapper was developed by a Dutch programmer and physicist **Wietse Zweitze Venema** in 1990 at the Eindhoven University of Technology. He maintained it until 1995, and then released it under BSD License in 2001.

### Is TCP Wrappers a replacement for Firewalls?

**No.** Please be aware that **TCP Wrapper is not a complete replacement for properly configured firewall**. It is just a **valuable addition to** **enhance your Linux server's security**.

Some Linux distributions such as Debian, Ubuntu have dropped the TCP Wrappers from the official repositories. Because, the last version of tcp_wrappers was released 20 years ago. At that time it was very powerful tool to "block all traffic".

However, these days we can do the same thing using firewalls/iptables/nftables for all traffic on **network level** or use similar filtering at the application level. But TCP Wrappers blocks incoming connection on application level only.

If you still prefer to use TCP Wrappers for any reason, it is always recommended to use TCP Wrappers in conjunction with a properly configured firewall and other security mechanisms and tools to harden your Linux server's security.

### Install TCP Wrappers in Linux

TCP Wrappers is available in the official repositories of most Linux operating systems.

Depending upon the Linux distribution you use, TCP Wrappers can be installed as shown below.

**On Arch-based systems**, make sure the [Community] repository is enabled and run the following command to TCP Wrappers in Arch Linux and its variants such as EndeavourOS and Manjaro Linux:

```
$ sudo pacman -S tcp-wrappers
```

**On Fedora , RHEL, CentOS, AlmaLinux and Rocky Linux:**

Make sure you've enabled the **[EPEL]** repository:

```
$ sudo dnf install epel-release
```

And then install TCP wrappers using command:

```
$ sudo dnf install tcp_wrappers
```

On RHEL 6 systems, you need to use yum instead of dnf to install TCP wrappers.

```
$ sudo yum install tcp_wrappers
```

### Configure TCP Wrappers

TCP Wrappers implements the access control with the help of two configuration files:

* /etc/hosts.allow,
* /etc/hosts.deny.

These two access control list files decides whether or not the specific clients are allowed to access your Linux server.

#### The /etc/hosts.allow file

The `/etc/hosts.allow` file contains the list of allowed or non-allowed hosts or networks. It means that we can both allow or deny connections to network services by defining access rules in this file.

#### The /etc/hosts.deny file

The `/etc/hosts.deny` file contains the list of hosts or networks that are not allowed to access your Linux server. The access rules in this file can also be set up in `/etc/hosts.allow` with a **'deny'** option.

The typical syntax to define an access rule is:

```
daemon_list : client_list : option : option ...
```

Where,

* daemon_list - The name of a network service such as SSH, FTP, Portmap etc.
* clients_list - The comma separated list of valid hostnames, IP addresses or network addresses.
* options - An optional action that specifies something to be done whenever a rule is matched.

The syntax is same for both files.

### Rules to remember

Before using TCP Wrappers, you need to know the following important rules. Please be mindful that the TCP Wrapper consults only these two files (hosts.allow and hosts.deny).

* The access rules in the `/etc/hosts.allow` file are applied first. They takes precedence over rules in `/etc/hosts.deny` file. Therefore, if access to a service is allowed in `/etc/hosts.allow` file, and a rule denying access to that same service in `/etc/hosts.deny` is ignored.
* Only one rule per service is allowed in both files (hosts.allow and `hosts.deny` files).
* The order of the rules is very important. Only the first matching rule for a given service will be taken into account. The same applies for both files.
* If there are no matching rules for a service in either files or if neither file exist, then access to the service will be granted to all remote hosts.
* Any changes in either files will come to effect immediately without restarting the network services.

### Restrict Access To Linux Servers Using TCP Wrappers

The recommended approach to secure a Linux server is to **block all incoming connections**, and allow only a few specific hosts or networks.

To do so, edit **/etc/hosts.deny** file:

```
$ sudo vi /etc/hosts.deny
```

Add the following line. This line refuses connections to ALL services and ALL networks.

```
ALL: ALL
```

Then, edit **/etc/hosts.allow** file:

```
$ sudo vi /etc/hosts.allow
```

and allow the specific hosts or networks of your choice.

```
sshd: 192.168.43.192 192.168.43.193
```

You can also specify valid hostnames instead of IP address as shown below.

```
sshd: server1.ostechnix.lan server2.ostechnx.lan
```

Alternatively, you can do the same by defining all rules (both allow and deny) in `/etc/hosts.allow` file itself.

Edit **/etc/hosts.allow** file and add the following lines.

```
sshd: 192.168.43.192 192.168.43.193
sshd: ALL: DENY
```

In this case, you don't need to specify any rule in `/etc/hosts.deny` file.

As per above rule, all incoming connections will be denied for all hosts except the two hosts 192.168.43.192, 192.168.43.193.

Now, try to SSH to your Linux server from any hosts except the above hosts, you will get the following error.

```
ssh_exchange_identification: read: Connection reset by peer
```

You can verify this from your Linux server's log files as shown below.

```
$ cat /var/log/secure
```

**Sample output:**

```
Jun 16 19:40:17 server sshd[15782]: refused connect from 192.168.43.150 (192.168.43.150)
```

Similarly, you can define rules for other services, say for example vsftpd, in `/etc/hosts.allow` file as shown below.

```
vsftpd: 192.168.43.192 
vsftpd: ALL: DENY
```

Again, you don't need to define any rules in `/etc/hosts.deny` file. As per the above rule, a remote host with IP address 192.168.43.192 is allowed to access the Linux server via FTP. All other hosts will be denied.

Also, you can define the access rules in different formats in /etc/hosts.allow file as shown below.

```
sshd: 192.168.43.192               #Allow a single host for SSH service
sshd: 192.168.43.0/255.255.255.0        #Allow a /24 prefix for SSH
vsftpd: 192.168.43.192              #Allow a single host for FTP
vsftpd: 192.168.43.0/255.255.255.0          #Allow a /24 prefix for FTP
vsftpd: server1.ostechnix.lan                   #Allow a single host for FTP
```

#### Allow all hosts except a specific host

You can allow incoming connections from all hosts, but not from a specific host. Say for example, to allow incoming connections from all hosts in the **192.168.43** subnet, but not from the host **192.168.43.192**, add the following line in `/etc/hosts.allow` file.

```
ALL: 192.168.43. EXCEPT 192.168.43.192
```

In the above case, you don't need to add any rules in /etc/hosts.deny file.

Or you can specify the hostname instead of IP address as shown below.

```
ALL: .ostechnix.lan EXCEPT badhost.ostechnix.lan
```

For more details, refer the man pages.

```
$ man tcpd
```

### Conclusion

As you can see, securing network services in your Linux systems with TCP Wrappers is easy! But keep in mind that TCP Wrapper is not a replacement for a firewall. It should be used in conjunction with firewalls and other security tools.

**Resource:**

* [Wikipedia][1]

--------------------------------------------------------------------------------

via: https://ostechnix.com/restrict-access-linux-servers-using-tcp-wrappers/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://en.wikipedia.org/wiki/TCP_Wrapper
