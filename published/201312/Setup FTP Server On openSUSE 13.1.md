在openSUSE 13.1中配置FTP服务器
================================================================================
**vsftpd** （ **非常安全的文件传输协议守护进程**） 是Unix/Linux系统中的一个安全快速的FTP服务器。 在这篇指导教程中，让我们看看在openSUSE 13.1中怎样使用vsftpd来配置一个基本的FTP服务器。

### 安装 vsftpd ###

作为root用户登录然后输入以下命令。

    # zypper in vsftpd

启动 vsftpd 服务然后通过设置使它在每次系统重启时自动启动。

    # systemctl enable vsftpd.service
    # systemctl start vsftpd.service

### 配置 vsftpd ###

为ftp用户新建一个文件夹。

    # mkdir /srv/ftp

创建一个名为 **ftp-users** 的组。

    # groupadd ftp-users

让我们来创建一个叫unixmen的示例用户 并设置其主目录为 **/srv/ftp** 组为 **ftp-users** 。

    # useradd -g ftp-users -d /srv/ftp/ unixmen

为新用户设置密码。

    # passwd unixmen

使ftp主目录 **/srv/ftp/** 可以被ftp用户所访问。 

    # chmod 750 /srv/ftp/
    # chown unixmen:ftp-users /srv/ftp/

编辑 vsftpd.conf 文件

    # nano /etc/vsftpd.conf

设置如下的更改。

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

保存并退出文件。

### 测试本地FTP服务器 ###

首先 让我们按如下步骤尝试登录FTP服务器

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

正如你在上面所输出的那样, 我们能够用unixmen用户登录到ftp服务器。
### 测试远程FTP服务器 ###

默认 openSUSE 内置的防火墙不允许远程系统登录FTP。所以让我们允许vsftpd服务通过suse的防火墙。然后我们需要打开： **Yast -> 安全性与用户 -> 防火墙**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/openSUSE-12.3-Running-Oracle-VM-VirtualBox_001.jpg)

在防火墙界面，进入 **允许服务**. 在区域选择下拉框中，选择 **外部区域** 在服务允许下拉框中，选择 **vsftpd 服务器** 然后点击添加。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/openSUSE-12.3-Running-Oracle-VM-VirtualBox_004.jpg)

单击下一步并关闭Yast控制中心

现在尝试从远程系统连接FTP。

我试着从我的ubuntu桌面系统登录FTP服务器。

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

正如你在上面输出中所看到的，我能够连接到ftp服务器。如果不允许vsftpd服务通过防火墙，你将会得到一个连接超时的报错。

### 从浏览器连接 ###

打开你的浏览器并导航到**ftp://ip-address/**。输入ftp用户名和密码。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/Index-of-ftp-192.168.1.53-Mozilla-Firefox_005.jpg)

### 使用FileZilla连接到FTP服务器 ###

对于新手来说，在命令行模式下工作可能会很烦恼。所以让我们来安装一个叫[**Filezilla**][1]的图形化的FTP客户端。它可以让我们登陆FTP变得更加简单:

几乎所有的发行版在它们的官方软件仓库中都有filezilla客户端。 为了在基于Linux的系统上安装filezilla 需要键入以下的命令:

在基于Ubuntu的系统中:

    $ sudo apt-get install filezilla

在Fedora/Redhat系统中:

    $ sudo yum install filezilla
    
在openSUSE中:

    # zypper in filezilla

安装完fielzilla后打开它。输入ftp服务器的IP地址、用户名和密码，然后点击快速连接。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/11/unixmen@192.168.1.53-FileZilla_006.jpg)

为了增加安全性，你可以通过将用户添加到 **/etc/vsftpd.chroot_list**文件中来限制特定用户对FTP服务器的访问。

编辑 vsftpd.conf 文件,

    nano /etc/vsftpd.conf

设置如下的更改.

    [...]
    # Uncomment and set YES
    chroot_local_user=YES
    chroot_list_enable=YES
    chroot_list_file=/etc/vsftpd.chroot_list
    [...]

创建 **文件 /etc/vsftpd.chroot_list**,

    nano /etc/vsftpd.chroot_list

添加你希望能够访问FTP服务器的用户。我添加了用户**unixmen**。

    unixmen

重启ftp服务.

    # systemctl restart vsftpd.service

现在你能够使用chroot_list文件中列出的用户来连接到FTP服务器。

如果chroot_list以外的用户想访问FTP服务器，他们将得到如下错误提示。

    500 OOPS: could not read chroot() list file:/etc/vsftpd.chroot_list
    ftp: Login failed

就是现在这样，你的FTP服务器已经可以使用了，好好享受吧!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/setup-ftp-server-opensuse-13-1/

译者：[zsJacky](https://github.com/译者ID) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://filezilla-project.org/
