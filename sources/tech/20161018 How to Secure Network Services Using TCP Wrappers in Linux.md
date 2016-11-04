How to Secure Network Services Using TCP Wrappers in Linux
===========


In this article we will explain what TCP wrappers are and how to configure them to [restrict access to network services][7] running on a Linux server. Before we start, however, we must clarify that the use of TCP wrappers does not eliminate the need for a properly [configured firewall][6].

In this regard, you can think of this tool as a [host-based access control list][5], and not as the [ultimate security measure][4] for your system. By using a firewall and TCP wrappers, instead of favoring one over the other, you will make sure that your server is not left with a single point of failure.

### Understanding hosts.allow and hosts.deny

When a network request reaches your server, TCP wrappers uses `hosts.allow` and `hosts.deny` (in that order) to determine if the client should be allowed to use a given service.

By default, these files are empty, all commented out, or do not exist. Thus, everything is allowed through the TCP wrappers layer and your system is left to rely on the firewall for full protection. Since this is not desired, due to the reason we stated in the introduction, make sure both files exist:

```
# ls -l /etc/hosts.allow /etc/hosts.deny

```

The syntax of both files is the same:

```
<services> : <clients> [: <option1> : <option2> : ...]

```

where,

1.  services is a comma-separated list of services the current rule should be applied to.
2.  clients represent the list of comma-separated hostnames or IP addresses affected by the rule. The following wildcards are accepted:
    1.  ALL matches everything. Applies both to clients and services.
    2.  LOCAL matches hosts without a period in their FQDN, such as localhost.
    3.  KNOWN indicate a situation where the hostname, host address, or user are known.
    4.  UNKNOWN is the opposite of KNOWN.
    5.  PARANOID causes a connection to be dropped if reverse DNS lookups (first on IP address to determine host name, then on host name to obtain the IP addresses) return a different address in each case.
3.  Finally, an optional list of colon-separated actions indicate what should happen when a given rule is triggered.

You may want to keep in mind that a rule allowing access to a given service in `/etc/hosts.allow` takes precedence over a rule in `/etc/hosts.deny` prohibiting it. Additionally, if two rules apply to the same service, only the first one will be taken into account.

Unfortunately, not all network services support the use of TCP wrappers. To determine if a given service supports them, do:

```
# ldd /path/to/binary | grep libwrap

```

If the above command returns output, it can be TCP-wrapped. An example of this are sshd and vsftpd, as shown here:

[![Find Supported Services in TCP Wrapper](http://www.tecmint.com/wp-content/uploads/2016/10/Find-Supported-Services-in-TCP-Wrapper.png)][3]

Find Supported Services in TCP Wrapper

### How to Use TCP Wrappers to Restrict Access to Services

As you edit `/etc/hosts.allow` and `/etc/hosts.deny`, make sure you add a newline by pressing Enter after the last non-empty line.

To [allow SSH and FTP access][2] only to 192.168.0.102 and localhost and deny all others, add these two lines in `/etc/hosts.deny`:

```
sshd,vsftpd : ALL
ALL : ALL

```

and the following line in `/etc/hosts.allow`:

```
sshd,vsftpd : 192.168.0.102,LOCAL

```

TCP Wrappers – hosts.deny File
```
#
# hosts.deny	This file contains access rules which are used to
#		deny connections to network services that either use
#		the tcp_wrappers library or that have been
#		started through a tcp_wrappers-enabled xinetd.
#
#		The rules in this file can also be set up in
#		/etc/hosts.allow with a 'deny' option instead.
#
#		See 'man 5 hosts_options' and 'man 5 hosts_access'
#		for information on rule syntax.
#		See 'man tcpd' for information on tcp_wrappers
#
sshd,vsftpd : ALL
ALL : ALL

```

TCP Wrappers – hosts.allow File
```
#
# hosts.allow	This file contains access rules which are used to
#		allow or deny connections to network services that
#		either use the tcp_wrappers library or that have been
#		started through a tcp_wrappers-enabled xinetd.
#
#		See 'man 5 hosts_options' and 'man 5 hosts_access'
#		for information on rule syntax.
#		See 'man tcpd' for information on tcp_wrappers
#
sshd,vsftpd : 192.168.0.102,LOCAL

```

These changes take place immediately without the need for a restart.

In the following image you can see the effect of removing the word `LOCAL` from the last line: the FTP server will become unavailable for localhost. After we add the wildcard back, the service becomes available again.

[![Verify FTP Access ](http://www.tecmint.com/wp-content/uploads/2016/10/Verify-FTP-Access.png)][1]
>Verify FTP Access

To allow all services to hosts where the name contains `example.com`, add this line in `hosts.allow`:

```
ALL : .example.com

```

and to deny access to vsftpd to machines on 10.0.1.0/24, add this line in `hosts.deny`:

```
vsftpd : 10.0.1.

```

On the last two examples, notice the dot at the beginning and the end of the client list. It is used to indicate “ALL hosts and / or clients where the name or the IP contains that string”.

Was this article helpful to you? Do you have any questions or comments? Feel free to drop us a note using the comment form below.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/secure-linux-tcp-wrappers-hosts-allow-deny-restrict-access/

作者：[Gabriel Cánepa][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/wp-content/uploads/2016/10/Verify-FTP-Access.png
[2]:http://www.tecmint.com/block-ssh-and-ftp-access-to-specific-ip-and-network-range/
[3]:http://www.tecmint.com/wp-content/uploads/2016/10/Find-Supported-Services-in-TCP-Wrapper.png
[4]:http://www.tecmint.com/linux-server-hardening-security-tips/
[5]:http://www.tecmint.com/secure-files-using-acls-in-linux/
[6]:http://www.tecmint.com/configure-firewalld-in-centos-7/
[7]:http://www.tecmint.com/mandatory-access-control-with-selinux-or-apparmor-linux/
