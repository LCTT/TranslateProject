Create an Active Directory Infrastructure with Samba4 on Ubuntu – Part 1
============================================================

Samba is a free Open Source software which provides a standard interoperability between Windows OSand Linux/Unix Operating Systems.

Samba can operate as a standalone file and print server for Windows and Linux clients through the SMB/CIFS protocol suite or can act as an Active Directory Domain Controller or joined into a Realm as a Domain Member. The highest AD DC domain and forest level that currently Samba4 can emulate is Windows 2008 R2.

The series will be titled Setting Up Samba4 Active Directory Domain Controller, which covers following topics for Ubuntu, CentOS, and Windows:

Part 1: Install Active Directory Infrastructure with SAMBA4 on UbuntuPart 2: [Manage Samba4 AD Infrastructure from Linux Command Line][4]Part 3: Install RSAT on Windows 10 Client to Manage Samba4 AD InfrastructurePart 4: Joining Samba4 DC to Existing AD Infrastructure with Sysvol ReplicationPart 5: Add a Shared Volume from Linux DC and Map to AD via GPOPart 6: Integrate Ubuntu 16.04 to AD as a Domain MemberPart 7: Integrate CentOS 7 to AD as a Domain MemberPart 8: Create Apache Website with Kerberos Authentication on AD Intranet

This tutorial will start by explaining all the steps you need to take care off in order to install and configure Samba4 as a Domain Controller on Ubuntu 16.04 and Ubuntu 14.04.

This configuration will provide a central management point for users, machines, volume shares, permissions and other resources in a mixed-up Windows – Linux infrastructure.

#### Requirements:

1.  [Ubuntu 16.04 Server Installation][1].
2.  [Ubuntu 14.04 Server Installation][2].
3.  [A static IP Address configured][3] for your AD DC server.

### Step 1: Initial Configuration for Samba4

1. Before proceeding your Samba4 AD DC installation first let’s run a few pre-required steps. First make sure the system is up to date with the last security features, kernels and packages by issuing the below command:

```
$ sudo apt-get update 
$ sudo apt-get upgrade
$ sudo apt-get dist-upgrade
```

2. Next, open machine /etc/fstab file and assure that your partitions file system has ACLs enabled as illustrated on the below screenshot.

Usually, common modern Linux file systems such as ext3, ext4, xfs or btrfs support and have ACLs enabled by default. If that’s not the case with your file system just open /etc/fstab file for editing and add `acl` string at the end of third column and reboot the machine in order to apply changes.

[
 ![Enable ACL's on Linux Filesystem](http://www.tecmint.com/wp-content/uploads/2016/11/Enable-ACL-on-Linux-Filesystem.png) 
][5]

Enable ACL’s on Linux Filesystem

3. Finally [setup your machine hostname][6] with a descriptive name, such as `adc1` used in this example, by editing /etc/hostname file or by issuing.

```
$ sudo hostnamectl set-hostname adc1
```

A reboot is necessary after you’ve changed your machine name in order to apply changes.

### Step 2: Install Required Packages for Samba4 AD DC

4. In order to transform your server into an Active Directory Domain Controller, install Samba and all the required packages on your machine by issuing the below command with root privileges in a console.

```
$ sudo apt-get install samba krb5-user krb5-config winbind libpam-winbind libnss-winbind
```
[
 ![Install Samba on Ubuntu](http://www.tecmint.com/wp-content/uploads/2016/11/Install-Samba-on-Ubuntu.png) 
][7]

Install Samba on Ubuntu

5. While the installation is running a series of questions will be asked by the installer in order to configure the domain controller.

On the first screen you will need to add a name for Kerberos default `REALM` in uppercase. Enter the name you will be using for your domain in uppercase and hit Enter to continue..

[
 ![Configuring Kerberos Authentication](http://www.tecmint.com/wp-content/uploads/2016/11/Configuring-Kerberos-Authentication.png) 
][8]

Configuring Kerberos Authentication

6. Next, enter the hostname of Kerberos server for your domain. Use the same name as for your domain, with lowercases this time and hit Enter to continue.

[
 ![Set Hostname Kerberos Server](http://www.tecmint.com/wp-content/uploads/2016/11/Set-Hostname-Kerberos-Server.png) 
][9]

Set Hostname Kerberos Server

7. Finally, specify the hostname for the administrative server of your Kerberos realm. Use the same as your domain and hit Enter to finish the installation.

[
 ![Set Hostname Administrative Server](http://www.tecmint.com/wp-content/uploads/2016/11/Set-Hostname-Administrative-Server.png) 
][10]

Set Hostname Administrative Server

### Step 3: Provision Samba AD DC for Your Domain

8. Before starting to configure Samba for your domain, first run the below commands in order to stop and disable all samba daemons.

```
$ sudo systemctl stop samba-ad-dc.service smbd.service nmbd.service winbind.service
$ sudo systemctl disable samba-ad-dc.service smbd.service nmbd.service winbind.service
```

9. Next, rename or remove samba original configuration. This step is absolutely required before provisioning Samba AD because at the provision time Samba will create a new configuration file from scratch and will throw up some errors in case it finds an old `smb.conf` file.

```
$ sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.initial
```

10. Now, start the domain provisioning interactively by issuing the below command with root privileges and accept the default options that Samba provides you.

Also, make sure you supply the IP address for a DNS forwarder at your premises (or external) and choose a strong password for Administrator account. If you choose a week password for Administrator account the domain provision will fail.

```
$ sudo samba-tool domain provision --use-rfc2307 –interactive
```
[
 ![Samba Domain Provisioning](http://www.tecmint.com/wp-content/uploads/2016/11/Samba-Domain-Provisioning.png) 
][11]

Samba Domain Provisioning

11. Finally, rename or remove Kerberos main configuration file from /etc directory and replace it using a symlink with Samba newly generated Kerberos file located in /var/lib/samba/private path by issuing the below commands:

```
$ sudo mv /etc/krb6.conf /etc/krb5.conf.initial
$ sudo ln –s /var/lib/samba/private/krb5.conf /etc/
```
[
 ![Create Kerberos Configuration](http://www.tecmint.com/wp-content/uploads/2016/11/Create-Kerberos-Configuration.png) 
][12]

Create Kerberos Configuration

12. Start and enable Samba Active Directory Domain Controller daemons.

```
$ sudo systemctl start samba-ad-dc.service
$ sudo systemctl status samba-ad-dc.service
$ sudo systemctl enable samba-ad-dc.service
```
[
 ![Enable Samba Active Directory Domain Controller](http://www.tecmint.com/wp-content/uploads/2016/11/Enable-Samba-AD-DC.png) 
][13]

Enable Samba Active Directory Domain Controller

13. Next, [use netstat command][14] in order to verify the list of all services required by an Active Directory to run properly.

```
$ sudo netstat –tulpn| egrep ‘smbd|samba’
```
[
 ![Verify Samba Active Directory](http://www.tecmint.com/wp-content/uploads/2016/11/Verify-Samba-Active-Directory.png) 
][15]

Verify Samba Active Directory

### Step 4: Final Samba Configurations

14. At this moment Samba should be fully operational at your premises. The highest domain level Sambais emulating should be Windows AD DC 2008 R2.

It can be verified with the help of samba-tool utility.

```
$ sudo samba-tool domain level show
```
[
 ![Verify Samba Domain Level](http://www.tecmint.com/wp-content/uploads/2016/11/Verify-Samba-Domain-Level.png) 
][16]

Verify Samba Domain Level

15. In order for DNS resolution to work locally, you need to open end edit network interface settings and point the DNS resolution by modifying dns-nameservers statement to the IP Address of your Domain Controller (use 127.0.0.1 for local DNS resolution) and dns-search statement to point to your realm.

```
$ sudo cat /etc/network/interfaces
$ sudo cat /etc/resolv.conf
```
[
 ![Configure DNS for Samba AD](http://www.tecmint.com/wp-content/uploads/2016/11/Configure-DNS-for-Samba-AD.png) 
][17]

Configure DNS for Samba AD

When finished, reboot your server and take a look at your resolver file to make sure it points back to the right DNS name servers.

16. Finally, test the DNS resolver by issuing queries and pings against some AD DC crucial records, as in the below excerpt. Replace the domain name accordingly.

```
$ ping –c3 tecmint.lan       #Domain Name
$ ping –c3 adc1.tecmint.lan  #FQDN
$ ping –c3 adc1              #Host
```
[
 ![Check Samba AD DNS Records](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba-AD-DNS-Records.png) 
][18]

Check Samba AD DNS Records

Run following few queries against Samba Active Directory Domain Controller..

```
$ host –t A tecmint.lan
$ host –t A adc1.tecmint.lan
$ host –t SRV _kerberos._udp.tecmint.lan  # UDP Kerberos SRV record
$ host -t SRV _ldap._tcp.tecmint.lan # TCP LDAP SRV record
```

17. Also, verify Kerberos authentication by requesting a ticket for the domain administrator account and list the cached ticket. Write the domain name portion with uppercase.

```
$ kinit administrator@TECMINT.LAN
$ klist
```
[
 ![Check Kerberos Authentication on Domain](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Kerberos-Authentication-on-Domain.png) 
][19]

Check Kerberos Authentication on Domain

That’s all! Now you have a fully operational AD Domain Controller installed in your network and you can start integrate Windows or Linux machines into Samba AD.

On the next series we’ll cover other Samba AD topics, such as how to manage you’re the domain controller from Samba command line, how to integrate Windows 10 into the domain name and manage Samba AD remotely using RSAT and other important topics.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-samba4-active-directory-ubuntu/

作者：[Matei Cezar ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:http://www.tecmint.com/installation-of-ubuntu-16-04-server-edition/
[2]:http://www.tecmint.com/ubuntu-14-04-server-installation-guide-and-lamp-setup/
[3]:http://www.tecmint.com/set-add-static-ip-address-in-linux/
[4]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/
[5]:http://www.tecmint.com/wp-content/uploads/2016/11/Enable-ACL-on-Linux-Filesystem.png
[6]:http://www.tecmint.com/set-hostname-permanently-in-linux/
[7]:http://www.tecmint.com/wp-content/uploads/2016/11/Install-Samba-on-Ubuntu.png
[8]:http://www.tecmint.com/wp-content/uploads/2016/11/Configuring-Kerberos-Authentication.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/11/Set-Hostname-Kerberos-Server.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/11/Set-Hostname-Administrative-Server.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/11/Samba-Domain-Provisioning.png
[12]:http://www.tecmint.com/wp-content/uploads/2016/11/Create-Kerberos-Configuration.png
[13]:http://www.tecmint.com/wp-content/uploads/2016/11/Enable-Samba-AD-DC.png
[14]:http://www.tecmint.com/20-netstat-commands-for-linux-network-management/
[15]:http://www.tecmint.com/wp-content/uploads/2016/11/Verify-Samba-Active-Directory.png
[16]:http://www.tecmint.com/wp-content/uploads/2016/11/Verify-Samba-Domain-Level.png
[17]:http://www.tecmint.com/wp-content/uploads/2016/11/Configure-DNS-for-Samba-AD.png
[18]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba-AD-DNS-Records.png
[19]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Kerberos-Authentication-on-Domain.png
