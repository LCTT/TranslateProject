如何在 Fedora 22 上配置 Proftpd 服务器
================================================================================
在本文中，我们将了解如何在运行 Fedora 22 的电脑或服务器上使用 Proftpd 架设 FTP 服务器。[ProFTPD][1] 是一款基于 GPL 授权的自由开源 FTP 服务器软件，是 Linux 上的主流 FTP 服务器。它的主要设计目标是提供许多高级功能以及给用户提供丰富的配置选项以轻松实现定制。它具备许多在其他一些 FTP 服务器软件里仍然没有的配置选项。最初它是被开发作为 wu-ftpd 服务器的一个更安全更容易配置的替代。

FTP 服务器是这样一个软件，用户可以通过 FTP 客户端从安装了它的远端服务器上传或下载文件和目录。下面是一些 ProFTPD 服务器的主要功能，更详细的资料可以访问 [http://www.proftpd.org/features.html][2]。

- 每个目录都可以包含 ".ftpaccess" 文件用于访问控制，类似 Apache 的 ".htaccess"
- 支持多个虚拟 FTP 服务器以及多用户登录和匿名 FTP 服务。
- 可以作为独立进程启动服务或者通过 inetd/xinetd 启动
- 它的文件/目录属性、属主和权限是基于 UNIX 方式的。
- 它可以独立运行，保护系统避免 root 访问可能带来的损坏。
- 模块化的设计让它可以轻松扩展其他模块，比如 LDAP 服务器，SSL/TLS 加密，RADIUS 支持，等等。
- ProFTPD 服务器还支持 IPv6.

下面是如何在运行 Fedora 22 操作系统的计算机上使用 ProFTPD 架设 FTP 服务器的一些简单步骤。

### 1. 安装 ProFTPD ###

首先，我们将在运行 Fedora 22 的机器上安装 Proftpd 软件。因为 yum 包管理器已经被抛弃了，我们将使用最新最好的包管理器 dnf。DNF 很容易使用，是 Fedora 22 上采用的非常人性化的包管理器。我们将用它来安装 proftpd 软件。这需要在终端或控制台里用 sudo 模式运行下面的命令。

    $ sudo dnf -y install proftpd proftpd-utils

### 2. 配置 ProFTPD ###

现在，我们将修改软件的一些配置。要配置它，我们需要用文本编辑器编辑 /etc/proftpd.conf 文件。**/etc/proftpd.conf** 文件是 ProFTPD 软件的主要配置文件，所以，这个文件的任何改动都会影响到 FTP 服务器。在这里，是我们在初始步骤里做出的改动。

    $ sudo vi /etc/proftpd.conf

之后，在用文本编辑器打开这个文件后，我们会想改下 ServerName 以及 ServerAdmin，分别填入自己的域名和 email 地址。下面是我们改的。

    ServerName       "ftp.linoxide.com"
    ServerAdmin      arun@linoxide.com

在这之后，我们将把下面的设定加到配置文件里，这样可以让服务器将访问和授权记录到相应的日志文件里。

    ExtendedLog /var/log/proftpd/access.log WRITE,READ default
    ExtendedLog /var/log/proftpd/auth.log AUTH auth

![调整 ProFTPD 设置](http://blog.linoxide.com/wp-content/uploads/2015/06/configuring-proftpd-config.png)

### 3. 添加 FTP 用户 ###

在设定好了基本的配置文件后，我们很自然地希望添加一个以特定目录为根目录的 FTP 用户。目前登录的用户自动就可以使用 FTP 服务，可以用来登录到 FTP 服务器。但是，在这篇教程里，我们将创建一个以 ftp 服务器上指定目录为主目录的新用户。

下面，我们将建立一个名字是 ftpgroup 的新用户组。

    $ sudo groupadd ftpgroup

然后，我们将以目录 /ftp-dir/ 作为主目录增加一个新用户 arunftp 并加入这个组中。

    $ sudo useradd -G ftpgroup arunftp -s /sbin/nologin -d /ftp-dir/

在创建好用户并加入用户组后，我们将为用户 arunftp 设置一个密码。

    $ sudo passwd arunftp

    Changing password for user arunftp.
    New password:
    Retype new password:
    passwd: all authentication tokens updated successfully.

现在，我们将通过下面命令为这个 ftp 用户设定主目录的读写权限（LCTT 译注：这是SELinux 相关设置，如果未启用 SELinux，可以不用）。

    $ sudo setsebool -P allow_ftpd_full_access=1
    $ sudo setsebool -P ftp_home_dir=1

然后，我们会设定不允许其他用户移动或重命名这个目录以及里面的内容。

    $ sudo chmod -R 1777 /ftp-dir/

### 4. 打开 TLS 支持 ###

目前 FTP 所用的加密手段并不安全，任何人都可以通过监听网卡来读取 FTP 传输的数据。所以，我们将为自己的服务器打开 TLS 加密支持。这样的话，需要编辑 /etc/proftpd.conf 配置文件。在这之前，我们先备份一下当前的配置文件，可以保证在改出问题后还可以恢复。

    $ sudo cp /etc/proftpd.conf /etc/proftpd.conf.bak

然后，我们可以用自己喜欢的文本编辑器修改配置文件。

    $ sudo vi /etc/proftpd.conf

然后，把下面几行附加到我们在第 2 步中所增加内容的后面。

    TLSEngine on
    TLSRequired on
    TLSProtocol SSLv23
    TLSLog /var/log/proftpd/tls.log
    TLSRSACertificateFile /etc/pki/tls/certs/proftpd.pem
    TLSRSACertificateKeyFile /etc/pki/tls/certs/proftpd.pem

![打开 TLS 配置](http://blog.linoxide.com/wp-content/uploads/2015/06/tls-configuration.png)

完成上面的设定后，保存退出。

然后，我们需要生成 SSL 凭证 proftpd.pem 并放到 **/etc/pki/tls/certs/** 目录里。这样的话，首先需要在 Fedora 22 上安装 openssl。

    $ sudo dnf install openssl

然后，可以通过执行下面的命令生成 SSL 凭证。

    $ sudo openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/pki/tls/certs/proftpd.pem -out /etc/pki/tls/certs/proftpd.pem

系统会询问一些将写入凭证里的基本信息。在填完资料后，就会生成一个 2048 位的 RSA 私钥。

    Generating a 2048 bit RSA private key
    ...................+++
    ...................+++
    writing new private key to '/etc/pki/tls/certs/proftpd.pem'
    -----
    You are about to be asked to enter information that will be incorporated
    into your certificate request.
    What you are about to enter is what is called a Distinguished Name or a DN.
    There are quite a few fields but you can leave some blank
    For some fields there will be a default value,
    If you enter '.', the field will be left blank.
    -----
    Country Name (2 letter code) [XX]:NP
    State or Province Name (full name) []:Narayani
    Locality Name (eg, city) [Default City]:Bharatpur
    Organization Name (eg, company) [Default Company Ltd]:Linoxide
    Organizational Unit Name (eg, section) []:Linux Freedom
    Common Name (eg, your name or your server's hostname) []:ftp.linoxide.com
    Email Address []:arun@linoxide.com

在这之后，我们要改变所生成凭证文件的权限以增加安全性。

    $ sudo chmod 600 /etc/pki/tls/certs/proftpd.pem

### 5. 允许 FTP 通过 Firewall ###

现在，需要允许 ftp 端口，一般默认被防火墙阻止了。就是说，需要允许 ftp 端口能通过防火墙访问。

如果 **打开了 TLS/SSL 加密**，执行下面的命令。

    $ sudo firewall-cmd --add-port=1024-65534/tcp
    $ sudo firewall-cmd --add-port=1024-65534/tcp --permanent

如果 **没有打开 TLS/SSL 加密**，执行下面的命令。

    $ sudo firewall-cmd --permanent --zone=public --add-service=ftp

    success

然后，重新加载防火墙设定。

    $ sudo firewall-cmd --reload

    success

### 6. 启动并激活 ProFTPD ###

全部设定好后，最后就是启动 ProFTPD 并试一下。可以运行下面的命令来启动 proftpd ftp 守护程序。

    $ sudo systemctl start proftpd.service

然后，我们可以设定开机启动。

    $ sudo systemctl enable proftpd.service

    Created symlink from /etc/systemd/system/multi-user.target.wants/proftpd.service to /usr/lib/systemd/system/proftpd.service.

### 7. 登录到 FTP 服务器 ###

现在，如果都是按照本教程设置好的，我们一定可以连接到 ftp 服务器并使用以上设置的信息登录上去。在这里，我们将配置一下 FTP 客户端 filezilla，使用 **服务器的 IP 或名称 **作为主机名，协议选择 **FTP**，用户名填入 **arunftp**，密码是在上面第 3 步中设定的密码。如果你按照第 4 步中的方式打开了 TLS 支持，还需要在加密类型中选择 **要求显式的基于 TLS 的 FTP**，如果没有打开，也不想使用 TLS 加密，那么加密类型选择 **简单 FTP**。

![FTP 登录细节](http://blog.linoxide.com/wp-content/uploads/2015/06/ftp-login-details.png)

要做上述设定，需要打开菜单里的文件，点击站点管理器，然后点击新建站点，再按上面的方式设置。

![FTP SSL 凭证](http://blog.linoxide.com/wp-content/uploads/2015/06/ftp-ssl-certificate.png)

随后系统会要求允许 SSL 凭证，点确定。之后，就可以从我们的 FTP 服务器上传下载文件和文件夹了。

### 总结 ###

最后，我们成功地在 Fedora 22 机器上安装并配置好了 Proftpd FTP 服务器。Proftpd 是一个超级强大，能高度定制和扩展的 FTP 守护软件。上面的教程展示了如何配置一个采用 TLS 加密的安全 FTP 服务器。强烈建议设置 FTP 服务器支持 TLS 加密，因为它允许使用 SSL 凭证加密数据传输和登录。本文中，我们也没有配置 FTP 的匿名访问，因为一般受保护的 FTP 系统不建议这样做。 FTP 访问让人们的上传和下载变得非常简单也更高效。我们还可以改变用户端口增加安全性。好吧，如果你有任何疑问，建议，反馈，请在下面评论区留言，这样我们就能够改善并更新文章内容。谢谢！玩的开心 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/configure-ftp-proftpd-fedora-22/

作者：[Arun Pyasi][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.proftpd.org/
[2]:http://www.proftpd.org/features.html
