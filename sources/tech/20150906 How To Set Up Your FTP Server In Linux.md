How To Set Up Your FTP Server In Linux
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Setup-FTP-Server-in-Linux.jpg)

In this lesson, I will explain to you how to Set up your FTP server. But first, let me quickly tell you what is  FTP.

### What is FTP? ###

[FTP][1] is an acronym for File Transfer Protocol. As the name suggests, FTP is used to transfer files between computers on a network. You can use FTP to exchange files between computer accounts, transfer files between an account and a desktop computer, or access online software archives. Keep in mind, however, that many FTP sites are heavily used and require several attempts before connecting.

An FTP address looks a lot like an HTTP or website address except it uses the prefix ftp:// instead of http://.

### What is an FTP Server? ###

Typically, a computer with an FTP address is dedicated to receive an FTP connection. A computer dedicated to receiving an FTP connection is referred to as an FTP server or FTP site.

Now, let’s begin a special adventure. We will make FTP server to share files with friends and family. I will use [vsftpd][2] for this purpose.

VSFTPD is an FTP server software which claims to be the most secure FTP software. In fact, the first two letters in VSFTPD, stand for “very secure”. The software was built around the vulnerabilities of the FTP protocol.

Nevertheless, you should always remember that there are better solutions for secure transfer and management of files such as SFTP (uses [OpenSSH][3]). The FTP protocol is particularly useful for sharing non-sensitive data and is very reliable at that.

#### Installing VSFTPD in rpm distributions: ####

You can quickly install VSFTPD on your server through the command line interface with:

    dnf -y install vsftpd

#### Installing VSFTPD  in deb distributions: ####

You can quickly install VSFTPD on your server through the command line interface with:

sudo apt-get install vsftpd

#### Installing VSFTPD in Arch distribution: ####

You can quickly install VSFTPD on your server through the command line interface with:

    sudo pacman -S vsftpd

#### Configuring FTP server ####

Most VSFTPD’s configuration takes place in /etc/vsftpd.conf. The file itself is well-documented, so this section only highlights some important changes you may want to make. For all available options and basic documentation see the man pages:

    man vsftpd.conf

Files are served by default from /srv/ftp as per the Filesystem Hierarchy Standard.

**Enable Uploading:**

The “write_enable” flag must be set to YES in order to allow changes to the filesystem, such as uploading:

    write_enable=YES

**Allow Local Users to Login:**

In order to allow users in /etc/passwd to login, the “local_enable” directive must look like this:

local_enable=YES

**Anonymous Login**

The following lines control whether anonymous users can login:

    # Allow anonymous login

anonymous_enable=YES
# No password is required for an anonymous login (Optional)
no_anon_password=YES
# Maximum transfer rate for an anonymous client in Bytes/second (Optional)
anon_max_rate=30000
# Directory to be used for an anonymous login (Optional)
anon_root=/example/directory/

**Chroot Jail**

It is possible to set up a chroot environment, which prevents the user from leaving his home directory. To enable this, add/change the following lines in the configuration file:

    chroot_list_enable=YES chroot_list_file=/etc/vsftpd.chroot_list

The “chroot_list_file” variable specifies the file in which the jailed users are contained to.

In the end  you must restart your ftp server. Type in your command line

    sudo systemctl restart vsftpd

That’s it. Your FTP server is up and running.

--------------------------------------------------------------------------------

via: http://itsfoss.com/set-ftp-server-linux/

作者：[alimiracle][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/ali/
[1]:https://en.wikipedia.org/wiki/File_Transfer_Protocol
[2]:https://security.appspot.com/vsftpd.html
[3]:http://www.openssh.com/