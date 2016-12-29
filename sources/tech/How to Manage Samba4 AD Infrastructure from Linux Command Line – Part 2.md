How to Manage Samba4 AD Infrastructure from Linux Command Line – Part 2
============================================================

This tutorial will cover [some basic daily commands][4] you need to use in order to manage Samba4 AD Domain Controller infrastructure, such as adding, removing, disabling or listing users and groups.

We’ll also take a look on how to manage domain security policy and how to bind AD users to local PAM authentication in order for AD users to be able to perform local logins on Linux Domain Controller.

#### Requirements

1.  [Create an AD Infrastructure with Samba4 on Ubuntu 16.04 – Part 1][1]
2.  [Manage Samba4 Active Directory Infrastructure from Windows10 via RSAT – Part 3][2]
3.  [Manage Samba4 AD Domain Controller DNS and Group Policy from Windows – Part 4][3]

### Step 1: Manage Samba AD DC from Command Line

1. Samba AD DC can be managed through samba-tool command line utility which offers a great interface for administrating your domain.

With the help of samba-tool interface you can directly manage domain users and groups, domain Group Policy, domain sites, DNS services, domain replication and other critical domain functions.

To review the entire functionality of samba-tool just type the command with root privileges without any option or parameter.

```
# samba-tool -h
```
[
 ![samba-tool - Manage Samba Administration Tool](http://www.tecmint.com/wp-content/uploads/2016/11/Samba-Administration-Tool.png) 
][5]

samba-tool – Manage Samba Administration Tool

2. Now, let’s start using samba-tool utility to administer Samba4 Active Directory and manage our users.

In order to create a user on AD use the following command:

```
# samba-tool user add your_domain_user
```

To add a user with several important fields required by AD, use the following syntax:

```
--------- review all options --------- 
# samba-tool user add -h  
# samba-tool user add your_domain_user --given-name=your_name --surname=your_username --mail-address=your_domain_user@tecmint.lan --login-shell=/bin/bash
```
[
 ![Create User on Samba AD](http://www.tecmint.com/wp-content/uploads/2016/11/Create-User-on-Samba-AD.png) 
][6]

Create User on Samba AD

3. A listing of all samba AD domain users can be obtained by issuing the following command:

```
# samba-tool user list
```
[
 ![List Samba AD Users](http://www.tecmint.com/wp-content/uploads/2016/11/List-Samba-AD-Users.png) 
][7]

List Samba AD Users

4. To delete a samba AD domain user use the below syntax:

```
# samba-tool user delete your_domain_user
```

5. Reset a samba domain user password by executing the below command:

```
# samba-tool user setpassword your_domain_user
```

6. In order to disable or enable an samba AD User account use the below command:

```
# samba-tool user disable your_domain_user
# samba-tool user enable your_domain_user
```

7. Likewise, samba groups can be managed with the following command syntax:

```
--------- review all options --------- 
# samba-tool group add –h  
# samba-tool group add your_domain_group
```

8. Delete a samba domain group by issuing the below command:

```
# samba-tool group delete your_domain_group
```

9. To display all samba domain groups run the following command:

```
# samba-tool group list
```

10. To list all the samba domain members in a specific group use the command:

```
# samba-tool group listmembers "your_domain group"
```
[
 ![List Samba Domain Members of Group](http://www.tecmint.com/wp-content/uploads/2016/11/List-Samba-Domain-Members-of-Group.png) 
][8]

List Samba Domain Members of Group

11. Adding/Removing a member from a samba domain group can be done by issuing one of the following commands:

```
# samba-tool group addmembers your_domain_group your_domain_user
# samba-tool group remove members your_domain_group your_domain_user
```

12. As mentioned earlier, samba-tool command line interface can also be used to manage your samba domain policy and security.

To review your samba domain password settings use the below command:

```
# samba-tool domain passwordsettings show
```
[
 ![Check Samba Domain Password](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba-Domain-Password.png) 
][9]

Check Samba Domain Password

13. In order to modify samba domain password policy, such as the password complexity level, password ageing, length, how many old password to remember and other security features required for a Domain Controller use the below screenshot as a guide.

```
---------- List all command options ---------- 
# samba-tool domain passwordsettings -h 
```
[
 ![Manage Samba Domain Password Settings](http://www.tecmint.com/wp-content/uploads/2016/11/Manage-Samba-Domain-Password-Settings.png) 
][10]

Manage Samba Domain Password Settings

Never use the password policy rules as illustrated above on a production environment. The above settings are used just for demonstration purposes.

### Step 2: Samba Local Authentication Using Active Directory Accounts

14. By default, AD users cannot perform local logins on the Linux system outside Samba AD DCenvironment.

In order to login on the system with an Active Directory account you need to make the following changes on your Linux system environment and modify Samba4 AD DC.

First, open samba main configuration file and add the below lines, if missing, as illustrated on the below screenshot.

```
$ sudo nano /etc/samba/smb.conf
```

Make sure the following statements appear on the configuration file:

```
winbind enum users = yes
winbind enum groups = yes
```
[
 ![Samba Authentication Using Active Directory User Accounts](http://www.tecmint.com/wp-content/uploads/2016/11/Samba-Authentication-Using-Active-Directory-Accounts.png) 
][11]

Samba Authentication Using Active Directory User Accounts

15. After you’ve made the changes, use testparm utility to make sure no errors are found on samba configuration file and restart samba daemons by issuing the below command.

```
$ testparm
$ sudo systemctl restart samba-ad-dc.service
```
[
 ![Check Samba Configuration for Errors](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba-Configuration-for-Errors.png) 
][12]

Check Samba Configuration for Errors

16. Next, we need to modify local PAM configuration files in order for Samba4 Active Directory accounts to be able to authenticate and open a session on the local system and create a home directory for users at first login.

Use the pam-auth-update command to open PAM configuration prompt and make sure you enable all PAM profiles using `[space]` key as illustrated on the below screenshot.

When finished hit `[Tab]` key to move to Ok and apply changes.

```
$ sudo pam-auth-update
```
[
 ![Configure PAM for Samba4 AD](http://www.tecmint.com/wp-content/uploads/2016/11/PAM-Configuration-for-Samba4-AD.png) 
][13]

Configure PAM for Samba4 AD

[
 ![Enable PAM Authentication Module for Samba4 AD Users](http://www.tecmint.com/wp-content/uploads/2016/11/Enable-PAM-Authentication-Module-for-Samba4-AD.png) 
][14]

Enable PAM Authentication Module for Samba4 AD Users

17. Now, open /etc/nsswitch.conf file with a text editor and add winbind statement at the end of the password and group lines as illustrated on the below screenshot.

```
$ sudo vi /etc/nsswitch.conf
```
[
 ![Add Windbind Service Switch for Samba](http://www.tecmint.com/wp-content/uploads/2016/11/Add-Windbind-Service-Switch-for-Samba.png) 
][15]

Add Windbind Service Switch for Samba

18. Finally, edit /etc/pam.d/common-password file, search for the below line as illustrated on the below screenshot and remove the use_authtok statement.

This setting assures that Active Directory users can change their password from command line while authenticated in Linux. With this setting on, AD users authenticated locally on Linux cannot change their password from console.

```
password       [success=1 default=ignore]      pam_winbind.so try_first_pass
```
[
 ![Allow Samba AD Users to Change Passwords](http://www.tecmint.com/wp-content/uploads/2016/11/Allow-Samba-AD-Users-to-Change-Password.png) 
][16]

Allow Samba AD Users to Change Passwords

Remove use_authtok option each time PAM updates are installed and applied to PAM modules or each time you execute pam-auth-update command.

19. Samba4 binaries comes with a winbindd daemon built-in and enabled by default.

For this reason you’re no longer required to separately enable and run winbind daemon provided by winbind package from official Ubuntu repositories.

In case the old and deprecated winbind service is started on the system make sure you disable it and stop the service by issuing the below commands:

```
$ sudo systemctl disable winbind.service
$ sudo systemctl stop winbind.service
```

Although, we no longer need to run old winbind daemon, we still need to install Winbind package from repositories in order to install and use wbinfo tool.

Wbinfo utility can be used to query Active Directory users and groups from winbindd daemon point of view.

The following commands illustrates how to query AD users and groups using wbinfo.

```
$ wbinfo -g
$ wbinfo -u
$ wbinfo -i your_domain_user
```
[
 ![Check Samba4 AD Information ](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Information-of-Samba4-AD.png) 
][17]

Check Samba4 AD Information

[
 ![Check Samba4 AD User Info](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba4-AD-User-Info.png) 
][18]

Check Samba4 AD User Info

20. Apart from wbinfo utility you can also use getent command line utility to query Active Directory database from Name Service Switch libraries which are represented in /etc/nsswitch.conf file.

Pipe getent command through a grep filter in order to narrow the results regarding just your AD realm user or group database.

```
# getent passwd | grep TECMINT
# getent group | grep TECMINT
```
[
 ![Get Samba4 AD Details](http://www.tecmint.com/wp-content/uploads/2016/11/Get-Samba4-AD-Details.png) 
][19]

Get Samba4 AD Details

### Step 3: Login in Linux with an Active Directory User

21. In order to authenticate on the system with a Samba4 AD user, just use the AD username parameter after `su -` command.

At the first login a message will be displayed on the console which notifies you that a home directory has been created on `/home/$DOMAIN/` system path with the mane of your AD username.

Use id command to display extra information about the authenticated user.

```
# su - your_ad_user
$ id
$ exit
```
[
 ![Check Samba4 AD User Authentication on Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba4-AD-User-Authentication-on-Linux.png) 
][20]

Check Samba4 AD User Authentication on Linux

22. To change the password for an authenticated AD user type passwd command in console after you have successfully logged into the system.

```
$ su - your_ad_user
$ passwd
```
[
 ![Change Samba4 AD User Password](http://www.tecmint.com/wp-content/uploads/2016/11/Change-Samba4-AD-User-Password.png) 
][21]

Change Samba4 AD User Password

23. By default, Active Directory users are not granted with root privileges in order to perform administrative tasks on Linux.

To grant root powers to an AD user you must add the username to the local sudo group by issuing the below command.

Make sure you enclose the realm, slash and AD username with single ASCII quotes.

```
# usermod -aG sudo 'DOMAIN\your_domain_user'
```

To test if AD user has root privileges on the local system, login and run a command, such as apt-get update, with sudo permissions.

```
# su - tecmint_user
$ sudo apt-get update
```
[
 ![Grant sudo Permission to Samba4 AD User](http://www.tecmint.com/wp-content/uploads/2016/11/Grant-sudo-Permission-to-Samba4-AD-User.png) 
][22]

Grant sudo Permission to Samba4 AD User

24. In case you want to add root privileges for all accounts of an Active Directory group, edit /etc/sudoers file using visudo command and add the below line after root privileges line, as illustrated on the below screenshot:

```
%DOMAIN\\your_domain\  group ALL=(ALL:ALL) ALL
```

Pay attention to sudoers syntax so you don’t break things out.

Sudoers file doesn’t handles very well the use of ASCII quotation marks, so make sure you use `%` to denote that you’re referring to a group and use a backslash to escape the first slash after the domain name and another backslash to escape spaces if your group name contains spaces (most of AD built-in groups contain spaces by default). Also, write the realm with uppercases.

[
 ![Give Sudo Access to All Samba4 AD Users](http://www.tecmint.com/wp-content/uploads/2016/11/Give-Sudo-Access-to-All-Samba4-AD-Users.png) 
][23]

Give Sudo Access to All Samba4 AD Users

That’s all for now! Managing Samba4 AD infrastructure can be also achieved with several tools from Windows environment, such as ADUC, DNS Manager, GPM or other, which can be obtained by installing RSAT package from Microsoft download page.

To administer Samba4 AD DC through RSAT utilities, it’s absolutely necessary to join the Windows system into Samba4 Active Directory. This will be the subject of our next tutorial, till then stay tuned to TecMint.

------

作者简介：I'am a computer addicted guy, a fan of open source and linux based system software, have about 4 years experience with Linux distributions desktop, servers and bash scripting.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/

作者：[Matei Cezar ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:http://www.tecmint.com/install-samba4-active-directory-ubuntu/
[2]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/
[3]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/
[4]:http://www.tecmint.com/60-commands-of-linux-a-guide-from-newbies-to-system-administrator/
[5]:http://www.tecmint.com/wp-content/uploads/2016/11/Samba-Administration-Tool.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/11/Create-User-on-Samba-AD.png
[7]:http://www.tecmint.com/wp-content/uploads/2016/11/List-Samba-AD-Users.png
[8]:http://www.tecmint.com/wp-content/uploads/2016/11/List-Samba-Domain-Members-of-Group.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba-Domain-Password.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/11/Manage-Samba-Domain-Password-Settings.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/11/Samba-Authentication-Using-Active-Directory-Accounts.png
[12]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba-Configuration-for-Errors.png
[13]:http://www.tecmint.com/wp-content/uploads/2016/11/PAM-Configuration-for-Samba4-AD.png
[14]:http://www.tecmint.com/wp-content/uploads/2016/11/Enable-PAM-Authentication-Module-for-Samba4-AD.png
[15]:http://www.tecmint.com/wp-content/uploads/2016/11/Add-Windbind-Service-Switch-for-Samba.png
[16]:http://www.tecmint.com/wp-content/uploads/2016/11/Allow-Samba-AD-Users-to-Change-Password.png
[17]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Information-of-Samba4-AD.png
[18]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba4-AD-User-Info.png
[19]:http://www.tecmint.com/wp-content/uploads/2016/11/Get-Samba4-AD-Details.png
[20]:http://www.tecmint.com/wp-content/uploads/2016/11/Check-Samba4-AD-User-Authentication-on-Linux.png
[21]:http://www.tecmint.com/wp-content/uploads/2016/11/Change-Samba4-AD-User-Password.png
[22]:http://www.tecmint.com/wp-content/uploads/2016/11/Grant-sudo-Permission-to-Samba4-AD-User.png
[23]:http://www.tecmint.com/wp-content/uploads/2016/11/Give-Sudo-Access-to-All-Samba4-AD-Users.png
[24]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/#
[25]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/#
[26]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/#
[27]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/#
[28]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/#comments
