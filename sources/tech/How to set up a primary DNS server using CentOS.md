Translating by GOLinux ...

How to set up a primary DNS server using CentOS
================================================================================
Any operational domain has at least two DNS servers, one being called a primary name server (ns1), and the other a secondary name server (ns2). These servers are typically operated for DNS failover: If one server goes down, the other server becomes an active DNS server. More sophisticated failover mechanisms involving load balancers, firewalls and clusters are also possible.

All DNS entries for a particular domain are added in the primary name server. The secondary server will simply sync all the information from the primary name server based on counter type parameter set on the primary server.

This tutorial will describe **how to create a primary DNS server running on CentOS**. Please note that the DNS server presented in this tutorial will be public DNS, meaning that the server will respond to queries from any IP address. Limiting access to the server is discussed in [this tutorial][].

Before we start, I would like to mention that DNS can be set up with or without chroot jail environment. The chroot jail environment confines the DNS server to a certain directory in the system, as opposed to allow the server system-wide access. That way, any vulnerability of the DNS server would not compromise the entire system. Chrooting a DNS server is also useful for a test deployment.

### Objective ###

We will be setting up a DNS server in a test environment for the domain example.tst, which is a hypothetical (non-existing) domain. That way, we will not accidentally interfere with any other live domain.

In this domain, there are the following three servers.

注：表格代码，只需要翻译尖括号中间的文字即可
<table>
<tbody><tr>
<td>Server</td>
<td>IP address</td>
<td>Hosted services</td>
<td>FQDN</td>
</tr>
<tr>
<td>Server A</td>
<td>172.16.1.1</td>
<td>Mail</td>
<td>mail.example.tst</td>
</tr>
<tr>
<td>Server B</td>
<td>172.16.1.2</td>
<td>Web, FTP</td>
<td>www.example.tst<br>ftp.example.tst</td>
</tr>
<tr>
<td>Server C</td>
<td>172.16.1.3</td>
<td>Primary DNS server</td>
<td>ns1.example.tst</td>
</tr>
</tbody></table>

We will be setting up a primary DNS server, and add necessary domain and DNS records as shown in the table.

### Setting up hostnames ###

All the hostnames should be defined as FQDN correctly. This can be done using the following method.

    # vim /etc/sysconfig/network 

> HOSTNAME=ns1.example.tst

Note: The hostname parameter specified in this file is used while the server is booting up. Therefore, the change does not take effect immediately. The following command can be used to temporarily change the hostname of a server immediately.

    # hostname ns1.example.tst 

Once set, hostname can be verified using the following command.

    # hostname 

> ns1.example.tst

Before proceeding to the next step, make sure that the hostname of all three servers are set properly.

### Installing Packages ###

We will be using bind for DNS, which can be easily installed using yum.

To set up DNS without `chroot`:

    # yum install bind bind-chroot 

### Preparing a Configuration File ###

As mentioned earlier, bind can be set up with or without chroot. The paths vary a little depending on whether chroot has been installed.

注：表格代码，只需要翻译尖括号中间的文字即可
<table>
<tbody><tr>
<td></td>
<td>Path to configuration file</td>
<td>Path to zone files</td>
</tr>
<tr>
<td>
With <tt>chroot</tt>
</td>
<td>
/etc/
</td>
<td>
/var/named/
</td>
</tr>
<tr>
<td>
Without <tt>chroot</tt>
</td>
<td>
/var/named/chroot/etc/
</td>
<td>
/var/named/chroot/var/named/
</td>
</tr>
</tbody></table>

The configuration file named.conf provided by default can be used. However, we will be using another sample configuration file for ease of use.

Without `chroot`:

    # cp /usr/share/doc/bind-9.8.2/sample/etc/named.rfc1912.zones /etc/named.conf

With `chroot`:

    # cp /usr/share/doc/bind-9.8.2/sample/etc/named.rfc1912.zones /var/named/chroot/etc/named.conf

Now, the configuration file is backed up and modified.

Without `chroot`:

    # vim /etc/named.conf 

With `chroot`:

    # vim /var/named/chroot/etc/named.conf 

The following lines are added/modified.

    options {
    ## path to zone files ##
    directory "/var/named";
    
    ## forwarding the query to Google public DNS server for non-local domains ##
    forwarders { 8.8.8.8; };
    };
    
    ## declaration of the forward zone for example.tst ##
    zone "example.tst" IN {
            type master;
            file "example-fz"; ## filename for the forward zone stored in /var/named ##
            allow-update { none; };
    };
    
    ## declaration of reverse zone for network 172.16.1.0 ##
    zone "1.16.172.in-addr.arpa" IN {
            type master;
            file "rz-172-16-1"; ## filename for the reverse zone stored in /var/named ##
            allow-update { none; };
    };

### Preparing Zone Files ###

The default zone files are automatically created under `/var/named or /var/named/chroot/var/named` (for `chroot`). If they are not available there, sample files are provided in `/usr/share/doc/bind` folder, and can be copied from there.

Assuming that the default zone files are not present, we can copy the sample files from `/usr`.

Without `chroot`:

    # cp /usr/share/doc/bind-9.8.2/sample/var/named/named.* /var/named/

With `chroot`:

    # cp /usr/share/doc/bind-9.8.2/sample/var/named/named.* /var/named/chroot/var/named

Great. Now that the default zone files are ready, we create our own zone file for example.tst and network 172.16.1.0. While we create the zone files, the following should be kept in mind.

- The characted ‘@’ means NULL within the zone files.
- Every FQDN is to end with a dot ‘.’ i.e. mail.example.tst. Without it, you’ll be in trouble. 

#### 1. Forward Zone ####

The forward zone contains mapping from names to IP addresses. For public domains, the DNS of the domain hosting provider stores the forward zone file.

Without `chroot`:

    # vim /var/named/example-fz 

With `chroot`:

    # vim /var/named/chroot/var/named/example-fz 

----------

    $TTL 1D
    @       IN SOA  ns1.example.tst. sarmed.example.tst. (
                                            0       ; serial
                                            1D      ; refresh
                                            1H      ; retry
                                            1W      ; expire
                                            3H )    ; minimum
    IN NS      ns1.example.tst.
    IN A       172.16.1.3
    mail		IN A		172.16.1.1
    		IN MX 10	mail.example.tst.
    www		IN A		172.16.1.2
    ns1		IN A		172.16.1.3
    ftp		IN CNAME	www.example.tst.

**Explanation**: Within the zone file, SOA means start of authority. This is the FQDN of the authoritative name server. The FQDN is followed by the contact email address. Since we cannot use ‘@’ in sarmed@example.tst, we rewrite the email address as sarmed.example.tst.

- **NS**: Name Server
- **A**: A record or the address record is an IP address
- **MX**: Mail Exchanger record. Here we are using only one MX with priority of 10. In case of multiple MX, we can use multiple numeric priorities. The lowest number wins. For example, MX 0 is better than MX 1.
- **CNAME**: Canonical Name. If multiple services are hosted in a single server, it is very likely that multiple names would be resolved to that single server as well. CNAME indicates the other names a server may have and points to the name that actually has an A record. 

#### 2. Reverse Zone ####

The reverse zone contains mapping from IP address to names. Here, we create the reverse zone for the network 172.16.1.0. In production domains, the DNS server of the owner of the public IP block stores the reverse zone file.

Without `chroot`:

    # vim /var/named/rz-172-16-1 

With `chroot`

    # vim /var/named/chroot/var/named/rz-172-16-1 

----------

    $TTL 1D
    @       IN SOA  ns1.example.tst. sarmed.example.tst. (
                                            0       ; serial
                                            1D      ; refresh
                                            1H      ; retry
                                            1W      ; expire
                                            3H )    ; minimum
    IN NS      ns1.example.tst.
    1		IN PTR	mail.example.tst.
    2		IN PTR	www.example.tst.
    3		IN PTR	ns1.example.tst.

**Explanation**: Most parameters used in the reverse zone file are identical to the forward zone, except the following.

- PTR: PTR or pointer record points to a FQDN` 

### Finalizing ###

Now that the zone files are ready, we adjust the permission of the zone files.

Without `chroot`:

    # chgrp named /var/named/* 

With `chroot`:

    # chgrp named /var/named/chroot/var/named/* 

Now we set the IP address of the DNS server.

    # vim /etc/resolv.conf 

----------

    nameserver 172.16.1.3

Finally, we can start the DNS service and make sure it is added to startup.

    # service named restart
    # chkconfig named on 

While the DNS is firing up, it is advisable to keep an eye on the log file /var/log/messages as it contains useful information about what is going on behind the scenes. If there is no error, we can start testing the DNS server.

### Testing DNS ###

We can use dig or nslookup for testing DNS. First, we set up necessary package(s).

    # yum install bind-utils 

#### 1. Testing Forward Zone using dig ####

When you are using dig for testing, you should always look for the status: "NOERROR". Any other value means that there is something wrong.

    # dig example.tst 

----------

    ;; ->>HEADER<<- opcode: QUERY,  status: NOERROR, id: 31184
    
    ;; QUESTION SECTION:
    ;example.com.                   IN      A
    
    ;; ANSWER SECTION:
    example.com.            86400   IN      A       172.16.1.3
    
    ;; AUTHORITY SECTION:
    example.com.            86400   IN      NS      ns1.example.com.
    
    ;; ADDITIONAL SECTION:
    ns1.example.com.        86400   IN      A       172.16.1.3

#### 2. Testing PTR using dig ####

When using dig for testing, you should always look for the status: "NOERROR". Any other value means that there is something wrong.

    # dig -x 172.16.1.1 

----------

    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 27415
    
    ;; QUESTION SECTION:
    ;1.1.17.172.in-addr.arpa.       IN      PTR
    
    ;; ANSWER SECTION:
    1.1.16.172.in-addr.arpa. 86400  IN      PTR     mail.example.tst.
    
    ;; AUTHORITY SECTION:
    1.16.172.in-addr.arpa.  86400   IN      NS      ns1.example.tst.
    
    ;; ADDITIONAL SECTION:
    ns1.example.tst.        86400   IN      A       172.16.1.3

#### 3. Testing MX using dig ####

    # dig example.tst mx 

----------

    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 35405
    
    ;; QUESTION SECTION:
    ;example.tst.                        IN      MX
    
    ;; ANSWER SECTION:
    example.tst.         14366   IN      MX     10	mail.example.tst.

### Troubleshooting Tips ###

1. I have SELinux turned off.
1. Make sure that your firewall is not blocking UDP port 53
1. /var/log/messages should contain useful information in case anything goes wrong
1. Make sure that the zone files are owned by user ‘named’
1. Make sure that the IP address of the DNS server is the first entry in /etc/resolv.conf
1. If you are using example.tst in a lab environment, make sure to disconnect the server from the Intenet since example.tst is a non-existent domain. 

To sum up, this tutorial focuses on hosting a domain example.tst in a lab environment for demonstration purposes. Please note that this tutorial creates a public DNS server, i.e., a DNS server that will respond to queries from any source IP address. If you are configuring a production DNS server, make sure to check what the policies regarding public DNS are. Other tutorials cover [pcreating a secondary DNS][2], [limiting access to a DNS server][3], and implementing DNSSEC.

Hope this helps.
--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/04/primary-dns-server-using-centos.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2014/04/close-open-dns-resolver.html
[2]:http://xmodulo.com/2014/04/secondary-dns-server-centos.html
[3]:http://xmodulo.com/2014/04/close-open-dns-resolver.html
