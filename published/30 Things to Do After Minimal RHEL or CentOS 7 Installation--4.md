安装完最小化 RHEL/CentOS 7 后需要做的 30 件事情（四）
================================================================================
### 17. 安装 Webmin ###

Webmin 是基于 Web 的 Linux 配置工具。它像一个中央系统，用于配置各种系统设置，比如用户、磁盘分配、服务以及 HTTP 服务器、Apache、MySQL 等的配置。

    # wget http://prdownloads.sourceforge.net/webadmin/webmin-1.740-1.noarch.rpm
    # rpm -ivh webmin-*.rpm

![在 CentOS 7 上安装 Webmin](http://www.tecmint.com/wp-content/uploads/2015/04/Install-Webmin.jpeg)

*安装 Webmin*

安装完 webmin 后，你会在终端上得到一个消息，提示你用 root 密码在端口 10000 登录你的主机 (http://ip-address:10000)。 如果运行的是无接口的服务器你可以转发端口然后从有接口的服务器上访问它。（LCTT 译注：无接口[headless]服务器指没有访问接口或界面的服务器，在此次场景，指的是是出于内网的服务器，可采用外网/路由器映射来访问该端口）

### 18. 启用第三方库 ###

添加不受信任的库并不是一个好主意，尤其是在生产环境中，这可能导致致命的问题。但仅作为例子在这里我们会添加一些社区证实可信任的库，以安装第三方工具和软件包。

为企业版 Linux（EPEL）库添加额外的软件包。

    # yum install epel-release

添加社区企业版 Linux （Community Enterprise Linux）库：

    # rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

![安装 Epel 库](http://www.tecmint.com/wp-content/uploads/2015/04/install-epel-repo.jpeg)

*安装 Epel 库*

**注意！** 添加第三方库的时候尤其需要注意。

### 19. 安装 7-zip 工具 ###

在最小化安装 CentOS 时你并没有获得类似 unzip 或者 untar 的工具。我们可以选择根据需要来安装每个工具，或一个能处理所有格式的工具。7-zip 就是一个能压缩和解压所有已知类型文件的工具。

    # yum install p7zip

![安装 7zip 工具](http://www.tecmint.com/wp-content/uploads/2015/04/Install-7zip-tool.jpeg)

*安装 7zip 工具*

**注意**: 该软件包从 Fedora EPEL 7 的库中下载和安装。

### 20. 安装 NTFS-3G 驱动 ###

NTFS-3G，一个很小但非常有用的 NTFS 驱动，在大部分类 UNIX 发行版上都可用。它对于挂载和访问 Windows NTFS 文件系统很有用。尽管也有其它可用的替代品，比如 Tuxera，但 NTFS-3G 是使用最广泛的。

    # yum install ntfs-3g

![在 CentOS 上安装 NTFS-3G](http://www.tecmint.com/wp-content/uploads/2015/04/Install-NTFS-3G.jpeg)

*安装 NTFS-3G 用于挂载 Windows 分区*

ntfs-3g 安装完成之后，你可以使用以下命令挂载 Windows NTFS 分区（我的 Windows 分区是 /dev/sda5）。

    # mount -ro ntfs-3g /dev/sda5 /mnt
    # cd /mnt
    # ls -l

### 21. 安装 Vsftpd FTP 服务器 ###

VSFTPD 表示 Very Secure File Transfer Protocol Daemon，是用于类 UNIX 系统的 FTP 服务器。它是现今最高效和安全的 FTP 服务器之一。

    # yum install vsftpd

![在 CentOS 7 上安装 Vsftpd](http://www.tecmint.com/wp-content/uploads/2015/04/Install-FTP.jpeg)

*安装 Vsftpd FTP*

编辑配置文件 ‘/etc/vsftpd/vsftpd.conf’ 用于保护 vsftpd。

    # vi /etc/vsftpd/vsftpd.conf

编辑一些值并使其它行保留原样，除非你知道自己在做什么。

    anonymous_enable=NO
    local_enable=YES
    write_enable=YES
    chroot_local_user=YES

你也可以更改端口号，记得让 vsftpd 端口通过防火墙。

    # firewall-cmd --add-port=21/tcp
    # firewall-cmd --reload

下一步重启 vsftpd 并启用开机自动启动。

    # systemctl restart vsftpd
    # systemctl enable vsftpd

### 22. 安装和配置 sudo ###

sudo 通常被称为 super do 或者 suitable user do，是一个类 UNIX 操作系统中用其它用户的安全权限执行程序的软件。让我们来看看怎样配置 sudo。

    # visudo

这会打开 /etc/sudoers 并进行编辑

![sudoers 文件](http://www.tecmint.com/wp-content/uploads/2015/04/sudoers-File.jpeg)

*sudoers 文件*

1. 给一个已经创建好的用户（比如 tecmint）赋予所有权限（等同于 root）。

    	tecmint   ALL=(ALL)    ALL

2. 如果给一个已经创建好的用户（比如 tecmint）赋予除了重启和关闭服务器以外的所有权限（等同于 root）。

	首先，再一次打开文件并编辑如下内容：

    	cmnd_Alias nopermit = /sbin/shutdown, /sbin/reboot

	然后，用逻辑操作符（!）添加该别名。

    	tecmint   ALL=(ALL)    ALL,!nopermit

3. 如果准许一个组（比如 debian）运行一些 root 权限命令，比如（增加或删除用户）。

    	cmnd_Alias permit = /usr/sbin/useradd, /usr/sbin/userdel

	然后，给组 debian 增加权限。

    	debian ALL=(ALL) permit

### 23. 安装并启用 SELinux ###

SELinux 表示 Security-Enhanced Linux，是内核级别的安全模块。

	# yum install selinux-policy

![在 CentOS 7 上安装 SElinux](http://www.tecmint.com/wp-content/uploads/2015/04/Install-SElinux.jpeg)

*安装 SElinux 策略*

查看 SELinux 当前模式。

    # getenforce

![查看 SELinux 模式](http://www.tecmint.com/wp-content/uploads/2015/04/Check-SELinux-Mode.jpeg)

*查看 SELinux 模式*

输出是 Enforcing，意味着 SELinux 策略已经生效。

如果需要调试，可以临时设置 selinux 模式为允许。不需要重启。

    # setenforce 0

调试完了之后再次设置 selinux 为强制模式，无需重启。

    # setenforce 1
    
（LCTT 译注：在生产环境中，SELinux 固然会提升安全，但是也确实会给应用部署和运行带来不少麻烦。具体是否部署，需要根据情况而定。）

### 24. 安装 Rootkit Hunter ###

Rootkit Hunter，简写为 RKhunter，是在 Linux 系统中扫描 rootkits 和其它可能有害攻击的程序。

    # yum install rkhunter

![安装 Rootkit Hunter](http://www.tecmint.com/wp-content/uploads/2015/04/Install-Rootkit-Hunter.jpeg)

*安装 Rootkit Hunter*

在 Linux 中，从脚本文件以计划作业的形式运行 rkhunter 或者手动扫描有害攻击。

    # rkhunter --check

![扫描 rootkits](http://www.tecmint.com/wp-content/uploads/2015/04/Scan-for-rootkits.png)

*扫描 rootkits*

![RootKit 扫描结果](http://www.tecmint.com/wp-content/uploads/2015/04/RootKit-Results.png)

*RootKit 扫描结果*


--------------------------------------------------------------------------------

via: http://www.tecmint.com/things-to-do-after-minimal-rhel-centos-7-installation/4/

作者：[Avishek Kumar][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/