translating by zsJacky

Setup FTP Server On openSUSE 13.1
================================================================================
**vsftpd** (**V**ery **S**ecure **F**ile **T**ransport **P**rotocol **D**aemon) is a secure, fast FTP server for Unix/Linux systems. In this how-to article, let us see how to setup a basic FTP server using vsftpd on openSUSE 13.1.

### Install vsftpd ###

Login as root user and Enter the following the following command.

    # zypper in vsftpd

Start vsftpd service and make it to start automatically on every reboot.

    # systemctl enable vsftpd.service
    # systemctl start vsftpd.service

### Configure vsftpd ###

Create a folder for ftp users.

    # mkdir /srv/ftp

Create a group called **ftp-users**.

    # groupadd ftp-users

Let us create a sample user called unixmen with home directory **/srv/ftp** and group **ftp-users**.

    # useradd -g ftp-users -d /srv/ftp/ unixmen

Set password for the new user.

    # passwd unixmen

Make the ftp home directory **/srv/ftp/** accessible by ftp users.

    # chmod 750 /srv/ftp/
    # chown unixmen:ftp-users /srv/ftp/

Edit file vsftpd.conf,

    # nano /etc/vsftpd.conf

Make the changes as shown below.

    [...]
    #Uncomment and  Set YES to enable write.
    write_enable=YES
    [...]
    # Uncomment and Set banner name for your website
    ftpd_banner=Welcome to Unixmen FTP service.
    [...]
    # Uncomment
    ls_recurse_enable=YES
    [...]
    # Uncomment and set YES to allow local users to log in.
    local_enable=YES
    [...]
    # To disable anonymous access, set NO.
    anonymous_enable=NO
    [...]
    # Uncomment to enable ascii download and upload.
    ascii_upload_enable=YES
    ascii_download_enable=YES
    [...]
    ## Add at the end of this  file ##
    use_localtime=YES

Save and exit file.

### Test FTP Server Locally ###

First let us try to login to our FTP server as shown below.

    # ftp localhost
    Trying ::1:21 ...
    Connected to localhost.
    220 (vsFTPd 3.0.2)
    Name (localhost:root): unixmen
    331 Please specify the password.
    Password: 
    230 Login successful.
    Remote system type is UNIX.
    Using binary mode to transfer files.
    ftp>

As you in the above output, we will be able to login to ftp server using unixmen user.

### Test FTP Server Remotely ###

By default openSUSE built-in firewall won’t allow to login to FTP from remote systems. So let us allow vsftpd service through suse firewall. To do that go to **Yast -> Security and Users -> Firewall**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/openSUSE-12.3-Running-Oracle-VM-VirtualBox_001.jpg)

In the Firewall section, go to **Allowed Services**. In the zone selection drop down box, select **External Zone** and in Service to Allow drop-down box, select **vsftpd server** and click add.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/openSUSE-12.3-Running-Oracle-VM-VirtualBox_004.jpg)

Click Next and close Yast Control center.

Now try to connect from a remote system.

I tried to login to FTP server from my ubuntu desktop.

    sk@sk:~$ ftp 192.168.1.53
    Connected to 192.168.1.53.
    220 (vsFTPd 3.0.2)
    Name (192.168.1.53:sk): unixmen
    331 Please specify the password.
    Password:
    230 Login successful.
    Remote system type is UNIX.
    Using binary mode to transfer files.
    ftp>

As you see in the above output, I will be able to connect to FTP server. If you doesn’t allow the vsftpd service through firewall you will get a Connection timed out error.

### Connect from Browser ###

Open up your browser and Navigate to **ftp://ip-address/**. Enter the ftp user name and password.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Index-of-ftp-192.168.1.53-Mozilla-Firefox_005.jpg)

### Connect to FTP server using FileZilla ###

Working from command-line mode might be little bit annoying to newbies. So let us install a graphical FTP client called [**Filezilla**][1] to get things done quite easier:

Mostly all distribution will have filezilla client in their official repository. To install filezilla on Linux based systems enter the following command:

On Ubuntu based systems:

    $ sudo apt-get install filezilla

On Fedora/Redhat systems:

    $ sudo yum install filezilla

On openSUSE:

    # zypper in filezilla

After installing filezilla open it. Enter the ftp server IP address, user name and password and click quickconnect.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/unixmen@192.168.1.53-FileZilla_006.jpg)

For added security, you can restrict FTP access to certain users by adding them to **/etc/vsftpd.chroot_list** file.

Edit vsftpd.conf file,

    nano /etc/vsftpd.conf

Make the changes as shown below.

    [...]
    # Uncomment and set YES
    chroot_local_user=YES
    chroot_list_enable=YES
    chroot_list_file=/etc/vsftpd.chroot_list
    [...]

Create **file /etc/vsftpd.chroot_list**,

    nano /etc/vsftpd.chroot_list

Add the users that you want to give access to FTP server. I added the user **unixmen**.

    unixmen

Restart ftp service.

    # systemctl restart vsftpd.service

Now you will be able to connect to FTP server with users who are listed in the chroot list file.

If users other than in the chroot list want to access FTP server, they will get the following error.

    500 OOPS: could not read chroot() list file:/etc/vsftpd.chroot_list
    ftp: Login failed

That’s it for now. Your FTP server is ready to use. Enjoy!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/setup-ftp-server-opensuse-13-1/

译者：[zsJacky](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://filezilla-project.org/