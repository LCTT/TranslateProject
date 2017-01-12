Join an Additional Ubuntu DC to Samba4 AD DC for FailOver Replication – Part 5
============================================================

This tutorial will show you how to add a second Samba4 domain controller, provisioned on Ubuntu 16.04 server, to the existing Samba AD DC forest in order to provide a degree of load balancing/failover for some crucial AD DC services, especially for services such as DNS and AD DC LDAP schema with SAM database.

#### Requirements

1.  [Create an Active Directory Infrastructure with Samba4 on Ubuntu – Part 1][1]

This article is a Part-5 of Samba4 AD DC series as follows:

Part 2: [Manage Samba4 AD Infrastructure from Linux Command Line][2]Part 3: [Manage Samba4 Active Directory Infrastructure from Windows10 via RSAT][3]Part 4: [Manage Samba4 AD Domain Controller DNS and Group Policy from Windows][4]

### Step 1: Initial Configuration for Samba4 Setup

1. Before you start to actually perform domain joining for the second DC, you need to take care of few initial settings. First, make sure the hostname of the system which will be integrated into Samba4 AD DC contains a descriptive name.

Assuming that the hostname of the first provisioned realm is called `adc1`, you can name the second DC with `adc2` in order to provide a consistent naming scheme across your Domain Controllers.

To change the system hostname you can issue the below command.

```
# hostnamectl set-hostname adc2
```

else you can manually edit /etc/hostname file and add a new line with the desired name.

```
# nano /etc/hostname
```

Here add the hostname.

```
adc2
```

2. Next, open local system resolution file and add an entry with the IP address witch points to the short name and FQDN of the main domain controller, as illustrated in the below screenshot.

Through this tutorial, the primary DC name is `adc1.tecmint.lan` and it resolves to 192.168.1.254 IP address.

```
# nano /etc/hosts
```

Add the following line:

```
IP_of_main_DC		FQDN_of_main_DC 	short_name_of_main_DC
```
[
 ![Set Hostname for Samba4 AD DC](http://www.tecmint.com/wp-content/uploads/2017/01/Set-Hostname-for-Samba4-AD-DC.jpg) 
][5]

Set Hostname for Samba4 AD DC

3. On the next step, open /etc/network/interfaces and assign a static IP address for your system as illustrated in the below screenshot.

Pay attention to dns-nameservers and dns-search variables. These values should be configured to point back to the IP address of the primary Samba4 AD DC and realm in order for DNS resolution to work correctly.

Restart the network daemon in order to reflect changes. Verify /etc/resolv.conf file to assure that both DNS values from your network interface are updated to this file.

```
# nano /etc/network/interfaces
```

Edit and replace with your custom IP settings:

```
auto ens33
iface ens33 inet static
address 192.168.1.253
netmask 255.255.255.0
brodcast 192.168.1.1
gateway 192.168.1.1
dns-nameservers 192.168.1.254
dns-search tecmint.lan
```

Restart network service and confirm changes.

```
# systemctl restart networking.service
# cat /etc/resolv.conf
```
[
 ![Configure DNS for Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-DNS-for-Samba4-AD.jpg) 
][6]

Configure DNS for Samba4 AD

The dns-search value will automatically append the domain name when you query a host by its short name (will form the FQDN).

4. In order to test if DNS resolution is working as expected, issue a series of ping commands against your domain short name, FQDN and realm as shown in the below screenshot.

In all these cases Samba4 AD DC DNS server should reply with the IP address of your main DC.

[
 ![Verify DNS Resolution for Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-DNS-Resolution-for-Samba4-AD.png) 
][7]

Verify DNS Resolution for Samba4 AD

5. The final additional step that you need to take care off is time synchronization with your main Domain Controller. This can be accomplished by installing NTP client utility on your system by issuing the below command:

```
# apt-get install ntpdate
```

6. Assuming that you want to manually force time synchronization with samba4 AD DC, run ntpdate command against the primary DC by issuing the following command.

```
# ntpdate adc1
```
[
 ![Time Synchronize with Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Time-Synchronize-with-Samba4-AD.png) 
][8]

Time Synchronize with Samba4 AD

### Step 2: Install Samba4 with Required Dependencies

7. In order to enroll Ubuntu 16.04 system into your domain, first install Samba4, Kerberos client and a few other important packages for later use from Ubuntu official repositories by issuing the below command:

```
# apt-get install samba krb5-user krb5-config winbind libpam-winbind libnss-winbind
```
[
 ![Install Samba4 in Ubuntu](http://www.tecmint.com/wp-content/uploads/2017/01/Install-Samba4-in-Ubuntu.png) 
][9]

Install Samba4 in Ubuntu

8. During the installation you will need to provide Kerberos realm name. Write your domain name with upper cases and press [Enter] key to finish the installation process.

[
 ![Configure Kerberos Authentication for Samba4](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Kerberos-Authentication-for-Samba4.png) 
][10]

Configure Kerberos Authentication for Samba4

9. After the packages installation finishes, verify the settings by requesting a Kerberos ticket for a domain administrator using kinit command. Use klist command to list granted Kerberos ticket.

```
# kinit domain-admin-user@YOUR_DOMAIN.TLD
# klist
```
[
 ![Verify Kerberos on Samba4 Domain](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Kerberos-on-Samba4-Domain.png) 
][11]

Verify Kerberos on Samba4 Domain

### Step 3: Join to Samba4 AD DC as a Domain Controller

10. Before integrating your machine into Samba4 DC, first make sure all Samba4 daemons running on your system are stopped and, also, rename the default Samba configuration file in order to start clean. While provisioning the domain controller, samba will create a new configuration file from scratch.

```
# systemctl stop samba-ad-dc smbd nmbd winbind
# mv /etc/samba/smb.conf /etc/samba/smb.conf.initial
```

11. In order to start the domain joining process, first start only samba-ad-dc daemon, after which you will run samba-tool command to join the realm using an account with administrative privileges on your domain.

```
# samba-tool domain join your_domain -U "your_domain_admin"
```

Domain integration excerpt:

```
# samba-tool domain join tecmint.lan DC -U"tecmint_user"
```

##### Sample Output

```
Finding a writeable DC for domain 'tecmint.lan'
Found DC adc1.tecmint.lan
Password for [WORKGROUP\tecmint_user]:
workgroup is TECMINT
realm is tecmint.lan
checking sAMAccountName
Deleted CN=ADC2,CN=Computers,DC=tecmint,DC=lan
Adding CN=ADC2,OU=Domain Controllers,DC=tecmint,DC=lan
Adding CN=ADC2,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=tecmint,DC=lan
Adding CN=NTDS Settings,CN=ADC2,CN=Servers,CN=Default-First-Site-Name,CN=Sites,CN=Configuration,DC=tecmint,DC=lan
Adding SPNs to CN=ADC2,OU=Domain Controllers,DC=tecmint,DC=lan
Setting account password for ADC2$
Enabling account
Calling bare provision
Looking up IPv4 addresses
Looking up IPv6 addresses
No IPv6 address will be assigned
Setting up share.ldb
Setting up secrets.ldb
Setting up the registry
Setting up the privileges database
Setting up idmap db
Setting up SAM db
Setting up sam.ldb partitions and settings
Setting up sam.ldb rootDSE
Pre-loading the Samba 4 and AD schema
A Kerberos configuration suitable for Samba 4 has been generated at /var/lib/samba/private/krb5.conf
Provision OK for domain DN DC=tecmint,DC=lan
Starting replication
Schema-DN[CN=Schema,CN=Configuration,DC=tecmint,DC=lan] objects[402/1550] linked_values[0/0]
Schema-DN[CN=Schema,CN=Configuration,DC=tecmint,DC=lan] objects[804/1550] linked_values[0/0]
Schema-DN[CN=Schema,CN=Configuration,DC=tecmint,DC=lan] objects[1206/1550] linked_values[0/0]
Schema-DN[CN=Schema,CN=Configuration,DC=tecmint,DC=lan] objects[1550/1550] linked_values[0/0]
Analyze and apply schema objects
Partition[CN=Configuration,DC=tecmint,DC=lan] objects[402/1614] linked_values[0/0]
Partition[CN=Configuration,DC=tecmint,DC=lan] objects[804/1614] linked_values[0/0]
Partition[CN=Configuration,DC=tecmint,DC=lan] objects[1206/1614] linked_values[0/0]
Partition[CN=Configuration,DC=tecmint,DC=lan] objects[1608/1614] linked_values[0/0]
Partition[CN=Configuration,DC=tecmint,DC=lan] objects[1614/1614] linked_values[28/0]
Replicating critical objects from the base DN of the domain
Partition[DC=tecmint,DC=lan] objects[97/97] linked_values[24/0]
Partition[DC=tecmint,DC=lan] objects[380/283] linked_values[27/0]
Done with always replicated NC (base, config, schema)
Replicating DC=DomainDnsZones,DC=tecmint,DC=lan
Partition[DC=DomainDnsZones,DC=tecmint,DC=lan] objects[45/45] linked_values[0/0]
Replicating DC=ForestDnsZones,DC=tecmint,DC=lan
Partition[DC=ForestDnsZones,DC=tecmint,DC=lan] objects[18/18] linked_values[0/0]
Committing SAM database
Sending DsReplicaUpdateRefs for all the replicated partitions
Setting isSynchronized and dsServiceName
Setting up secrets database
Joined domain TECMINT (SID S-1-5-21-715537322-3397311598-55032968) as a DC
```
[
 ![Join Domain to Samba4 AD DC](http://www.tecmint.com/wp-content/uploads/2017/01/Join-Domain-to-Samba4-AD-DC.png) 
][12]

Join Domain to Samba4 AD DC

12. After the Ubuntu with samba4 software has been integrated into the domain, open samba main configuration file and add the following lines:

```
# nano /etc/samba/smb.conf
```

Add following excerpt to smb.conf file.

```
dns forwarder = 192.168.1.1
idmap_ldb:use rfc2307 = yes
template shell = /bin/bash
winbind use default domain = true
winbind offline logon = false
winbind nss info = rfc2307
winbind enum users = yes
winbind enum groups = yes
```

Replace dns forwarder IP address with your own DNS forwarder IP. Samba will forward all DNS resolution queries that are outside your domain authoritative zone to this IP address.

13. Finally, restart samba daemon to reflect changes and check active directory replication by executing the following commands.

```
# systemctl restart samba-ad-dc
# samba-tool drs showrepl
```
[
 ![Configure Samba4 DNS](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Samba4-DNS.png) 
][13]

Configure Samba4 DNS

14. Additionally, rename initial Kerberos configuration file from /etc path and replace it with the new krb5.confconfiguration file generated by samba while provisioning the domain.

The file is located in /var/lib/samba/private directory. Use Linux symlink to link this file to /etc directory.

```
# mv /etc/krb6.conf /etc/krb5.conf.initial
# ln -s /var/lib/samba/private/krb5.conf /etc/
# cat /etc/krb5.conf
```
[
 ![Configure Kerberos](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Kerberos.jpg) 
][14]

Configure Kerberos

15. Also, verify Kerberos authentication with samba krb5.conf file. Request a ticket for an administrator user and list the cached ticket by issuing the below commands.

```
# kinit administrator
# klist
```
[
 ![Verify Kerberos Authentication with Samba](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Kerberos-Authentication-with-Samba.jpg) 
][15]

Verify Kerberos Authentication with Samba

### Step 4: Additional Domain Services Validations

16. The first test you need to perform is Samba4 DC DNS resolution. To validate your domain DNS resolution, query the domain name using host command against a few crucial AD DNS records as presented on the below screenshot.

The DNS server should replay by now with a pair of two IP addresses for each query.

```
# host your_domain.tld
# host -t SRV _kerberos._udp.your_domain.tld  # UDP Kerberos SRV record
# host -t SRV _ldap._tcp.your_domain.tld  # TCP LDAP SRV record
```
[
 ![Verify Samba4 DC DNS](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Samba4-DC-DNS.png) 
][16]

Verify Samba4 DC DNS

17. These DNS records should also be visible from an enrolled [Windows machine with RSAT tools installed][17]. Open DNS Manager and expand to your domain tcp records as shown in the below image.

[
 ![Verify DNS Records on Windows RSAT Tool](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-DNS-Records-on-Windows-RSAT-Tool.png) 
][18]

Verify DNS Records on Windows RSAT Tool

18. The next test should indicate if domain LDAP replication works as expected. Using samba-tool, create an account on the second domain controller and verify if the account is automatically replicated on the first Samba4 AD DC.

##### On adc2:

```
# samba-tool user add test_user
```

##### On adc1:

```
# samba-tool user list | grep test_user
```
[
 ![Create User Account on Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Create-User-Account-on-Samba4-AD.jpg) 
][19]

Create User Account on Samba4 AD

[
 ![Verify Replication on Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Replication-on-Samba4-AD.jpg) 
][20]

Verify Replication on Samba4 AD

19. You can also create an account from a Microsoft AD UC console and verify if the account appears on both domain controllers.

By default, the account should be automatically created on both samba domain controllers. Query the account name from `adc1` using wbinfo command.

[
 ![Create Account from Microsoft AD UC](http://www.tecmint.com/wp-content/uploads/2017/01/Create-Account-from-Microsoft-AD-UC.png) 
][21]

Create Account from Microsoft AD UC

[
 ![Verify Account Replication On Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Account-Replication-On-Samba4-AD.png) 
][22]

Verify Account Replication On Samba4 AD

20. As a fact, open AD UC console from Windows, expand to Domain Controllers and you should see both enrolled DC machines.

[
 ![Verify Samba4 Domain Controllers](http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Samba4-Domain-Controllers.png) 
][23]

Verify Samba4 Domain Controllers

### Step 5: Enable Samba4 AD DC Service

21. In order to enable samba4 AD DC services system-wide, first disable some old and unused Samba daemons and enable only samba-ad-dc service by running the below commands:

```
# systemctl disable smbd nmbd winbind
# systemctl enable samba-ad-dc
```
[
 ![Enable Samba4 AD DC Services](http://www.tecmint.com/wp-content/uploads/2017/01/Enable-Samba4-AD-DC-Services.png) 
][24]

Enable Samba4 AD DC Services

22. If you remotely administer Samba4 domain controller from a Microsoft client or you have other Linux or Windows clients integrated into your domain, make sure you mention the IP address of the `adc2` machine to their network interface DNS server IP settings in order to gain a level of redundancy.

The below screenshots illustrates the configurations required for a Windows or a Debian/Ubuntu client.

[
 ![Configure Client to Administer Samba4 DC](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Client-to-Administer-Samba4-DC.png) 
][25]

Configure Client to Administer Samba4 DC

[
 ![Configure Linux Client to Administer Samba4 DC](http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Linux-Client-to-Administer-Samba4-DC.png) 
][26]

Configure Linux Client to Administer Samba4 DC

Assuming that the first DC with 192.168.1.254 goes offline, reverse the order of the DNS server IP addresses in the configuration file so it won’t try to query first an unavailable DNS server.

Finally, in case you want to perform local authentication on a Linux system with a Samba4 Active Directory account or grant root privileges for AD LDAP accounts in Linux, read the steps 2 and 3 from the tutorial [Manage Samba4 AD Infrastructure from Linux Command Line][27].

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/7badddbc53297b2e8ed7011cf45df0c0?s=128&d=blank&r=g)

I am Ravi Saive, creator of TecMint. A Computer Geek and Linux Guru who loves to share tricks and tips on Internet. Most Of My Servers runs on Open Source Platform called Linux. Follow Me: Twitter, Facebook and Google+

--------------------------------------------------------------------------------

via: http://www.tecmint.com/join-additional-ubuntu-dc-to-samba4-ad-dc-failover-replication/

作者：[Ravi Saive][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[1]:http://www.tecmint.com/install-samba4-active-directory-ubuntu/
[2]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/
[3]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/
[4]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/
[5]:http://www.tecmint.com/wp-content/uploads/2017/01/Set-Hostname-for-Samba4-AD-DC.jpg
[6]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-DNS-for-Samba4-AD.jpg
[7]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-DNS-Resolution-for-Samba4-AD.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/01/Time-Synchronize-with-Samba4-AD.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/01/Install-Samba4-in-Ubuntu.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Kerberos-Authentication-for-Samba4.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Kerberos-on-Samba4-Domain.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/01/Join-Domain-to-Samba4-AD-DC.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Samba4-DNS.png
[14]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Kerberos.jpg
[15]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Kerberos-Authentication-with-Samba.jpg
[16]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Samba4-DC-DNS.png
[17]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/
[18]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-DNS-Records-on-Windows-RSAT-Tool.png
[19]:http://www.tecmint.com/wp-content/uploads/2017/01/Create-User-Account-on-Samba4-AD.jpg
[20]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Replication-on-Samba4-AD.jpg
[21]:http://www.tecmint.com/wp-content/uploads/2017/01/Create-Account-from-Microsoft-AD-UC.png
[22]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Account-Replication-On-Samba4-AD.png
[23]:http://www.tecmint.com/wp-content/uploads/2017/01/Verify-Samba4-Domain-Controllers.png
[24]:http://www.tecmint.com/wp-content/uploads/2017/01/Enable-Samba4-AD-DC-Services.png
[25]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Client-to-Administer-Samba4-DC.png
[26]:http://www.tecmint.com/wp-content/uploads/2017/01/Configure-Linux-Client-to-Administer-Samba4-DC.png
[27]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/
