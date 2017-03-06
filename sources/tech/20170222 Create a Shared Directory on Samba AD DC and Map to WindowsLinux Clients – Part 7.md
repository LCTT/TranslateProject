#rusking translating
Create a Shared Directory on Samba AD DC and Map to Windows/Linux Clients – Part 7
============================================================


This tutorial will guide you on how to create a shared directory on Samba AD DC system, map this Shared Volume to Windows clients integrated into the domain via GPO and manage share permissions from Windows domain controller perspective.

It will also cover how to access and mount the file share from a Linux machine enrolled into domain using a Samba4 domain account.

#### Requirements:

1.  [Create an Active Directory Infrastructure with Samba4 on Ubuntu][1]

### Step 1: Create Samba File Share

1. The process of creating a share on Samba AD DC is a very simple task. First create a directory you want to share via SMB protocol and add the below permissions on the filesystem in order to allow a Windows AD DC admin acount to modify the share permissions accordingly to what permissions Windows clients should see.

Assuming that the new file share on the AD DC would be the `/nas` directory, run the below commands to assign the correct permissions.

```
# mkdir /nas
# chmod -R 775 /nas
# chown -R root:"domain users" /nas
# ls -alh | grep nas
```
[
 ![Create Samba Shared Directory](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][2]

Create Samba Shared Directory

2. After you’ve created the directory that will be exported as a share from Samba4 AD DC, you need to add the following statements to samba configuration file in order to make the share available via SMB protocol.

```
# nano /etc/samba/smb.conf
```

Go to the bottom of the file and add the following lines:

```
[nas]
path = /nas
read only = no
```
[
 ![Configure Samba Shared Directory](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][3]

Configure Samba Shared Directory

3. The last thing you need to do is to restart Samba AD DC daemon in order to apply the changes by issuing the below command:

```
# systemctl restart samba-ad-dc.service
```

### Step 2: Manage Samba Share Permissions

4. Since we’re accessing this shared volume from Windows, using domain accounts (users and groups) that are created on Samba AD DC (the share is not meant to be accessed by Linux system users).

The process of managing permissions can be done directly from Windows Explorer, in the same way permissions are managed for any folder in Windows Explorer.

First, log on to Windows machine with a Samba4 AD account with administrative privileges on the domain. In order to access the share from Windows and set the permissions, type the IP address or host name or FQDN of the Samba AD DC machine in Windows Explorer path field, preceded by two back slashes, and the share should be visible.

```
\\adc1
Or
\\192.168.1.254
Or
\\adc1.tecmint.lan
```
[
 ![Access Samba Share Directory from Windows](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][4]

Access Samba Share Directory from Windows

5. To modify permissions just right click on the share and choose Properties. Navigate to Security tab and proceed with altering domain users and group permissions accordingly. Use Advanced button in order to fine tune permissions.

[
 ![Configure Samba Share Directory Permissions](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][5]

Configure Samba Share Directory Permissions

Use the below screenshot as an excerpt on how to tune permissions for specific Samba AD DC authenticated accounts.

[
 ![Manage Samba Share Directory User Permissions](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][6]

Manage Samba Share Directory User Permissions

6. Other method you can use to manage the share permissions is from Computer Management -> Connect to another computer.

Navigate to Shares, right click on the share you want to modify permissions, choose Properties and move to Security tab. From here you can alter permissions in any way you want just as presented in the previous method using file share permissions.

[
 ![Connect to Samba Share Directory Machine](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][7]

Connect to Samba Share Directory Machine

[
 ![Manage Samba Share Directory Properties](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][8]

Manage Samba Share Directory Properties

[
 ![Assign Samba Share Directory Permissions to Users](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][9]

Assign Samba Share Directory Permissions to Users

### Step 3: Map the Samba File Share via GPO

7. To automatically mount the exported samba file share via domain Group Policy, first on a machine with [RSAT tools installed][10], open AD UC utility, right click on your domain name and, then, choose New -> Shared Folder.

[
 ![Map Samba Share Folder](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][11]

Map Samba Share Folder

8. Add a name for the shared volume and enter the network path where your share is located as illustrated on the below image. Hit OK when you’ve finished and the share should now be visible on the right plane.

[
 ![Set Samba Shared Folder Name Location](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][12]

Set Samba Shared Folder Name Location

9. Next, open Group Policy Management console, expand to your domain Default Domain Policy script and open the file for editing.

On the GPM Editor navigate to User Configuration -> Preferences -> Windows Settings and right click on Drive Maps and choose New -> Mapped Drive.

[
 ![Map Samba Share Folder in Windows](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][13]

Map Samba Share Folder in Windows

10. On the new window search and add the network location for the share by pressing the right button with three dots, check Reconnect checkbox, add a label for this share, choose the letter for this drive and hit OK button to save and apply configuration.

[
 ![Configure Network Location for Samba Share Directory](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][14]

Configure Network Location for Samba Share Directory

11. Finally, in order to force and apply GPO changes on your local machine without a system restart, open a Command Prompt and run the following command.

```
gpupdate /force
```
[
 ![Apply GPO Changes](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][15]

Apply GPO Changes

12. After the policy has been successfully applied on your machine, open Windows Explorer and the shared network volume should be visible and accessible, depending on what permissions you’ve granted for the share on previous steps.

The share will be visible for other clients on your network after they reboot or re-login onto their systems if the group policy will not forced from command line.

[
 ![Samba Shared Network Volume on Windows](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][16]

Samba Shared Network Volume on Windows

### Step 4: Access the Samba Shared Volume from Linux Clients

13. Linux users from machines that are enrolled into Samba AD DC can also access or mount the share locally by authenticating into the system with a Samba account.

First, they need to assure that the following samba clients and utilities are installed on their systems by issuing the below command.

```
$ sudo apt-get install smbclient cifs-utils
```

14. In order to list the exported shares your domain provides for a specific domain controller machine use the below command:

```
$ smbclient –L your_domain_controller –U%
or
$ smbclient –L \\adc1 –U%
```
[
 ![List Samba Share Directory in Linux](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][17]

List Samba Share Directory in Linux

15. To interactively connect to a samba share from command line with a domain account use the following command:

```
$ sudo smbclient //adc/share_name -U domain_user
```

On command line you can list the content of the share, download or upload files to the share or perform other tasks. Use ? to list all available smbclient commands.

[
 ![Connect Samba Share Directory in Linux](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][18]

Connect Samba Share Directory in Linux

16. To mount a samba share on a Linux machine use the below command.

```
$ sudo mount //adc/share_name /mnt -o username=domain_user
```
[
 ![Mount Samba Share Directory in Linux](http://www.tecmint.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 
][19]

Mount Samba Share Directory in Linux

Replace the host, share name, mount point and domain user accordingly. Use mount command piped with grep to filter only by cifs expression.

As some final conclusions, shares configured on a Samba4 AD DC will work only with Windows access control lists (ACL), not POSIX ACLs.

Configure Samba as a Domain member with file shares in order to achieve other capabilities for a network share. Also, on an Additional Domain Controller [configure Windbindd daemon][20] – Step Two – before you start exporting network shares.

--------------------------------------------------------------------------------

作者简介：

I'am a computer addicted guy, a fan of open source and linux based system software, have about 4 years experience with Linux distributions desktop, servers and bash scripting.

--------------------------------------------------------------------------------

via: 网址

作者：[Matei Cezar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/

[1]:http://www.tecmint.com/install-samba4-active-directory-ubuntu/
[2]:http://www.tecmint.com/wp-content/uploads/2017/02/Create-Samba-Shared-Directory.png
[3]:http://www.tecmint.com/wp-content/uploads/2017/02/Configure-Samba-Shared-Directory.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/02/Access-Samba-Share-Directory-from-Windows.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/02/Configure-Samba-Share-Directory-Permissions.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Manage-Samba-Share-Directory-User-Permissions.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Connect-to-Samba-Share-Directory-Machine.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/02/Manage-Samba-Share-Directory-Properties.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/02/Assign-Samba-Share-Directory-Permissions-to-Users.png
[10]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/
[11]:http://www.tecmint.com/wp-content/uploads/2017/02/Map-Samba-Share-Folder.png
[12]:http://www.tecmint.com/wp-content/uploads/2017/02/Set-Samba-Shared-Folder-Name-Location.png
[13]:http://www.tecmint.com/wp-content/uploads/2017/02/Map-Samba-Share-Folder-in-Windows.png
[14]:http://www.tecmint.com/wp-content/uploads/2017/02/Configure-Network-Location-for-Samba-Share-Directory.png
[15]:http://www.tecmint.com/wp-content/uploads/2017/02/Apply-GPO-Changes.png
[16]:http://www.tecmint.com/wp-content/uploads/2017/02/Samba-Shared-Network-Volume-on-Windows.png
[17]:http://www.tecmint.com/wp-content/uploads/2017/02/List-Samba-Share-Directory-in-Linux.png
[18]:http://www.tecmint.com/wp-content/uploads/2017/02/Connect-Samba-Share-Directory-in-Linux.png
[19]:http://www.tecmint.com/wp-content/uploads/2017/02/Mount-Samba-Share-Directory-in-Linux.png
[20]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/
[21]:http://www.tecmint.com/author/cezarmatei/
[22]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[23]:http://www.tecmint.com/free-linux-shell-scripting-books/
