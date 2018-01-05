How To Set Readonly File Permissions On Linux / Unix Web Server DocumentRoot
======

How do I set a read-only permission for all of my files stored in /var/www/html/ directory?

You can use the chmod command to set read-only permission for all files on a Linux / Unix / macOS / Apple OS X / *BSD operating systems. This page explains how to setup read only file permission on Linux or Unix web server such as Nginx, Lighttpd, Apache and more.

[![Proper read-only permissions for Linux/Unix Nginx/Apache web server's directory][1]][1]

### How to set files in read-only mode


The syntax is:
```
### use only for files ##
chmod 0444 /var/www/html/*
chmod 0444 /var/www/html/*.php
```

### How to to set directories in read-only mode

TO set directories in read-only mode, enter:
```
### use only for dirs ##
chmod 0444 /var/www/html/
chmod 0444 /path/to/your/dir/
# ***************************************************************************
# Say webserver user/group is www-data, and file-owned by ftp-data user/group
# ***************************************************************************
# All files/dirs are read-only
chmod -R 0444 /var/www/html/
# All files/dir owned by ftp-data
chown -R ftp-data:ftp-data /var/www/html/
# All directories and sub-dirs has 0445 permission (so that webserver user www-data can read our files)
find /var/www/html/ -type d -print0 | xargs -0 -I {} chmod 0445 "{}"
```
To find all files (including sub-directories in /var/www/html) and set read-only permission, enter:
```
### works on files only ##
find /var/www/html -type f -iname "*" -print0 | xargs -I {} -0 chmod 0444 {}
```

However, you need to set set read-only and execute permission on /var/www/html and all sub-directories so that web server can enter into your DocumentRoot, enter:
```
### works on dirs only ##
find /var/www/html -type d -iname "*" -print0 | xargs -I {} -0 chmod 0544 {}
```

### A warning about write permission

Please note that write access on a directory /var/www/html/ allows anyone to remove or add new files. In other words, you may need to set a read-only permission for /var/www/html/ directory itself:
```
### read-only web-root but web server allowed to read files ##
chmod 0555 /var/www/html
```

In some cases you can change file owner and group to set tight permissions as per your setup:
```
### Say /var/www/html is owned by normal user, you can set it to root:root or httpd:httpd (recommended) ###
chown -R root:root /var/www/html/
 
### Make sure apache user owns /var/www/html/ ##
chown -R apache:apache /var/www/html/
```

### A note about NFS exported directories

You can specify whether the directory should have [read-only or read/write permissions using /etc/exports][2] file. This file defines the various shares on the NFS server and their permissions. A few examples:
```
# Read-only access to anyone
/var/www/html *(ro,sync) 
 
# Read-write access to a client on 192.168.1.10 (upload.example.com)
/var/www/html 192.168.1.10(rw,sync)
```

### A note about read-only Samba (CIFS) share for MS-Windows clients

To share sales as read-only, update smb.conf as follows:
```
[sales]
comment = Sales Data
path = /export/cifs/sales
read only = Yes
guest ok = Yes
```

### A note about file systems table

You can use the /etc/fstab file on Unix or Linux to configure to mount certain files in read-only mode. You need to have a dedicated partition. Do not set / or other system partitions in read-only mode. In this example /srv/html is set to read-only mode using /etc/fstab file:
```
/dev/sda6 /srv/html ext4 ro 1 1
```

You can use the mount command to [remount partition in read-only mode][3] (run it as the root user):
```
# mount -o remount,ro /dev/sda6 /srv/html
```
OR
```
# mount -o remount,ro /srv/html
```
The above command will try to attempt to remount an already-mounted filesystem at /srv/html. This is commonly used to change the mount flags for a filesystem, especially to make a readonly filesystem writeable. It does not change device or mount point. To make file system writable again, enter:
```
# mount -o remount,rw /dev/sda6 /srv/html
```
OR
```
# mount -o remount,rw /srv/html
```

### Linux: chattr Command

You can change file [attributes on a Linux file system to read-only][4] using the chattr command:
```
chattr +i /path/to/file.php
chattr +i /var/www/html/
 
# find everything in /var/www/html and set to read-only #
find /var/www/html -iname "*" -print0 | xargs -I {} -0 chattr +i {}
```

To remove read-only attribute pass the -i option:
```
# chattr -i /path/to/file.php
```
FreeBSD, Mac OS X and other BSD unix user can use the [chflags command][5]:
```
### set read-only ##
chflags schg /path/to/file.php
 
# remove read-only ##
chflags noschg /path/to/file.php
```


--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/howto-set-readonly-file-permission-in-linux-unix/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2012/04/linux-unix-set-read-only-file-system-permission-for-apache-nginx.jpg
[2]:https://www.cyberciti.biz//www.cyberciti.biz/faq/centos-fedora-rhel-nfs-v4-configuration/
[3]:https://www.cyberciti.biz/faq/howto-freebsd-remount-partition/
[4]:https://www.cyberciti.biz/tips/linux-password-trick.html
[5]:https://www.cyberciti.biz/tips/howto-write-protect-file-with-immutable-bit.html
