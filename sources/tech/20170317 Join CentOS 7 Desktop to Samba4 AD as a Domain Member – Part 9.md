#rusking translating 
Join CentOS 7 Desktop to Samba4 AD as a Domain Member – Part 9
============================================================

by [Matei Cezar][23] | Published: March 17, 2017 | Last Updated: March 17, 2017

 Download Your Free eBooks NOW - [10 Free Linux eBooks for Administrators][24] | [4 Free Shell Scripting eBooks][25]

This guide will describe how you can integrate CentOS 7 Desktop to Samba4 Active Directory Domain Controller with Authconfig-gtk in order to authenticate users across your network infrastructure from a single centralized account database held by Samba.

#### Requirements

1.  [Create an Active Directory Infrastructure with Samba4 on Ubuntu][1]
2.  [CentOS 7.3 Installation Guide][2]

### Step 1: Configure CentOS Network for Samba4 AD DC

1. Before starting to join CentOS 7 Desktop to a Samba4 domain you need to assure that the network is properly setup to query domain via DNS service.

Open Network Settings and turn off the Wired network interface if enabled. Hit on the lower Settings button as illustrated in the below screenshots and manually edit your network settings, especially the DNS IPs that points to your Samba4 AD DC.

When you finish, Apply the configurations and turn on your Network Wired Card.

[
 ![Network Settings](http://www.tecmint.com/wp-content/uploads/2017/03/Network-Settings.jpg) 
][3]

Network Settings

[
 ![Configure Network](http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Network.jpg) 
][4]

Configure Network

2. Next, open your network interface configuration file and add a line at the end of file with the name of your domain. This line assures that the domain counterpart is automatically appended by DNS resolution (FQDN) when you use only a short name for a domain DNS record.

```
$ sudo vi /etc/sysconfig/network-scripts/ifcfg-eno16777736
```

Add the following line:

```
SEARCH="your_domain_name"
```
[
 ![Network Interface Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Network-Interface-Configuration.jpg) 
][5]

Network Interface Configuration

3. Finally, restart the network services to reflect changes, verify if the resolver configuration file is correctly configured and issue a series of ping commands against your DCs short names and against your domain name in order to verify if DNS resolution is working.

```
$ sudo systemctl restart network
$ cat /etc/resolv.conf
$ ping -c1 adc1
$ ping -c1 adc2
$ ping tecmint.lan
```
[
 ![Verify Network Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Verify-Network-Configuration.jpg) 
][6]

Verify Network Configuration

4. Also, configure your machine hostname and reboot the machine to properly apply the settings by issuing the following commands:

```
$ sudo hostnamectl set-hostname your_hostname
$ sudo init 6
```

Verify if hostname was correctly applied with the below commands:

```
$ cat /etc/hostname
$ hostname
```

5. The last setting will ensure that your system time is in sync with Samba4 AD DC by issuing the below commands:

```
$ sudo yum install ntpdate
$ sudo ntpdate -ud domain.tld
```

### Step 2: Install Required Software to Join Samba4 AD DC

6. In order to integrate CentOS 7 to an Active Directory domain install the following packages from command line:

```
$ sudo yum install samba samba samba-winbind krb5-workstation
```

7. Finally, install the graphical interface software used for domain integration provided by CentOS repos: Authconfig-gtk.

```
$ sudo yum install authconfig-gtk
```

### Step 3: Join CentOS 7 Desktop to Samba4 AD DC

8. The process of joining CentOS to a domain controller is very straightforward. From command line open Authconfig-gtk program with root privileges and make the following changes as described below:

```
$ sudo authconfig-gtk
```

On Identity & Authentication tab.

*   User Account Database = select Winbind
*   Winbind Domain = YOUR_DOMAIN
*   Security Model = ADS
*   Winbind ADS Realm = YOUR_DOMAIN.TLD
*   Domain Controllers = domain machines FQDN
*   Template Shell = /bin/bash
*   Allow offline login = checked

[
 ![Authentication Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Authentication-Configuration.jpg) 
][7]

Authentication Configuration

On Advanced Options tab.

*   Local Authentication Options = check Enable fingerprint reader support
*   Other Authentication Options = check Create home directories on the first login

[
 ![Authentication Advance Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Authentication-Advance-Configuration.jpg) 
][8]

Authentication Advance Configuration

9. After you’ve added all required values, return to Identity & Authentication tab and hit on Join Domain button and the Save button from alert window to save settings.

[
 ![Identity and Authentication](http://www.tecmint.com/wp-content/uploads/2017/03/Identity-and-Authentication.jpg) 
][9]

Identity and Authentication

[
 ![Save Authentication Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Save-Authentication-Configuration.jpg) 
][10]

Save Authentication Configuration

10. After the configuration has been saved you will be asked to provide a domain administrator account in order to join the domain. Supply the credentials for a domain administrator user and hit OK button to finally join the domain.

[
 ![Joining Winbind Domain](http://www.tecmint.com/wp-content/uploads/2017/03/Joining-Winbind-Domain.jpg) 
][11]

Joining Winbind Domain

11. After your machine has been integrated into the realm, hit on Apply button to reflect changes, close all windows and reboot the machine.

[
 ![Apply Authentication Configuration](http://www.tecmint.com/wp-content/uploads/2017/03/Apply-Authentication-Configuration.jpg) 
][12]

Apply Authentication Configuration

12. In order to verify if the system has been joined to Samba4 AD DC open AD Users and Computers from a Windows machine with [RSAT tools installed][13] and navigate to your domain Computers container.

The name of your CentOS machine should be listed on the right plane.

[
 ![Active Directory Users and Computers](http://www.tecmint.com/wp-content/uploads/2017/03/Active-Directory-Users-and-Computers.jpg) 
][14]

Active Directory Users and Computers

### Step 4: Login to CentOS Desktop with a Samba4 AD DC Account

13. In order to login to CentOS Desktop hit on Not listed? link and add the username of a domain account preceded by the domain counterpart as illustrated below.

```
Domain\domain_account
or
Domain_user@domain.tld
```
[
 ![Not listed Users](http://www.tecmint.com/wp-content/uploads/2017/03/Not-listed-Users.jpg) 
][15]

Not listed Users

[
 ![Enter Domain Username](http://www.tecmint.com/wp-content/uploads/2017/03/Enter-Domain-Username.jpg) 
][16]

Enter Domain Username

14. To authenticate with a domain account from command line in CentOS use one of the following syntaxes:

```
$ su - domain\domain_user
$ su - domain_user@domain.tld
```
[
 ![Authenticate Domain Username](http://www.tecmint.com/wp-content/uploads/2017/03/Authenticate-Domain-User.jpg) 
][17]

Authenticate Domain Username

[
 ![Authenticate Domain User Email](http://www.tecmint.com/wp-content/uploads/2017/03/Authenticate-Domain-User-Email.jpg) 
][18]

Authenticate Domain User Email

15. To add root privileges for a domain user or group, edit sudoers file using visudo command with root powers and add the following lines as illustrated on the below excerpt:

```
YOUR_DOMAIN\\domain_username       		 ALL=(ALL:ALL) ALL  	#For domain users
%YOUR_DOMAIN\\your_domain\  group      		 ALL=(ALL:ALL) ALL	#For domain groups
```
[
 ![Assign Permission to User and Group](http://www.tecmint.com/wp-content/uploads/2017/03/Assign-Permission-to-User-and-Group.jpg) 
][19]

Assign Permission to User and Group

16. To display a summary about the domain controller use the following command:

```
$ sudo net ads info
```
[
 ![Check Domain Controller Info](http://www.tecmint.com/wp-content/uploads/2017/03/Check-Domain-Controller-Info.jpg) 
][20]

Check Domain Controller Info

17. In order to verify if the trust machine account created when CentOS was added to the Samba4 AD DC is functional and list domain accounts from command line install Winbind client by issuing the below command:

```
$ sudo yum install samba-winbind-clients
```

Then issue a series of checks against Samba4 AD DC by executing the following commands:

```
$ wbinfo -p #Ping domain
$ wbinfo -t #Check trust relationship
$ wbinfo -u #List domain users
$ wbinfo -g #List domain groups
$ wbinfo -n domain_account #Get the SID of a domain account
```
[
 ![Get Samba4 AD DC Details](http://www.tecmint.com/wp-content/uploads/2017/03/Get-Samba4-AD-DC-Details.jpg) 
][21]

Get Samba4 AD DC Details

18. In case you want to leave the domain issue the following command against your domain name by using an domain account with administrator privileges:

```
$ sudo net ads leave your_domain -U domain_admin_username
```
[
 ![Leave Domain from Samba4 AD](http://www.tecmint.com/wp-content/uploads/2017/03/Leave-Domain-from-Samba4-AD.jpg) 
][22]

Leave Domain from Samba4 AD

That’s all! Although this procedure is focused on joining CentOS 7 to a Samba4 AD DC, the same steps described in this documentation are also valid for integrating a CentOS 7 Desktop machine to a Microsoft Windows Server 2008 or 2012 domain.

--------------------------------------------------------------------------------

作者简介：

I'am a computer addicted guy, a fan of open source and linux based system software, have about 4 years experience with Linux distributions desktop, servers and bash scripting.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/join-centos-7-to-samba4-active-directory/

作者：[Matei Cezar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/

[1]:http://www.tecmint.com/install-samba4-active-directory-ubuntu/
[2]:http://www.tecmint.com/centos-7-3-installation-guide/
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Network-Settings.jpg
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Configure-Network.jpg
[5]:http://www.tecmint.com/wp-content/uploads/2017/03/Network-Interface-Configuration.jpg
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Verify-Network-Configuration.jpg
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/Authentication-Configuration.jpg
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/Authentication-Advance-Configuration.jpg
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Identity-and-Authentication.jpg
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/Save-Authentication-Configuration.jpg
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/Joining-Winbind-Domain.jpg
[12]:http://www.tecmint.com/wp-content/uploads/2017/03/Apply-Authentication-Configuration.jpg
[13]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/
[14]:http://www.tecmint.com/wp-content/uploads/2017/03/Active-Directory-Users-and-Computers.jpg
[15]:http://www.tecmint.com/wp-content/uploads/2017/03/Not-listed-Users.jpg
[16]:http://www.tecmint.com/wp-content/uploads/2017/03/Enter-Domain-Username.jpg
[17]:http://www.tecmint.com/wp-content/uploads/2017/03/Authenticate-Domain-User.jpg
[18]:http://www.tecmint.com/wp-content/uploads/2017/03/Authenticate-Domain-User-Email.jpg
[19]:http://www.tecmint.com/wp-content/uploads/2017/03/Assign-Permission-to-User-and-Group.jpg
[20]:http://www.tecmint.com/wp-content/uploads/2017/03/Check-Domain-Controller-Info.jpg
[21]:http://www.tecmint.com/wp-content/uploads/2017/03/Get-Samba4-AD-DC-Details.jpg
[22]:http://www.tecmint.com/wp-content/uploads/2017/03/Leave-Domain-from-Samba4-AD.jpg
[23]:http://www.tecmint.com/author/cezarmatei/
[24]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[25]:http://www.tecmint.com/free-linux-shell-scripting-books/
