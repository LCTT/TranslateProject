[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fedora 32: Simple Local File-Sharing with Samba)
[#]: via: (https://fedoramagazine.org/fedora-32-simple-local-file-sharing-with-samba/)
[#]: author: (da2ce7 https://fedoramagazine.org/author/da2ce7/)

Fedora 32: Simple Local File-Sharing with Samba
======

![][1]

Sharing files with Fedora 32 using Samba is cross-platform, convenient, reliable, and performant.

### What is ‘Samba’?

[Samba][2] is a high-quality implementation of [Server Message Block protocol (SMB)][3]. Originally developed by Microsoft for connecting windows computers together via local-area-networks, it is now extensively used for internal network communications.

Apple used to maintain it’s own independent file sharing called “[Apple Filing Protocol (**AFP**)][4]“, however in [recent times][5], it also has also switched to SMB.

**In this guide we provide the minimal instructions to enable:**

  * Public Folder Sharing (Both Read Only and Read Write)
  * User Home Folder Access



```
Note about this guide: The convention '~]$' for a local user command prompt, and '~]#' for a super user prompt will be used.
```

### Public Sharing Folder

Having a shared public place where authenticated users on an internal network can access files, or even modify and change files if they are given permission, can be very convenient. This part of the guide walks through the process of setting up a shared folder, ready for sharing with Samba.

```
Please Note: This guide assumes the public sharing folder is on a Modern Linux Filesystem; other filesystems such as NTFS or FAT32 will not work. Samba uses POSIX Access Control Lists (ACLs).

For those who wish to learn more about Access Control Lists, please consider reading the documentation: "Red Hat Enterprise Linux 7: System Administrator's Guide: Chapter 5. Access Control Lists", as it likewise applies to Fedora 32.

In General, this is only an issue for anyone who wishes to share a drive or filesystem that was created outside of the normal Fedora Installation process. (such as a external hard drive).

It is possible for Samba to share filesystem paths that do not support POSIX ACLs, however this is out of the scope of this guide.
```

#### Create Folder

For this guide the _**/srv/public/**_ folder for sharing will be used.

> The _/srv/_ directory contains site-specific data served by a Red Hat Enterprise Linux system. This directory gives users the location of data files for a particular service, such as FTP, WWW, or CVS. Data that only pertains to a specific user should go in the _/home/_ directory.
>
> [Red Hat Enterprise Linux 7, Storage Administration Guide: Chapter 2. File System Structure and Maintenance: 2.1.1.8. The /srv/ Directory][6]

```
Make the Folder (will provide an error if the folder already exists).
~]# mkdir --verbose /srv/public

Verify folder exists:
~]$ ls --directory /srv/public

Expected Output:
/srv/public
```

#### Set Filesystem Security Context

To have _read and write_ access to the public folder the _public_content_rw_t_ security context will be used for this guide. Those wanting _read only_ may use: _public_content_t_.

> Label files and directories that have been created with the _public_content_rw_t_ type to share them with read and write permissions through vsftpd. Other services, such as Apache HTTP Server, Samba, and NFS, also have access to files labeled with this type. Remember that booleans for each service must be enabled before they can write to files labeled with this type.
>
> [Red Hat Enterprise Linux 7, SELinux User’s and Administrator’s Guide: Chapter 16. File Transfer Protocol: 16.1. Types: public_content_rw_t][7]

Add _/srv/public_ as _“public_content_rw_t”_ in the system’s local filesystem security context customization registry:

```
Add new security filesystem security context:
~]# semanage fcontext --add --type public_content_rw_t "/srv/public(/.*)?"

Verifiy new security filesystem security context:
~]# semanage fcontext --locallist --list

Expected Output: (should include)
/srv/public(/.*)? all files system_u:object_r:public_content_rw_t:s0
```

Now that the folder has been added to the local system’s filesystem security context registry; The **restorecon** command can be used to ‘restore’ the context to the folder:

```
Restore security context to the /srv/public folder:
$~]# restorecon -Rv /srv/public

Verify security context was correctly applied:
~]$ ls --directory --context /srv/public/

Expected Output:
unconfined_u:object_r:public_content_rw_t:s0 /srv/public/
```

#### User Permissions

##### Creating the Sharing Groups

To allow a user to either have _read only_, or _read and write_ accesses to the public share folder create two new groups that govern these privileges: _public_readonly_ and _public_readwrite_.

User accounts can be granted access to _read only_, or _read and write_ by adding their account to the respective group (and allow login via Samba creating a smb password). This process is demonstrated in the section: “Test Public Sharing (localhost)”.

```
Create the public_readonly and public_readwrite groups:
~]# groupadd public_readonly
~]# groupadd public_readwrite

Verify successful creation of groups:
~]$ getent group public_readonly public_readwrite

Expected Output: (Note: x:1...: number will probability differ on your System)
public_readonly:x:1009:
public_readwrite:x:1010:
```

##### Set Permissions

Now set the appropriate user permissions to the public shared folder:

```
Set User and Group Permissions for Folder:
~]# chmod --verbose 2700 /srv/public
~]# setfacl -m group:public_readonly:r-x /srv/public
~]# setfacl -m default:group:public_readonly:r-x /srv/public
~]# setfacl -m group:public_readwrite:rwx /srv/public
~]# setfacl -m default:group:public_readwrite:rwx /srv/public

Verify user permissions have been correctly applied:
~]$ getfacl --absolute-names /srv/public

Expected Output:
file: /srv/public
owner: root
group: root
flags: -s-
user::rwx
group::---
group:public_readonly:r-x
group:public_readwrite:rwx
mask::rwx
other::---
default:user::rwx
default:group::---
default:group:public_readonly:r-x
default:group:public_readwrite:rwx
default:mask::rwx
default:other::---
```

### Samba

#### Installation

```
~]# dnf install samba
```

#### Hostname (systemwide)

Samba will use the name of the computer when sharing files; it is good to set a hostname so that the computer can be found easily on the local network.

```
View Your Current Hostname:
~]$ hostnamectl status
```

If you wish to change your hostname to something more descriptive, use the command:

```
Modify your system's hostname (example):
~]# hostnamectl set-hostname "simple-samba-server"
```

```
For a more complete overview of the hostnamectl command, please read the previous Fedora Magazine Article: "How to set the hostname on Fedora".
```

#### Firewall

Configuring your firewall is a complex and involved task. This guide will just have the most minimal manipulation of the firewall to enable Samba to pass through.

```
For those who are interested in learning more about configuring firewalls; please consider reading the documentation: "Red Hat Enterprise Linux 8: Securing networks: Chapter 5. Using and configuring firewall", as it generally applies to Fedora 32 as well.
```

```
Allow Samba access through the firewall:
~]# firewall-cmd --add-service=samba --permanent
~]# firewall-cmd --reload

Verify Samba is included in your active firewall:
~]$ firewall-cmd --list-services

Output (should include):
samba
```

#### Configuration

##### Remove Default Configuration

The stock configuration that is included with Fedora 32 is not required for this simple guide. In particular it includes support for sharing printers with Samba.

For this guide make a backup of the default configuration and create a new configuration file from scratch.

```
Create a backup copy of the existing Samba Configuration:
~]# cp --verbose --no-clobber /etc/samba/smb.conf /etc/samba/smb.conf.fedora0

Empty the configuration file:
~]# > /etc/samba/smb.conf
```

##### Samba Configuration

```
Please Note: This configuration file does not contain any global definitions; the defaults provided by Samba are good for purposes of this guide.
```

```
Edit the Samba Configuration File with Vim:
~]# vim /etc/samba/smb.conf
```

Add the following to _/etc/samba/smb.conf_ file:

```
# smb.conf - Samba Configuration File

# The name of the share is in square brackets [],
#   this will be shared as //hostname/sharename

# There are a three exceptions:
#   the [global] section;
#   the [homes] section, that is dynamically set to the username;
#   the [printers] section, same as [homes], but for printers.

# path: the physical filesystem path (or device)
# comment: a label on the share, seen on the network.
# read only: disable writing, defaults to true.

# For a full list of configuration options,
#   please read the manual: "man smb.conf".

[global]

[public]
path = /srv/public
comment = Public Folder
read only = No
```

#### Write Permission

By default Samba is not granted permission to modify any file of the system. Modify system’s security configuration to allow Samba to modify any filesystem path that has the security context of _public_content_rw_t_.

For convenience, Fedora has a built-in SELinux Boolean for this purpose called: _smbd_anon_write_, setting this to _true_ will enable Samba to write in any filesystem path that has been set to the security context of _public_content_rw_t_.

For those who are wishing Samba only have a read-only access to their public sharing folder, they may choose skip this step and not set this boolean.

```
There are many more SELinux boolean that are available for Samba. For those who are interested, please read the documentation: "Red Hat Enterprise Linux 7: SELinux User's and Administrator's Guide: 15.3. Samba Booleans", it also apply to Fedora 32 without any adaptation.
```

```
Set SELinux Boolean allowing Samba to write to filesystem paths set with the security context public_content_rw_t:
~]# setsebool -P smbd_anon_write=1

Verify bool has been correctly set:
$ getsebool smbd_anon_write

Expected Output:
smbd_anon_write --> on
```

### Samba Services

The Samba service is divided into two parts that we need to start.

#### Samba ‘smb’ Service

The Samba “Server Message Block” (SMB) services is for sharing files and printers over the local network.

Manual: “[smbd – server to provide SMB/CIFS services to clients][8]“

#### Enable and Start Services

```
For those who are interested in learning more about configuring, enabling, disabling, and managing services, please consider studying the documentation: "Red Hat Enterprise Linux 7: System Administrator's Guide: 10.2. Managing System Services".
```

```
Enable and start smb and nmb services:
~]# systemctl enable smb.service
~]# systemctl start smb.service

Verify smb service:
~]# systemctl status smb.service
```

#### Test Public Sharing (localhost)

To demonstrate allowing and removing access to the public shared folder, create a new user called _samba_test_user_, this user will be granted permissions first to read the public folder, and then access to read and write the public folder.

The same process demonstrated here can be used to grant access to your public shared folder to other users of your computer.

The _samba_test_user_ will be created as a locked user account, disallowing normal login to the computer.

```
Create 'samba_test_user', and lock the account.
~]# useradd samba_test_user
~]# passwd --lock samba_test_user

Set a Samba Password for this Test User (such as 'test'):
~]# smbpasswd -a samba_test_user
```

##### Test Read Only access to the Public Share:

```
Add samba_test_user to the public_readonly group:
~]# gpasswd --add samba_test_user public_readonly

Login to the local Samba Service (public folder):
~]$ smbclient --user=samba_test_user //localhost/public

First, the ls command should succeed,
Second, the mkdir command should not work,
and finally, exit:
smb: \> ls
smb: \> mkdir error
smb: \> exit

Remove samba_test_user from the public_readonly group:
gpasswd --delete samba_test_user public_readonly
```

##### Test Read and Write access to the Public Share:

```
Add samba_test_user to the public_readwrite group:
~]# gpasswd --add samba_test_user public_readwrite

Login to the local Samba Service (public folder):
~]$ smbclient --user=samba_test_user //localhost/public

First, the ls command should succeed,
Second, the mkdir command should work,
Third, the rmdir command should work,
and finally, exit:
smb: \> ls
smb: \> mkdir success
smb: \> rmdir success
smb: \> exit

Remove samba_test_user from the public_readwrite group:
~]# gpasswd --delete samba_test_user public_readwrite
```

After testing is completed, for security, disable the **samba_test_user**‘s ability to login in via samba.

```
Disable samba_test_user login via samba:
~]# smbpasswd -d samba_test_user
```

### Home Folder Sharing

In this last section of the guide; Samba will be configured to share a user home folder.

For example: If the user bob has been registered with _smbpasswd_, bob’s home directory _/home/bob_, would become the share _//server-name/bob_.

This share will only be available for bob, and no other users.

```
This is a very convenient way of accessing your own local files; however naturally it carries at a security risk.
```

#### Setup Home Folder Sharing

##### Give Samba Permission for Public Folder Sharing

```
Set SELinux Boolean allowing Samba to read and write to home folders:
~]# setsebool -P samba_enable_home_dirs=1

Verify bool has been correctly set:
$ getsebool samba_enable_home_dirs

Expected Output:
samba_enable_home_dirs --> on
```

##### Add Home Sharing to the Samba Configuration

**Append the following to the systems smb.conf file:**

```
# The home folder dynamically links to the user home.

# If 'bob' user uses Samba:
# The homes section is used as the template for a new virtual share:

# [homes]
# ...   (various options)

# A virtual section for 'bob' is made:
# Share is modified: [homes] -> [bob]
# Path is added: path = /home/bob
# Any option within the [homes] section is appended.

# [bob]
#       path = /home/bob
# ...   (copy of various options)


# here is our share,
# same as is included in the Fedora default configuration.

[homes]
        comment = Home Directories
        valid users = %S, %D%w%S
        browseable = No
        read only = No
        inherit acls = Yes
```

##### Reload Samba Configuration

```
Tell Samba to reload it's configuration:
~]# smbcontrol all reload-config
```

#### Test Home Directory Sharing

```
Switch to samba_test_user and create a folder in it's home directory:
~]# su samba_test_user
samba_test_user:~]$ cd ~
samba_test_user:~]$ mkdir --verbose test_folder
samba_test_user:~]$ exit

Enable samba_test_user to login via Samba:
~]# smbpasswd -e samba_test_user

Login to the local Samba Service (samba_test_user home folder):
$ smbclient --user=samba_test_user //localhost/samba_test_user

Test (all commands should complete without error):
smb: \> ls
smb: \> ls test_folder
smb: \> rmdir test_folder
smb: \> mkdir home_success
smb: \> rmdir home_success
smb: \> exit

Disable samba_test_user from login in via Samba:
~]# smbpasswd -d samba_test_user
```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-32-simple-local-file-sharing-with-samba/

作者：[da2ce7][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/da2ce7/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/06/sambabasics-816x346.png
[2]: https://www.samba.org/samba/
[3]: https://en.wikipedia.org/wiki/Server_Message_Block
[4]: https://en.wikipedia.org/wiki/Apple_Filing_Protocol
[5]: https://appleinsider.com/articles/13/06/11/apple-shifts-from-afp-file-sharing-to-smb2-in-os-x-109-mavericks
[6]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/storage_administration_guide/ch-filesystem#s3-filesystem-srv
[7]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/selinux_users_and_administrators_guide/chap-managing_confined_services-file_transfer_protocol#sect-Managing_Confined_Services-File_Transfer_Protocol-Types
[8]: https://www.samba.org/samba/docs/current/man-html/smbd.8.html
