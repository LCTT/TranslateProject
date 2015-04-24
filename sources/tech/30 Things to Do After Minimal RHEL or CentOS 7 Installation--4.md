30 Things to Do After Minimal RHEL/CentOS 7 Installation--4
================================================================================
### 17. Installing Webmin ###

Webmin is a Web based configuration tool for Linux. It acts as a central system to configure various system configuration like users, disk quota, services and configurations of HTTP server, Apache, MySQL, etc.

    # wget http://prdownloads.sourceforge.net/webadmin/webmin-1.740-1.noarch.rpm
    # rpm -ivh webmin-*.rpm

![Install Webmin on CentOS 7](http://www.tecmint.com/wp-content/uploads/2015/04/Install-Webmin.jpeg)
Install Webmin

After webmin installation, you will get a message on terminal to login to your host (http://ip-address:10000) using your root password on port number 10000. If running a headless server you can forward the port and access it on a machine/server that is headed.

### 18. Enable Third Party Repositories ###

It is not a good idea to add untrusted repositories specially in production and it may be fatal. However just for example here we will be adding a few community approved trusted repositories to install third party tools and packages.

Add Extra Package for Enterprise Linux (EPEL) Repository.

    # yum install epel-release

Add Community Enterprise Linux Repository.

    # rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

![Install Epel Repo](http://www.tecmint.com/wp-content/uploads/2015/04/install-epel-repo.jpeg)
Install Epel Repo

**Attention**! Extra care is needs to be taken while adding Third Party Repository.

### 19. Install 7-zip Utility ###

In the CentOS Minimal Install you don’t get utility like unzip or unrar. We have the option to install each utility as required or an utility that servers for all. 7-zip is such an utility which compress and extract files of all known types.

    # yum install p7zip

![Install 7zip Tool](http://www.tecmint.com/wp-content/uploads/2015/04/Install-7zip-tool.jpeg)
Install 7zip Tool

**Notice**: The package is downloaded and installed from Fedora EPEL 7 Repository.

### 20. Install NTFS-3G Driver ###

A small yet very useful NTFS driver called NTFS-3G is available for most of the UNIX-like distribution. It is useful to mount and access Windows NTFS file system. Though other alternatives like Tuxera NTFS is available, NTFS-3G is most widely used.

    # yum install ntfs-3g

![Install NTFS-3G in CentOS](http://www.tecmint.com/wp-content/uploads/2015/04/Install-NTFS-3G.jpeg)
Install NTFS-3G to Mount Windows Partition

After installing ntfs-3g has been installed, you can mount Windows NTFS partitions (where /dev/sda5 is my windows drive) using following command.

    # mount -ro ntfs-3g /dev/sda5 /mnt
    # cd /mnt
    # ls -l

### 21. Install Vsftpd FTP Server ###

VSFTPD which stands for Very Secure File Transfer Protocol Daemon is a FTP server for UNIX-like System. It is one of the most efficient and secure FTP Server available today.

    # yum install vsftpd

![Install Vsftpd in CentOS 7](http://www.tecmint.com/wp-content/uploads/2015/04/Install-FTP.jpeg)
Install Vsftpd FTP

Edit the configuration file located at ‘/etc/vsftpd/vsftpd.conf‘ to secure vsftpd.

    # vi /etc/vsftpd/vsftpd.conf

Edit a few fields and leave other as it is, unless you know what you are doing.

    anonymous_enable=NO
    local_enable=YES
    write_enable=YES
    chroot_local_user=YES

You may also change the port number and open vsftpd port through the firewall.

    # firewall-cmd --add-port=21/tcp
    # firewall-cmd --reload

Next restart vsftpd and enable to start at boot time.

    # systemctl restart vsftpd
    # systemctl enable vsftpd

### 22. Install and Configure sudo ###

sudo which is commonly called as super do as well as suitable user do is a program for UNIX-like operating system to execute a program with the security privileged of another user. Let’s see how to configure sudo…

    # visudo

It will open the file /etc/sudoers for editing..

![sudoers File](http://www.tecmint.com/wp-content/uploads/2015/04/sudoers-File.jpeg)
sudoers File

Give all the permission (equal to root) to a user (say tecmint), that has already been created.

    tecmint   ALL=(ALL)    ALL

Give all the permission (equal to root) to a user (say tecmint), except the permission to reboot and shutdown the server.

Again open the same file and edit it with the below contents.

    cmnd_Alias nopermit = /sbin/shutdown, /sbin/reboot

Then add alias with Logical (!) operator.

    tecmint   ALL=(ALL)    ALL,!nopermit

Give permission to a group (say debian) to run a few root privilege command say (add user and delete user) .

    cmnd_Alias permit = /usr/sbin/useradd, /usr/sbin/userdel

And then add the permission to group debian.

    debian ALL=(ALL) permit

### 23. Install and Enable SELinux ###

SELinux which stands for Security-Enhanced Linux is a security module at kernel level.

# yum install selinux-policy

![Install SElinux in CentOS 7](http://www.tecmint.com/wp-content/uploads/2015/04/Install-SElinux.jpeg)
Install SElinux Policy

Check SELinux Mode.

    # getenforce

![Check SELinux Mode](http://www.tecmint.com/wp-content/uploads/2015/04/Check-SELinux-Mode.jpeg)
Check SELinux Mode

The output is enforcing mode which means SELinux policy is in effect.

For debugging, set selinux mode to permissive temporarily. No need to reboot.

    # setenforce 0

After debugging set selinux to enforcing again without rebooting.

    # setenforce 1

### 24. Install Rootkit Hunter ###

Rootkit Hunter abbreviated as Rkhunter is an application that scan rootkits and other potentially harmful exploits in Linux systems.

    # yum install rkhunter

![Install Rootkit Hunter](http://www.tecmint.com/wp-content/uploads/2015/04/Install-Rootkit-Hunter.jpeg)
Install Rootkit Hunter

Run rkhunter as a scheduled job, from a script file or manually to scan harmful exploits in Linux.

    # rkhunter --check

![Scan for rootkits](http://www.tecmint.com/wp-content/uploads/2015/04/Scan-for-rootkits.png)
Scan for rootkits

![RootKit Scan Results](http://www.tecmint.com/wp-content/uploads/2015/04/RootKit-Results.png)
RootKit Scan Results

--------------------------------------------------------------------------------

via: http://www.tecmint.com/things-to-do-after-minimal-rhel-centos-7-installation/4/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/